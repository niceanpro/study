using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBinding
{
    class Member
    {
        public string Name
        {
            get;
            private set;
        }

        public string Id
        {
            get;
            private set;
        }

        public Member (string name, string id)
        {
            Name = name;
            Id = id;
        }
    }
}
