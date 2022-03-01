using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Excel = Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;
using System.Diagnostics;

namespace StringFormat
{
    class ExcelTest
    {
        private static void ReleaseExcelObject(object obj)
        {
            try
            {
                if (obj != null)
                {
                    Marshal.ReleaseComObject(obj);
                    obj = null;
                }
            }
            catch (Exception ex)
            {
                obj = null;
                throw ex;
            }
            finally
            {
                GC.Collect();
            }
        }


        public static void RunTest()
        {
            List<string> testData = new List<string>()
            { "Excel", "Access", "Word", "OneNote" };

            Excel.Application excelApp = null;
            Excel.Workbook wb = null;
            Excel.Worksheet ws = null;

            try
            {
                // Excel 첫번째 워크시트 가져오기                
                excelApp = new Excel.Application();
                wb = excelApp.Workbooks.Add();
                ws = wb.Worksheets.get_Item(1) as Excel.Worksheet;

                // 데이타 넣기
                int r = 1;
                foreach (var d in testData)
                {
                    ws.Cells[r, 1] = d;
                    r++;
                }

                // 엑셀파일 저장
                wb.SaveAs(@"C:\temp\test.xls", Excel.XlFileFormat.xlWorkbookNormal);
                wb.Close(true);
                excelApp.Quit();
            }
            finally
            {
                // Clean up
                ReleaseExcelObject(ws);
                ReleaseExcelObject(wb);
                ReleaseExcelObject(excelApp);
            }
        }




        public void ReadExcelData()
        {
            Excel.Application excelApp = null;
            Excel.Workbook wb = null;
            Excel.Worksheet ws = null;

            try
            {
                excelApp = new Excel.Application();

                // 엑셀 파일 열기
                wb = excelApp.Workbooks.Open(@"D:\frontend_개발.xlsx");

                // 첫번째 Worksheet
                ws = wb.Worksheets.get_Item(1) as Excel.Worksheet;

                // 현재 Worksheet에서 사용된 Range 전체를 선택
                Excel.Range rng = ws.UsedRange;

                // 현재 Worksheet에서 일부 범위만 선택
                // Excel.Range rng = ws.Range[ws.Cells[2, 1], ws.Cells[5, 3]];

                // Range 데이타를 배열 (One-based array)로
                object[,] data = rng.Value;

                for (int r = 1; r <= data.GetLength(0); r++)
                {
                    for (int c = 1; c <= data.GetLength(1); c++)
                    {
                        //Debug.Write(data[r, c].ToString() + " ");
                        Console.Write(data[r, c].ToString() + " ");
                    }
                    Debug.WriteLine("");
                    Console.WriteLine("");
                }

                wb.Close(true);
                excelApp.Quit();
            }
            finally
            {
                // Clean up
                ReleaseExcelObject(ws);
                ReleaseExcelObject(wb);
                ReleaseExcelObject(excelApp);
            }
        }


    }
}
