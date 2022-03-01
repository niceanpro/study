using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace FileIO
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            int v1 = 12;
            float v2 = 3.14f;
            string st = "Hello World";

            FileStream fs = new FileStream("test.txt", FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);

            sw.Write(v1);
            sw.Write(v2);
            sw.Write(st);
            sw.Write("{0} {1}", st, st);
            sw.Close();
        }
    }
}
