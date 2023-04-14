using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JQueryAutoCompleteTextBox
{
    [Serializable]
    public class Employees
    {
        public int EmpDbKey { get; set; }
        public string EmpName { get; set; }
        public string Address { get; set; }
    }
}