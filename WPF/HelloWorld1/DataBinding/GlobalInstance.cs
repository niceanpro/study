using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBinding
{
    class GlobalInstance
    {
        static public GlobalInstance Singleton
        {
            get;
            private set;
        }

        static GlobalInstance()
        {
            Singleton = new GlobalInstance();
        }

       // DataTable dt = new DataTable("MemberTable");
    }
}
