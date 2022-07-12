using EmployeeMgtProject.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.DLL
{
    public class DLLQualificationList
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        public List<EmpQualificationList> GetQualificationList()
        {
            List<EmpQualificationList> lstQualificationList = new List<EmpQualificationList>();

            SqlCommand cmd = new SqlCommand("spGetQualificationList", con);
            cmd.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            ds = new DataSet();
            
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    EmpQualificationList objEmp = new EmpQualificationList();
                    objEmp.QualificationId = Convert.ToInt32(dr["Q_id"]);
                    objEmp.QualificationName = dr["Q_Name"].ToString();
                    

                    lstQualificationList.Add(objEmp);
                }

            }
            return lstQualificationList;


        }
    }
}