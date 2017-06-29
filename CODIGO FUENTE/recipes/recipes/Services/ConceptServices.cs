using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class ConceptServices
    {
        internal static DataTable GetConcept(int concept)
        {
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S1");
                command.Parameters.AddWithValue("i_concept", concept);
                result = GeneralServices.ExecuteQuery(command, "recipes..sp_concept");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}