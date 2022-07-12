using EmployeeMgtProject.DLL;
using EmployeeMgtProject.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.BLL
{
    public class BLLQualificationList
    {
        public JsonResponse GetQualificationList()
        {
            JsonResponse response = new JsonResponse();
            try
            {
                DLLQualificationList objList = new DLLQualificationList();
                response.ResponseData = objList.GetQualificationList();
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
            }
            return response;
        }

    }
}