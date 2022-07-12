using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.Utility
{
    public class JsonResponse
    {
        private bool Is_Success = false;
        public bool IsSuccess
        {
            get { return Is_Success; }
            set { Is_Success = value; }
        }

        private object Response_Data = null;

        public object ResponseData
        {
            get { return Response_Data; }
            set { Response_Data = value; }
        }

        private string _Message = string.Empty;

        public string Message
        {
            get { return _Message; }
            set { _Message = value; }
        }


    }
}