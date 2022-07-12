using EmployeeMgtProject.DLL;
using EmployeeMgtProject.Model;
using EmployeeMgtProject.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.BLL
{
    public class BLLEmployee
    {
        public JsonResponse SaveEmployee(EmpEmployee Emp)
        {
            JsonResponse response = new JsonResponse();
            try
            {
                DLLEmployee employee = new DLLEmployee();
                response.ResponseData = employee.SaveEmployee(Emp);
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.ResponseData = ex.Message;
                response.ResponseData = false;
            }
            return response;
        }

        public JsonResponse GetEmployee()
        {
            JsonResponse response = new JsonResponse();
            try
            {

                DLLEmployee objDll = new DLLEmployee();
                response.ResponseData = objDll.GetEmployee();
                response.IsSuccess = true;

            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                response.IsSuccess = false;

            }
            return response;

        }

        public JsonResponse GetEmployeeDetailsById(string EmployeeId)
        {
            JsonResponse response = new JsonResponse();
            try
            {

                DLLEmployee objEmp = new DLLEmployee();
                response.ResponseData = objEmp.GetEmployeeDetailsById(EmployeeId);
                response.IsSuccess = true;

            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                response.IsSuccess = false;

            }
            return response;

        }

        public JsonResponse DeleteEmployee(int employeeId)
        {
            JsonResponse response = new JsonResponse();
            try
            {

                DLLEmployee objDll = new DLLEmployee();
                response.ResponseData = objDll.DeleteEmployees(employeeId);
                response.IsSuccess = true;

            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                response.IsSuccess = false;

            }
            return response;

        }

    }
}