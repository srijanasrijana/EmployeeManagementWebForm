
<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeeData.aspx.cs" Inherits="EmployeeMgtProject.EmployeeData" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
 <script type="text/javascript">      
    var valFutureDate = function (obj, futureDate, focus) {
            var nepDate = obj.value;
            var errDate = '';
            var data = '';
            var callback = null;
            if (nepDate == '') {
                return true;
            }
            if (nepDate >= '2076-12-07') {
                errDate +="Please enter valid date. \n date must not be future date."
            }
            if (errDate != '') {
                alert(errDate, 'WARNING', 'Warning', callback);
                return false;
            }
            else {
                return true;
            }
     };

   </script>
   
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>
</head>
   
<body>
  <div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
        <h3 style="color:chocolate"><u> Employee List</u> </h3>

     <%--   To show list in table --%>
        <table  style="min-height:40px; width:100%;" data-bind="visible:toggle" border="1" class="dataTable table table-bordered table-condensed  sort" id="showTable">
             
                 <tr>
                    <th>Id</th>                 
                    <th>Employee Name</th>  
                    <th>Action</th>
                 </tr>
                    <tbody data-bind="foreach:Employees" >
                        <!-- ko  if: Action()!='D' -->  
                         <%--   $root refers to the view model applied to the DOM with ko.applyBindings--%>
                            <tr data-bind="click:$root.EmployeeDetails " style="cursor: pointer; text-align: center;">                          
                            <td><span data-bind="text:EmployeeId"></span> </td>                                          
                            <td align="left"> <span data-bind="text:Name " style="width: 150px;" /></td>
                                   
                                <%--   $root refers to the view model applied to the DOM with ko.applyBindings--%>
                             <td> <span class="glyphicon glyphicon-remove" data-bind ="click: $root.DeleteEmployee"></span>  </td>
                            </tr>
                        <!-- /ko -->
                    </tbody>
             </table>
    </div>
    <br>
   
    <div class="col-sm-9">
      <div class="well">

<%--       <%--  To add Employee Detail in Form--%>
 <form >
   <h3 style="color:cornflowerblue"><u>Add Employee Details</u> </h3>
                           <div class="row">  
                                <div class="form-group margin-bottom-0">
                                   <label class="col-md-2 control-label text-top" for="textinput"> Employee ID: </label>   
                                                                             
                                  <div class="col-md-5 ">
                                   <input type="text" class="form-control" id="Text1"  data-bind="value: EmployeeId"  readonly />
                                </div> 
                               </div>
                             </div>
                              
                             
                            
                            <div class="row">
                                  <div class="form-group margin-bottom-0">
                                     <label class="col-md-2 control-label text-top" for="textinput">   Name: </label>                                  
                                  <div class="col-md-6 ">
                                 <input type="text" id="employeeName" placeholder="Enter Employee FullName" class='required form-control'
                                     onkeypress='return (event.charCode >= 65 && event.charCode <= 122)  || event.charCode == 32' data-bind="value: Name"  /> 
                                   </div>
                                    </div>
                              </div>

                        <div class="row">
                               <div class="form-group margin-bottom-0">
                                    <label class="col-md-2 control-label text-top" for="textinput">Gender</label>                                   
                            
                                    <label class="radio-inline"  >
                                          <input type="radio" name="optradio" value="1"  data-bind="checked: Gender" checked>Male
                                     </label>
                                   <label class="radio-inline">
                                        <input type="radio" name="optradio" value="2" data-bind="checked: Gender">Female
                                    </label>
                                   <label class="radio-inline">
                                        <input type="radio" name="optradio" value="3" data-bind="checked: Gender">Third Gender
                                    </label>
                              </div>
                            </div>
                                                   
                            <div class="row">
                                <div class="form-group margin-bottom-0">
                                    <label class="col-md-2 control-label text-top" for="textinput"> DOB: </label>                                 
                                    <div class="col-md-5 ">
                                    <input type="text" id="txtDOB" placeholder="YYYY-MM-DD" maxlength="10" 
                                        onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 45'
                                        class="form-control" name="Mobile" data-bind="value: DOB"  onblur="return valFutureDate(this,'Y',true);"/>
                                      
                                    </div>
                               </div>
                             </div>
                            <div class="row">               
                              <div class="form-group margin-bottom-0">
                                <label class="col-md-2 control-label text-top" for="textinput"> Salary</label>                                   
                                <div class="col-md-5 ">
                                 <input type="text" id="txtSalary"  class="form-control" name="Salary" 
                                     onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 46' data-bind="value: Salary"/>
                                </div>
                              </div>
                            </div>  
            </form>

        
      </div>

        <div class="well">
          <u><h3 style="color:darkblue"> Add Employee Qualification</h3> </u>
    
          <form class="form-inline" >            
             <div class="form-group">
                <label for="email">Employee  Qualification:</label>
             <%--   To List qualification Detail--%>
                     <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                   
                                 <select  class="dropdown-select" 
                                        data-bind="
                                           options:QualificationLists,
                                           optionsText: 'QualificationName',
                                           optionsValue: $data,
                                           value:SelectedQualificationID, 
                                           optionsCaption:'---choose---'
                                           ">
                                 </select>
                        </button>             
              </div>
              <div class="form-group">
                <label for="pwd">Marks:</label>
                <input type="text"  class="form-control" id="TxtMarks" name="Marks" data-bind="value: Marks"
                    onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 46' >
              </div>
              

               <button type="submit" class="btn icon-add btn-primary "  data-bind="click: AddEmployeeQualification,text: ButtonQual"></button>
            
           </form>
        
      </div>
           <div class="well">
                <table style="width: 100%;" data-bind="" border="1" class="dataTable table table-bordered table-condensed  sort" id="showTable">
             
                <tr>
                    <th>Id</th>
                  
                    <th>Qualification Name</th>
                    <th>Marks</th>
                    <th>Action</th>                    
                 </tr>
                    <tbody data-bind="foreach:Qualifications " >
                        <!-- ko  if: Action()!='D' -->  
                        <tr>
                            <td>
                                <span data-bind="text: ($index() + 1)"></span>
                            </td>
                         
                            <td align="left">
                                <span data-bind="text:QualificationName " style="width: 150px;" />
                            </td>
                            <td align="left">
                                <span data-bind="text:Marks " style="width: 150px;" />
                            </td>
                              <td align="left">
                                 
                                     <a data-bind="click:$root.EditQualification">                        
                                        <span class="glyphicon glyphicon-edit" title="Edit" rel="tooltip"></span>
                                        </a>
                                     <a data-bind="click:$root.DeleteQualification">
                                        <span class="glyphicon glyphicon-trash" title="Delete" rel="tooltip"></span>
                                        </a>

                               </td>
                        </tr>
                        <!-- /ko -->
                    </tbody>
                </table>

            </div>

          <div class="well pull-right">
              
               <button class="btn btn-success" data-bind="click:SaveEmployee ">Save</button>            
               <button class="btn btn-warning" data-bind="click: resetEmployee">Cancel</button>
            
          </div>
        </div>
      </div>
   </div>


</body>
</html>
    <script src="EmployeeScript/Employee.js"></script>
    </asp:Content>
    
