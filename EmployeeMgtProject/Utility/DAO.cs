using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.Utility
{
    public static class DAO
    {
        static DAO()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static string connectionStr
        {
            get { return ConfigurationManager.ConnectionStrings["mycon"].ConnectionString; }
        }

        public static SqlConnection getConnection()
        {
            SqlConnection con = new SqlConnection(DAO.connectionStr);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            return con;
        }


        public static DataSet gettable(string StoreProcName, SqlParameter[] param)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = DAO.getConnection())
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = StoreProcName;
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        da.Fill(ds);

                    }
                    return ds;
                }
            }


        }
    }
}