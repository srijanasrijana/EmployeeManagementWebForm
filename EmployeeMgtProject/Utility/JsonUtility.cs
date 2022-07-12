using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace EmployeeMgtProject.Utility
{
    public class JsonUtility
    {
        public static object Serialize(JsonResponse response)
        {
            try
            {
                JavaScriptSerializer jSearializer = new JavaScriptSerializer();
                jSearializer.MaxJsonLength = 500000000;
                return jSearializer.Serialize(response);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Object DeSerialize(string json, Type ObjectType)
        {
            try
            {

                Object objDeserialized = Newtonsoft.Json.JsonConvert.DeserializeObject(json, ObjectType);
                return objDeserialized;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


    }
}