using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace StringFormat
{
    class DBPostgresql
    {
        private static string Host = "211.193.31.18";
        private static string User = "postgres";
        private static string DBname = "postgres";
        private static string Password = "new1234!@";
        private static string Port = "5432";

        private static string schema = "saehan";
        private static string table = "tb_member";

        public void Read()
        {
            #region 1. connect string
            string connString =
            String.Format(
                "Server={0}; User Id={1}; Database={2}; Port={3}; Password={4};",
                Host,
                User,
                DBname,
                Port,
                Password);
            #endregion

            using (var conn = new NpgsqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    using (var cmd = new NpgsqlCommand())
                    {
                        cmd.Connection = conn;
                        cmd.CommandText =//  "select * from saehan.tb_member";
                            string.Format(
                                         "select k.table_schema, k.column_name, k.is_nullable, k.data_type, k.character_maximum_length, k.udt_name, a.p_tname, a.p_attname, a.p_data_type "
                                        + " from "
                                        +  "  ( "
                                        +  "      SELECT * "
                                        +  "      FROM information_schema.columns c "
                                        +  "      WHERE table_schema = '{0}' AND table_name = '{1}' "
                                        +  "  ) k "
                                        +  "  left outer join "
                                        +  "  ( "
                                        +  "      SELECT '{1}'::text as p_tname, a.attname as p_attname, format_type(a.atttypid, a.atttypmod) AS p_data_type "
                                        +  "      FROM   pg_index i "
                                        +  "      JOIN   pg_attribute a  "
                                        +  "      ON a.attrelid = i.indrelid AND a.attnum = ANY(i.indkey) "
                                        +  "      WHERE  i.indrelid = '{0}.{1}'::regclass AND    i.indisprimary "
                                        +  "  ) a "
                                        +  "  on k.table_name = a.p_tname", schema, table);
                        using (var reader = cmd.ExecuteReader())
                        {
                            Console.WriteLine("table column 수 = {0} 개", reader.FieldCount);


                            string header = String.Format("{0,20}{1,20}{2,20}{3,20}{4,20}{5,20}{6,20}{7,20}{8,20}\n",
                                          "table_schema", "column_name", "is_nullable", "data_type", "character_maximum_length", "udt_name", "p_tname", "p_attname", "p_data_type" );
                            Console.WriteLine(header);
                            while (reader.Read())
                            {
                                // 각각의 항목 읽어 들이는 방법들... 
                                // Console.WriteLine(reader.GetString(0)); 
                                // Console.WriteLine(reader.GetValue(3)); 
                                // Console.WriteLine(reader["email_address"] as string);

                                var data = new string[]
                                {
                                    reader["table_schema"].ToString(),
                                    reader["column_name"].ToString(),
                                    reader["is_nullable"].ToString(),
                                    reader["data_type"].ToString(),
                                    reader["character_maximum_length"].ToString(),
                                    reader["udt_name"].ToString(),
                                    reader["p_tname"].ToString(),
                                    reader["p_attname"].ToString(),
                                    reader["p_data_type"].ToString()
                                };

                                //                                foreach (var x in data)
                                //                                {
                                //                                    Console.Write(x);
                                //                                    Console.Write(" -- ");
                                //                                }

                                string dd = String.Format("{0,20}{1,20}{2,20}{3,20}{4,20}{5,20}{6,20}{7,20}{8,20}\n", data);
                            //    String dd = String.Format("{0,20}{1,30}{2,20}{3,30:d}\n", data);
                                Console.WriteLine(dd);

                                Console.WriteLine();
                            }

                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("============== Error ==============");
                    Console.WriteLine(ex.Message);
                }
            }
            Console.ReadLine();
        }
    }
}