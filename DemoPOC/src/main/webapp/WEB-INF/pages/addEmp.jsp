<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html> 
<head>
<meta charset="ISO-8859-1">
<title>Employee Form</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <link href="<c:url value="/resources/theme1/css/addEmp.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/theme1/js/validation.js" />"></script>
    
    <script type="text/javascript">
    function reset(){
	      document.getElementById("addForm").reset();
   }
    </script>
    <script type="text/javascript">
    $(function()
    		{
    		    $("#addForm").validate(
    		      {
    		        rules: 
    		        {
    		          department: 
    		          {
    		            required: true
    		          }
    		        }
    		      });	
    		});
    </script>
   
</head>
<body>
<div class="container-fluid">

<div class="barra row">
    <div class="col-sm-12">
    <div class="col-sm-2">
    <div class="dv-admin" id="dv-adm">
    <a href="/DemoPOC/reload.html">PROHANCE</a>
   </div>
   </div>
    <div class="col-sm-6">
    <ul class="nav navbar-nav">
    <li><a href="/DemoPOC/showConfig.html" onclick="openNav()">Configuration</a></li>
     <li><a href="/DemoPOC/showAnalysis.html">Analysis</a></li>
    </ul>
    </div>
    <div class="col-sm-4">
    <div class="dv-logout">
    <form action ="/DemoPOC/logout.html" method="post">
    <span>Welcome Admin</span>&nbsp;
    <input type="submit" class="btn btn-success" value="Logout">
    </form>
    </div>
    </div>
    </div>
    </div>
   
   
  <div id="sidebar-wrapper">
   <ul id="sidebar_menu" class="sidebar-nav">
           <li class="sidebar-brand"><a id="menu-toggle" href="/DemoPOC/reload.html">Dashboard</a></li>
      </ul>
        <ul class="sidebar-nav" id="sidebar">     
          <li><a href="/DemoPOC/deptSummary.html" class="selected" onclick="displayDept()">Department Summary</a></li>
          <li><a href="/DemoPOC/empSummary.html" class="selected" onclick="displayEmp()">Employee Summary</a></li>
        </ul>
  </div><br>
        <div class="row bs-example" id="cc">
        <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-primary">
        <div class="panel-heading dv-addemp">Add Employee Details</div><br>
          
         <form name="addForm" id="addForm" class="form-horizontal" onsubmit="return formValidation()" action="/DemoPOC/add.html" method="POST">
                <div class="form-group">
                   <label for="firstName" class="control-label col-sm-2">First Name</label>
                 <div class="col-sm-6">
                  <input type="text" name="firstname"  maxlength="20" class="form-control" id="fname" placeholder="Enter Firstname" autofocus>
        </div>
        <div class="col-md-4">
            <span id="errFirst" class="text-danger"></span> 
            </div> 
        </div>
         <div class="form-group">
                   <label for="lastName" class="control-label col-sm-2">Last Name</label>
                 <div class="col-sm-6">
                  <input type="text" name="lastname"  maxlength="20" class="form-control" id="lname" placeholder="Enter lastname">
        </div>
        
        </div>
         <div class="form-group">
                   <label for="employeeId" class="control-label col-sm-2">Employee Id</label>
                 <div class="col-sm-6">
                  <input type="text" name="empid" maxlength="6" class="form-control" id="eid" placeholder="Enter employeeId">
        </div>
        <div class="col-md-4">
            <span id="errEmpId" class="text-danger"></span> 
            </div> 
        </div>
         <div class="form-group">
                   <label for="emailId" class="control-label col-sm-2">Email Id</label>
                 <div class="col-sm-6">
                  <input type="email" name="mail" maxlength="40" class="form-control" id="mailid" placeholder="Enter Email">
        </div>
        <div class="col-md-4">
            <span id="errMail" class="text-danger"></span> 
            </div> 
        </div>
         <div class="form-group">
                   <label for="designation" class="control-label col-sm-2">Designation</label>
                 <div class="col-sm-6">
                  <input type="text" name="designation" maxlength="20" class="form-control" id="post" placeholder="Enter Designation">
        </div>
        <div class="col-md-4">
            <span id="errPost" class="text-danger"></span> 
            </div> 
        </div>
        <div class="form-group">
                                    <label for="skill" class="col-sm-2 control-label">
                                        Skill</label>
                                    <div class="col-sm-10">
