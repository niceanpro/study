using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringFormat
{

    public class TColumn
    {
        public string table_schema;
        public string column_name;
        public string is_nullable;
        public string character_maximum_length;
        public string udt_name;

        public TColumn(string _table_schema, string _column_name, string _is_nullable, string _character_maximum_length, string _udt_name)
        {
            this.table_schema = _table_schema;
            this.column_name = _column_name;
            this.is_nullable = _is_nullable;
            this.character_maximum_length = _character_maximum_length;
            this.udt_name = _.udt_name;
        }
    }


    Dictionary<string, TColumn> tcDic = new Dictionary<string, TColumn>;

    class Program
    {
        static void Main(string[] args)
        {


            func1();
            fTuple();
            Fbasic();
            // Console.ReadLine();

            DBPostgresql a = new DBPostgresql();
            a.Read();

            ExcelTest et = new ExcelTest();
            et.ReadExcelData();

            WriteHtmlJS hjs = new WriteHtmlJS();
            hjs.GenUpdate();


        }


        static public void func1()
        {
            float pricePerOunce = 17.36f;
            String s = String.Format("The current price is {0:C2} per ounce.",
                                     pricePerOunce);
            Console.WriteLine(s);
            // Result: The current price is 17.36 per ounce.


            int[] years = { 2013, 2014, 2015 };
            int[] population = { 1025632, 1105967, 1148203 };

            String sf = String.Format("{0,6} {1,15}\n\n", "Year", "Population");
            for (int index = 0; index < years.Length; index++)
                sf += String.Format("{0,6} {1,15:N0}\n",
                                   years[index], population[index]);

            Console.WriteLine(sf);

            sf = String.Format("{0,-10} {1,-10}\n\n", "Year", "Population");
            for (int index = 0; index < years.Length; index++)
                sf += String.Format("{0,-10} {1,-10:N0}\n",
                                   years[index], population[index]);

            Console.WriteLine(sf);
        }

        static public void fTuple()
        {
            Tuple<string, DateTime, int, DateTime, int>[] cities =
          { Tuple.Create("Los Angeles", new DateTime(1940, 1, 1), 1504277,
                         new DateTime(1950, 1, 1), 1970358),
            Tuple.Create("New York", new DateTime(1940, 1, 1), 7454995,
                         new DateTime(1950, 1, 1), 7891957),
            Tuple.Create("Chicago", new DateTime(1940, 1, 1), 3396808,
                         new DateTime(1950, 1, 1), 3620962),
            Tuple.Create("Detroit", new DateTime(1940, 1, 1), 1623452,
                         new DateTime(1950, 1, 1), 1849568) };

            // Display header
            string header = String.Format("{0,-12}{1,8}{2,12}{1,8}{2,12}{3,14}\n",
                                          "City", "Year", "Population", "Change (%)");
            Console.WriteLine(header);
            string output;
            foreach (var city in cities)
            {
                output = String.Format("{0,-12}{1,8:yyyy}{2,12:N0}{3,8:yyyy}{4,12:N0}{5,14:P1}",
                                       city.Item1, city.Item2, city.Item3, city.Item4, city.Item5,
                                       (city.Item5 - city.Item3) / (double)city.Item3);
                Console.WriteLine(output);
            }

        }

        enum Color { Yellow = 1, Blue, Green};
        static DateTime thisDate = DateTime.Now;
        static public void Fbasic()
        {

            string s = "";

            Console.WriteLine("\n\n\n");

            //Console.Clear();

            // Format a negative integer or floating-point number in various ways.
            Console.WriteLine("Standard Numeric Format Specifiers");
            s = String.Format(
            "(C) Currency: . . . . . . . . {0:C}\n" +
            "(D) Decimal:. . . . . . . . . {0:D}\n" +
            "(E) Scientific: . . . . . . . {1:E}\n" +
            "(F) Fixed point:. . . . . . . {1:F}\n" +
            "(G) General:. . . . . . . . . {0:G}\n" +
            "    (default):. . . . . . . . {0} (default = 'G')\n" +
            "(N) Number: . . . . . . . . . {0:N}\n" +
            "(P) Percent:. . . . . . . . . {1:P}\n" +
            "(R) Round-trip: . . . . . . . {1:R}\n" +
            "(X) Hexadecimal:. . . . . . . {0:X}\n",
            -123, -123.45f);
            Console.WriteLine(s);

            // Format the current date in various ways.
            Console.WriteLine("Standard DateTime Format Specifiers");
            s = String.Format(
            "(d) Short date: . . . . . . . {0:d}\n" +
            "(D) Long date:. . . . . . . . {0:D}\n" +
            "(t) Short time: . . . . . . . {0:t}\n" +
            "(T) Long time:. . . . . . . . {0:T}\n" +
            "(f) Full date/short time: . . {0:f}\n" +
            "(F) Full date/long time:. . . {0:F}\n" +
            "(g) General date/short time:. {0:g}\n" +
            "(G) General date/long time: . {0:G}\n" +
            "    (default):. . . . . . . . {0} (default = 'G')\n" +
            "(M) Month:. . . . . . . . . . {0:M}\n" +
            "(R) RFC1123:. . . . . . . . . {0:R}\n" +
            "(s) Sortable: . . . . . . . . {0:s}\n" +
            "(u) Universal sortable: . . . {0:u} (invariant)\n" +
            "(U) Universal sortable: . . . {0:U}\n" +
            "(Y) Year: . . . . . . . . . . {0:Y}\n",
            thisDate);
            Console.WriteLine(s);

            // Format a Color enumeration value in various ways.
            Console.WriteLine("Standard Enumeration Format Specifiers");
            s = String.Format(
            "(G) General:. . . . . . . . . {0:G}\n" +
            "    (default):. . . . . . . . {0} (default = 'G')\n" +
            "(F) Flags:. . . . . . . . . . {0:F} (flags or integer)\n" +
            "(D) Decimal number: . . . . . {0:D}\n" +
            "(X) Hexadecimal:. . . . . . . {0:X}\n",
            Color.Green);
            Console.WriteLine(s);
        }
    }
}
