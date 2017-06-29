using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace recipes.Util
{
    public static class Utilities
    {
        public static string DataName(string t_name)
        {
            string[] data = t_name.Split('_');
            string name = "";
            foreach (string item in data)
            {
                name += item.First();
            }
            return name + t_name;
        }
    }
}