<!--                                         <select class="form-control" name="skill"> -->
<!--                                                     <option value="Spring">Spring</option> -->
<!--                                                     <option value="Struts">Struts</option> -->
<!--                                                     <option value="MyBatis">MyBatis</option> -->
<!--                                                      <option value="Hibernate">Hibernate</option> -->
<!--                                                 </select> -->
                             <div class="checkbox col-sm-2">
		                      <label><input type="checkbox" name="skill" id="check1" value="Spring" checked>Spring</label>
		                      </div>
		                     <div class="checkbox col-sm-2">
		                      <label><input type="checkbox" name="skill" id="check2" value="Struts">Struts</label>
		                      </div>
		                     <div class="checkbox col-sm-2">
		                     <label><input type="checkbox" name="skill" id="check3" value="MyBatis">MyBatis</label>
		                     </div>
<!--                              <div class="checkbox col-sm-1"> -->
<!-- 		                     <label><input type="checkbox" name="skill" id="check4" value="Hibernate">Hibernate</label> -->
<!-- 		                     </div>            -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="designation" class="col-sm-2 control-label">
                                        Gender</label>
                                    <div class="col-sm-6">
                                        <label class="radio-inline">&nbsp;
		                                 <input type="radio" name="gender" value="Male" checked>Male
		                            </label>&nbsp;
		                          <label class="radio-inline">
		                             <input type="radio" name="gender" value="Female">Female
		                           </label>
                                    </div>
                                </div>
                 <div class="form-group">
                     <label for="pass" class="col-sm-2 control-label">
                       Password</label>
                      <div class="col-sm-6">
                      <input type="password" maxlength="10" class="form-control" name="password" id="pass" placeholder="Enter password" />
                      </div>
                <div class="col-md-4">
                   <span id="errPass" class="text-danger"></span> 
            </div> 
                </div>
                <div class="form-group">
                     <label for="salary" class="col-sm-2 control-label">
                         Salary</label>
                <div class="col-sm-6">
                     <input type="text" maxlength="7" class="form-control" name="salary" id="sal" placeholder="Enter Salary" />
                </div>
                <div class="col-md-4">
                   <span id="errSalary" class="text-danger"></span> 
                 </div> 
                </div>
               <div class="form-group">
                 <label for="designation" class="col-sm-2 control-label">
                   Department</label>
                <div class="col-sm-6">
             
                   <select class="form-control" name="department" id="select">
                        <option value="-1">Select Department</option>
                        <c:forEach items="${deptlist}" var ="dept">
                         <option value="${dept.id}">${dept.deptname}</option>
                        </c:forEach>
                     
                      </select>
                     </div>
                <div class="col-md-4">
                   <span id="errDepart" class="text-danger"></span> 
               </div> 
               </div> 
               <div class="form-group">
                 <div class="col-sm-offset-2 col-sm-8">
                <input type="submit" class="btn btn-success" value="Save & Continue">&nbsp;
                <input type="reset" class="btn btn-primary" onclick="reset()" value="Reset">
            </div>
        </div>
                             
        </form>
        </div>
        </div>
        <div class="col-md-2" style="float:left;margin-left:-120px;">
         <form method="post" action="/DemoPOC/back.html">
          <input type="submit" class="btn btn-success" id="backbtn" name="backButton" value="Back">
          </form></div>
    </div>
    
        <div class="row bs-example" id="bc" style="display:none;">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-primary">
    <div class="panel-heading dv-addemp">Modify Employee Details</div><br>

        <form name="editForm" id="editForm" class="form-horizontal" onsubmit="return formValidation()" action="/DemoPOC/saveEmployee.html" method="POST">
        	<input type="text" value="${employee.id}" name="id" style="display:none;">
        	
                <div class="form-group">
             <input type="hidden" id="genderStr" value="${employee.gender}">
            <input type="hidden" id="skill" value="${employee.skill}">
                <label for="firstName" class="control-label col-sm-2">Firstname</label>
                 <div class="col-sm-6">
                  <input type="text" name="firstname" value="${employee.firstname }"  maxlength="20" class="form-control" id="fname" placeholder="Enter Firstname" autofocus>
        </div>
        <div class="col-md-4">
            <span id="errFirst" class="text-danger"></span> 
            </div> 
        </div>
         <div class="form-group">
                   <label for="lastName" class="control-label col-sm-2">Lastname</label>
                 <div class="col-sm-6">
                  <input type="text" name="lastname" value="${employee.lastname }"  maxlength="20" class="form-control" id="lname" placeholder="Enter lastname">
        </div>
        
        </div>
         <div class="form-group">
                   <label for="employeeId" class="control-label col-sm-2">EmployeeId</label>
                 <div class="col-sm-6">
                  <input type="text" name="empid" value="${employee.empid }" maxlength="6" class="form-control" id="eid" placeholder="Enter employeeId">
        </div>
        <div class="col-md-4">
            <span id="errEmpId" class="text-danger"></span> 
            </div> 
        </div>
         <div class="form-group">
                   <label for="emailId" class="control-label col-sm-2">EmailId</label>
                 <div class="col-sm-6">
                  <input type="email" name="mail" value="${employee.mail }" maxlength="40" class="form-control" id="mailid" placeholder="Enter Email">
        </div>
        <div class="col-md-4">
            <span id="errMail" class="text-danger"></span> 
            </div> 
        </div>
         <div class="form-group">
                   <label for="designation" class="control-label col-sm-2">Designation</label>
                 <div class="col-sm-6">
                  <input type="text" name="designation" value="${employee.designation }" maxlength="20" class="form-control" id="post" placeholder="Enter Designation">
        </div>
        <div class="col-md-4">
            <span id="errPost" class="text-danger"></span> 
            </div> 
        </div>
        <div class="form-group">
                                    <label for="skill" class="col-sm-2 control-label">
                                        Skill</label>
                                    <div class="col-sm-10">
