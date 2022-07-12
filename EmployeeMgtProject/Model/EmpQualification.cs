using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeMgtProject.Model
{
    public class EmpQualification
    {
        public int EmployeeId { get; set; }
        public int QualificationId { get; set; }
        public string Marks { get; set; }
        public string Action { get; set; }
        public string QualificationName { get; set; }
    }
}