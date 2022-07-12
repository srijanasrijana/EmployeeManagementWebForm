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
    public class DLLEmployee
    {
        public string SaveEmployee(EmpEmployee objEmployee)
        {
            string alert = "";
            SqlConnection con = DAO.getConnection();
            using (con)
            {
                SqlTransaction tran;
                tran = con.BeginTransaction();
                try
                {
                    SqlCommand cmd;
                    if (objEmployee.Action != null)
                    {
                        if (objEmployee.Action == "A")
                        {
                            cmd = new SqlCommand("spInsertEmployee", con, tran);
                        }
                        else
                        {
                            cmd = new SqlCommand("spUpdateEmployee", con, tran);
                        }
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@EmpName", SqlDbType.VarChar, 200).Value = objEmployee.Name;
                        cmd.Parameters.Add("@Gender", SqlDbType.VarChar, 200).Value = objEmployee.Gender;
                        cmd.Parameters.Add("@DOB", SqlDbType.VarChar, 200).Value = objEmployee.DOB;
                        cmd.Parameters.Add("@salary", SqlDbType.VarChar, 200).Value = objEmployee.Salary;
                        cmd.Parameters.Add("@EntryBy", SqlDbType.VarChar, 200).Value = "hp";
                        cmd.Parameters.Add("@EntryDate", SqlDbType.VarChar, 200).Value = DateTime.Now;

                        cmd.Parameters.Add("@id", SqlDbType.Int).Value = objEmployee.EmployeeId;
                        if (objEmployee.Action == "A")
                        {
                            cmd.Parameters["@id"].Direction = ParameterDirection.Output;
                        }
                        cmd.ExecuteNonQuery();
                        objEmployee.EmployeeId = objEmployee.Action == "A" ? (int)cmd.Parameters["@id"].Value : objEmployee.EmployeeId;

                        //  SqlParameter param = cmd.Parameters.AddWithValue("@Return", null);

                        //  objDoctor.DoctorId = (int)cmd.Parameters["@Return"].Value;
                        if (objEmployee.Action == "A")
                        {
                            foreach (var item in objEmployee.Qualification)
                            {
                                item.EmployeeId = objEmployee.EmployeeId;
                            }
                            DLLQualification dllQualification = new DLLQualification();
                            dllQualification.SaveQualification(objEmployee.Qualification, con, tran);
                        }
                        else
                        {
                            foreach (var item in objEmployee.Qualification)
                            {
                                item.EmployeeId = objEmployee.EmployeeId;
                            }
                            DLLQualification dllQualification = new DLLQualification();
                            dllQualification.SaveQualification(objEmployee.Qualification, con, tran);
                        }
                        tran.Commit();
                    }
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    throw new Exception("Error" + ex.Message);
                }
            }
            return alert;


        }

        public List<EmpEmployee> GetEmployee()
        {
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
            List<EmpEmployee> lstEmployee = new List<EmpEmployee>();

            //SqlCommand cmd = new SqlCommand("GetDoctor", con);
            //cmd.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            ds = DAO.gettable("spGetEmployee", null);

            if (ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    EmpEmployee objEmplo = new EmpEmployee();

                    objEmplo.EmployeeId = Convert.ToInt32(dr["Employee_id"]);
                    objEmplo.Name = dr["Emp_Name"].ToString();
                    objEmplo.Gender = dr["Gender"].ToString();
                    objEmplo.DOB = dr["DOB"].ToString();
                    objEmplo.Salary = dr["Salary"].ToString();


                    lstEmployee.Add(objEmplo);
                }

            }
            return lstEmployee;

        }

        public List<EmpEmployee> GetEmployeeDetailsById(string EmployeeId)
        {
            DLLQualification dd = new DLLQualification();
            List<EmpEmployee> lstDetails = new List<EmpEmployee>();

            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@EmployeeID", EmployeeId);
            ds = DAO.gettable("spGetEmployeeDetailById", param);


            if (ds.Tables[0].Rows.Count > 0)
            {

                foreach (DataRow dr in ds.Tables[0].Rows)
                {

                    EmpEmployee objDoc = new EmpEmployee
                    {
                        EmployeeId = Convert.ToInt32(dr["Employee_id"]),
                        Name = dr["Emp_Name"].ToString(),
                        DOB = dr["DOB"].ToString(),
                        Gender = dr["Gender"].ToString(),
                        Salary = dr["Salary"].ToString()
                    };
                    objDoc.Qualification = dd.GetQualificationDetails(objDoc.EmployeeId);
                    lstDetails.Add(objDoc);


                }

            }
            return lstDetails;

        }

        public string DeleteEmployees(int employeeId)
        {
            string alert = "";
            SqlConnection con = DAO.getConnection();

            using (con)
            {
                SqlTransaction tran;
                tran = con.BeginTransaction();
                try
                {

                    SqlCommand cmd;
                    cmd = new SqlCommand("spDeleteEmployee", con, tran);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeId);

                    //  SqlParameter param = cmd.Parameters.AddWithValue("@Return", null);

                    cmd.ExecuteNonQuery();
                    tran.Commit();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    throw new Exception("Error" + ex.Message);
                }
            }
            return alert;
        }


    }
}