<%--                                     <select class="form-control" name="skill" value="${employee.skill }"> --%>
<!--                                                   <option value="Spring">Spring</option> -->
<!--                                                   <option value="Struts">Struts</option> -->
<!--                                                   <option value="MyBatis">MyBatis</option> -->
<!--                                                   <option value="Hibernate">Hibernate</option> -->
<!--                                       </select> -->
                               <div class="checkbox col-sm-2">
		                      <label><input type="checkbox" name="skill" id="check1" value="Spring">Spring</label>
		                      </div>
		                     <div class="checkbox col-sm-2">
		                      <label><input type="checkbox" name="skill" id="check2" value="Struts">Struts</label>
		                      </div>
		                     <div class="checkbox col-sm-2">
		                     <label><input type="checkbox" name="skill" id="check3" value="MyBatis">MyBatis</label>
		                     </div>
<!--                              <div class="checkbox col-sm-1"> -->
<!-- 		                     <label><input type="checkbox" name="skill" id="check4" value="Hibernate">Hibernate</label> -->
<!-- 		                     </div>       -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="designation" class="col-sm-2 control-label">
                                        Gender</label>
                                    <div class="col-sm-6">
                                        <label class="radio-inline">&nbsp;
		                                 <input type="radio" name="gender" id="male" value="Male" checked>Male
		                            </label>&nbsp;
		                          <label class="radio-inline">
		                             <input type="radio" name="gender" id="female" value="Female">Female
		                           </label>
                                    </div>
                                </div>
                 <div class="form-group">
                     <label for="pass" class="col-sm-2 control-label">
                       Password</label>
                      <div class="col-sm-6">
                      <input type="password" value="${employee.password }" maxlength="10" class="form-control" name="password" id="pass" placeholder="Enter password" />
                      </div>
                <div class="col-md-4">
                   <span id="errPass" class="text-danger"></span> 
            </div> 
                </div>
                <div class="form-group">
                     <label for="salary" class="col-sm-2 control-label">
                         Salary</label>
                <div class="col-sm-6">
                     <input type="text" maxlength="8" class="form-control" name="salary" value="${employee.salary }" id="sal" placeholder="Enter Salary" />
                </div>
                <div class="col-md-4">
                   <span id="errSalary" class="text-danger"></span> 
                 </div> 
                </div>
               <div class="form-group">
                 <label for="designation" class="col-sm-2 control-label">
                   Department</label>
                <div class="col-sm-6">
                 <select class="form-control" name="department" value="${employee.department }" >
                        <option value="-1">Select Department</option>
                        <c:forEach items="${deptlist}" var ="dept">
                         <option value="${dept.id}">${dept.deptname}</option>
                        </c:forEach>
                     
                      </select>
                     </div>
                <div class="col-md-4">
                   <span id="errDepart" class="text-danger"></span> 
               </div> 
               </div> 
               <div class="form-group">
                 <div class="col-sm-offset-2 col-sm-8">
                <input type="submit" class="btn btn-success" value="Update & Continue">&nbsp;
                <input type="reset" class="btn btn-primary" onclick="myReset()" value="Reset">
            </div>
        </div>
                             
        </form>
        </div>
        </div>
        <div class="col-md-2" style="float:left;margin-left:-120px;">
         <form method="post" action="/DemoPOC/back.html">
          <input type="submit" class="btn btn-success" id="backbtn" name="backButton" value="Back">
          </form></div>
    </div>
    
    
    
</div>
</body>
</html>