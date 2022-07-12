using EmployeeMgtProject.Model;
using EmployeeMgtProject.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.DLL
{
    public class DLLQualification
    {
        public void SaveQualification(List<EmpQualification> qua, SqlConnection con, SqlTransaction tran)
        {
            try
            {
                SqlCommand cmd;
                foreach (var employee in qua)
                {
                    if (employee.Action == "A")
                    {
                        cmd = new SqlCommand("spInsertQualification", con, tran)
                        {
                            CommandType = CommandType.StoredProcedure
                        };

                        cmd.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                        cmd.Parameters.AddWithValue("@QualId", employee.QualificationId);
                        cmd.Parameters.AddWithValue("@Marks", employee.Marks);
                    }
                    else if (employee.Action == "E")
                    {
                        cmd = new SqlCommand("spUpdateQualification", con, tran)
                        {
                            CommandType = CommandType.StoredProcedure
                        };

                        cmd.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                        cmd.Parameters.AddWithValue("@QualId", employee.QualificationId);
                        cmd.Parameters.AddWithValue("@Marks", employee.Marks);
                    }
                    else
                    {
                        cmd = new SqlCommand("spDeleteQualification", con, tran)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                        cmd.Parameters.AddWithValue("@QualId", employee.QualificationId);                       
                    }
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public List<EmpQualification> GetQualificationDetails(int EmployeeId)
        {
            List<EmpQualification> lstQualification = new List<EmpQualification>();
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@EmployeeId", EmployeeId);
            ds = DAO.gettable("spGetQualificationDetails", param);

            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    EmpQualification objEmp = new EmpQualification
                    {
                        EmployeeId = Convert.ToInt32(dr["Employee_id"]),
                        QualificationName = dr["Q_Name"].ToString(),
                        QualificationId = Convert.ToInt32(dr["Q_id"]),
                        Marks = dr["Marks"].ToString(),
                        Action = "E"
                    };
                    lstQualification.Add(objEmp);
                }

            }
            return lstQualification;

        }
    }
}