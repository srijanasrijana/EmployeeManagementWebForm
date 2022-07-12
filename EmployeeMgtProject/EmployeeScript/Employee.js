//Model

function Employee(data) {
    var current = this;
    current.EmployeeId = ko.observable(data.EmployeeId);
    current.Name = ko.observable(data.Name);
    current.Gender = ko.observable(data.Gender);
    current.DOB = ko.observable(data.DOB);
    current.Salary = ko.observable(data.Salary);
    current.Action = ko.observable(data.Action);
    current.Qualification = ko.observable(data.Qualification);
}
function QualificationList(data) {
    var current = this;
    current.QualificationId = ko.observable(data.QualificationId);
    current.QualificationName = ko.observable(data.QualificationName);
    current.Action = ko.observable(data.Action);
}

function Qualification(data) {
    var current = this;
    current.EmployeeId = ko.observable(data.EmployeeId);
    current.QualificationId = ko.observable(data.QualificationId);
    current.QualificationName = ko.observable(data.QualificationName);
    current.Marks = ko.observable(data.Marks);
    current.Action = ko.observable(data.Action);
}

// View Model
var EmployeeViewModel = function () {
    var current = this;

    current.ButtonQual = ko.observable("Add");

    current.EmployeeId = ko.observable();
    current.Name = ko.observable();
    current.Gender = ko.observable(2);
    current.DOB = ko.observable();
    current.Salary = ko.observable();

    current.Qualification = ko.observable();
    current.Action = ko.observable();
    current.SelectedData = ko.observable();
    //For Qualification
    current.Marks = ko.observable();
    current.EmployeeUpdate = ko.observable(true);
    //For Qualification List
    current.QualificationId = ko.observable();
    current.QualificationName = ko.observable();

    current.Employees = ko.observableArray([]);
    current.SelectedEmployeeId = ko.observable();

    current.QualificationLists = ko.observableArray([]);
    current.SelectedQualificationID = ko.observable();

    current.Qualifications = ko.observableArray([]);

    current.toggle = ko.observable();
    current.toggle(true);

    //To get a list of Employee Qualification in dropdown list
    current.GetQualificationList = function () {
        
        $.ajax({
            dataType: "json",
            cache: false,
            async: false,
            url: '../../Handler/EmployeeHandler.ashx',
            data: { 'method': 'GetQualificationList', 'QualificationId': null },
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                //C# JSON SERIALIZE data
                var mappedTask = $.map(data.ResponseData, function (item) {
                    return new QualificationList(item)
                });

                current.QualificationLists(mappedTask);
                //console.log(current.QualificationLists());

            },
            error: function (err) {
                //IF BACKEND ERROR RESPONSE
                alert(err.status + " - " + err.statusText, "FAILURE");
            }
        });
    }
    current.GetQualificationList();

    // To enter a validate marks
    current.ValidateQualification = function () {
        var erralert = "";

        if (Validate.empty(current.Marks())) {
            erralert += "Enter Marks !\n";
        }
        if (current.Marks() < 40 || current.Marks() > 100) {
            erralert += "Enter Marks Between 40 and 100 ! \n";
        }
        if (erralert === "") {
            return true;
        }
        else {
            alert(erralert);
            return false;
        }
        //return true;
    };

    // To add Qualification data in table format
    current.AddEmployeeQualification = function () {
        if (current.ValidateQualification()) {
            var erralert = "";
            var objFocus = null;
            var pro;
            var QualData = current.SelectedData();
            if (QualData == null && QualData == undefined) {

                for (let i = 0; i < current.Qualifications().length; i++) {
                    if (ko.toJS(current.Qualifications()[i].QualificationId) == ko.toJS(current.SelectedQualificationID).QualificationId) {
                        alert('Data already exists !!!');
                        return;
                    }
                }
                console.log(current.DOB());
                pro = {
                    QualificationId: current.SelectedQualificationID().QualificationId(),
                    QualificationName: current.SelectedQualificationID().QualificationName(),
                    Marks: current.Marks(),
                    Action: "A"
                };

                current.Qualifications.push(new Qualification(pro));
                current.Marks(null);
                //   current.SelectedQulaificationChange.push(new Qualification(pro));
            }
            else {
                QualData.EmployeeId(current.EmployeeId());
                QualData.QualificationId(current.SelectedQualificationID().QualificationId());

                QualData.QualificationName(current.SelectedQualificationID().QualificationName());
                //  QualData.Action("E")
                QualData.Action(current.Action());
                QualData.Marks(current.Marks());
                current.SelectedData(null);
                current.Marks(null);
            }

            current.SelectedQualificationID(null);
            current.Marks(null)
            current.ButtonQual("Add");
           
        }
    }
    //For Edit Qualification list
    current.EditQualification = function (data) {
        current.ButtonQual("Update");
        console.log(data);
        current.Marks(data.Marks());
        current.Action(data.Action());
        for (var i = 0; i < current.QualificationLists().length; i++) {
            if (ko.toJS(current.QualificationLists()[i].QualificationName) === data.QualificationName()) {
                current.SelectedQualificationID(current.QualificationLists()[i]);
            }
        }
      
        current.SelectedData(data);


    }

    //For Delete Qualification List 

    current.DeleteQualification = function (del) {
        if (confirm("Do you want to delete ")) {
            if (del.Action() == "A") {
                current.Qualifications.remove(del);
            } else {
                del.Action("D");
            }

        }
    }


    //To Save Data Of Employee
    current.SaveEmployee = function () {
        //if (current.ValidateEmployee()) {
        //// alert();

        var employeeAction = "";
        if (current.SelectedEmployeeId() == undefined) {
            employeeAction = "A";
        }
        else
            employeeAction = "E";

        var employee = {
            EmployeeId: current.EmployeeId(),
            Name: current.Name(),
            Gender: current.Gender(),
            DOB: current.DOB(),
            Salary: current.Salary(),
            Qualification: current.Qualifications(),
            Action: employeeAction
        }
        console.log(data);
        var url = "../../Handler/EmployeeHandler.ashx";
        var data = { 'method': 'SaveEmployee', 'args': JSON.stringify(ko.toJS(employee)) };

        $.post(url, data, function (result) {
            //JSON.parse() takes a JSON string and then transforms it into a JavaScript object.
            var obj = jQuery.parseJSON(result);
            console.log(obj);
            //alert(obj.Message);
            if (obj.IsSuccess) {
                alert("Employee Data Save Sucessfully")
                current.Qualifications(null);
                current.Employees();

                //To load when save sucessfully
                current.ClearEmployeeInfo();
                current.GetEmployees();
            }

        });
    }
    current.ClearEmployeeInfo = function () {
        current.EmployeeId(null);
        current.Name(null);
        current.DOB(null);
        current.Salary(null);
        current.Gender(null);
        current.Salary(null);
        current.Marks(null);
        current.SelectedQualificationID(null);
    }

    // To get List of Employee ID and Name in table format
    current.GetEmployees = function () {
        $.ajax({
            dataType: "json",
            cache: false,
            url: '../../Handler/EmployeeHandler.ashx',
            data: { 'method': 'GetEmployee', 'employeeId': null },
            contentType: "application/json; charset=utf-8",

            success: function (result) {
                var mappedTask = $.map(result.ResponseData, function (item) {
                    return new Employee(item)

                });

                current.Employees(mappedTask);
            },
            error: function (err) {
                alert(err.status + " - " + err.statusText, "FAILURE");
            }
        });
    };
    current.GetEmployees();

    // To get  list of Employee into the form
    current.EmployeeDetails = function (det) {
        current.EmployeeUpdate(false);
        current.SelectedEmployeeId(det.EmployeeId);
        if (current.SelectedEmployeeId() == null) {

        }
        else {

            $.ajax({
                dataType: "json",
                cache: false,
                url: "../../Handler/EmployeeHandler.ashx",
                data: { 'method': 'GetEmployeeDetailsById', 'EmployeeId': current.SelectedEmployeeId() },
                contentType: "application/json; charset=utf-8",
                success: function (result) {

                    var data = result.ResponseData[0];
                    //  debugger;
                    current.EmployeeId(data.EmployeeId);
                    current.Name(data.Name);
                    current.Gender(data.Gender);
                    current.DOB(data.DOB);
                    current.Salary(data.Salary);
                    var mappedTask = $.map(data.Qualification, function (item) {
                        return new Qualification(item)
                    });
                    current.Qualifications(mappedTask);

                    console.log(current.Qualifications());

                    current.GetQualificationList();
                    //  current.SaveEmployee(false);
                },
                error: function (err) {
                    console.log(err);
                    alert(err.status + " - " + err.statusText, "FAILURE");
                }
            });

        }

    }
    current.DeleteEmployee = function (del) {
        if (confirm("Do you want to delete Employees?")) {
            let Key = del.EmployeeId();
            console.log(Key);
            $.ajax({
                dataType: "json",
                cache: false,
                url: '../../Handler/EmployeeHandler.ashx',
                data: { 'method': 'DeleteEmployee', 'employeeId': Key },
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    //current.GetDoctors();
                    alert("Succesfully deleted");
                 
                },
                error: function (err) {
                    alert(err.status + " - " + err.statusText, "FAILURE");
                }
            });
        }
        current.ClearEmployeeInfo();
        current.GetEmployees();


    };

    //To Clear All Employee Data
    current.resetEmployee = function () {
        current.ClearEmployeeInfo();
        current.Qualifications(null);
    }

}



$(document).ready(function () {

    var employeeInfoModel = new EmployeeViewModel();
    ko.applyBindings(employeeInfoModel);  //Activates Knockout

});