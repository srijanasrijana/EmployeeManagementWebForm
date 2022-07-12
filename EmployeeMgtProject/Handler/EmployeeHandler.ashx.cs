using EmployeeMgtProject.BLL;
using EmployeeMgtProject.Model;
using EmployeeMgtProject.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.Handler
{
    /// <summary>
    /// Summary description for EmployeeHandler
    /// </summary>
    public class EmployeeHandler : BaseHandler
    {

        // To get list of qualification 
        public object GetQualificationList(int QualId)
        {
            JsonResponse response = new JsonResponse();
            BLLQualificationList bllQualificationList = new BLLQualificationList();
            response = bllQualificationList.GetQualificationList();
            return JsonUtility.Serialize(response);

        }

        public object SaveEmployee(string args)
        {

            JsonResponse response = new JsonResponse();
            EmpEmployee objEmp = JsonUtility.DeSerialize(args, typeof(EmpEmployee)) as EmpEmployee;
            BLLEmployee bllObj = new BLLEmployee();
            response = bllObj.SaveEmployee(objEmp);
            return JsonUtility.Serialize(response);

        }

        public object GetEmployee()
        {

            JsonResponse response = new JsonResponse();
            BLLEmployee bllEmp = new BLLEmployee();
            response = bllEmp.GetEmployee();
            return JsonUtility.Serialize(response);
        }
        public object GetEmployeeDetailsById(string EmployeeId)
        {
            JsonResponse response = new JsonResponse();
            BLLEmployee bllEmployee = new BLLEmployee();
            response = bllEmployee.GetEmployeeDetailsById(EmployeeId);
            return JsonUtility.Serialize(response);


        }
        public object DeleteEmployee(int employeeId)
        {
            JsonResponse response = new JsonResponse();
            BLLEmployee bllEmployee = new BLLEmployee();
            response = bllEmployee.DeleteEmployee(employeeId);
            return JsonUtility.Serialize(response);


        }

    }
}