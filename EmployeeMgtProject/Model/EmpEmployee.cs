using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.Model
{
    public class EmpEmployee
    {
        public int EmployeeId { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string DOB { get; set; }
        public string Salary { get; set; }
        public string Action { get; set; }


        private List<EmpQualification> _Qualification = new List<EmpQualification>();

        public List<EmpQualification> Qualification
        {
            get { return _Qualification; }
            set { _Qualification = value; }
        }

    }
}