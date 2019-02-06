<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Summary</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
 <script src="alert.js"></script>
 

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <link href="<c:url value="/resources/theme1/css/dashboard.css" />" rel="stylesheet">
   <script type="text/javascript">
function deleteconfig(){
	
    var del=confirm("Are you sure you want to delete this record?");
    if (del==true){
                  alert("record is deleted"); 
           }
        else{
             alert("record is not deleted");
           }
                return del;
        }
</script>
</head>
<body>
<div class="container-fluid adm-archivos">
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
     <li><a href="/DemoPOC/showAnalysis.html">Analytics</a></li>
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
    
    <div id="wrapper" class="active"> 
  <div id="sidebar-wrapper">
   <ul id="sidebar_menu" class="sidebar-nav">
           <li class="sidebar-brand"><a id="menu-toggle" href="/DemoPOC/reload.html">Dashboard</a></li>
      </ul>
        <ul class="sidebar-nav" id="sidebar">     
          <li><a href="/DemoPOC/deptSummary.html" class="selected" onclick="displayDept()">Department Summary</a></li>
          <li><a href="/DemoPOC/empSummary.html" class="selected">Employee Summary</a></li>
        </ul>
  </div>
</div> 


         <div class="row">
         <div class="col-sm-6" style="align-content: center;margin-left:400px;">
		  <div class="alert alert-${css}" role="alert">

			<h4 style="text-align:center;color:green;margin-left:50px;"><strong>${msg}</strong></h4>
		    </div></div>
		    </div>
		
    
<div class="row dv-emp" id="dv_emp">
<div class="col-md-10 col-md-offset-2">
<div class="panel panel-default">
	 <div class="panel-heading">
	 <div class="row">
	 <div class="col-xs-6">
	      <span id="deptSumm"><strong><span class="glyphicon glyphicon-user"> </span> Employee Summary</strong></span>
	      </div>
	      <div class="col-xs-6 text-right">
	       <a href="/DemoPOC/addEmp.html"><button type="button" class="btn btn-sm btn-primary btn-create dv-addbtn">Add Employee</button></a>
	       </div>
             </div>       
          </div>
	 <div class="table-responsive">
                
              <table class="table table-bordred table-striped">
               <thead>
               <tr>
                    <th>First Name</th>
                   <th>Last Name</th>
                    <th>EmployeeId</th>
                    <th>EmailId</th>
                     <th>Designation</th>
                     <th>SkillSet</th>
                     <th>Gender</th>

                      <th>Salary</th>
                      <th>Department</th>
                      <th class="text-center">Actions</th>
                       
                      </tr> 
                   </thead>
    <tbody>
    <c:forEach var="employee" items="${employeeList}">
    <tr>
    <td>${employee.firstname }</td>
    <td>${employee.lastname }</td>
    <td>${employee.empid }</td>
    <td>${employee.mail }</td>
    <td>${employee.designation }</td>
    <td>${employee.skill }</td>
    <td>${employee.gender }</td>
    <td>${employee.salary }</td>
    <td>${employee.department }</td>
    <td>
    <a class="btn btn-primary" style="font-size:8px;" href="/DemoPOC/editEmployee.html?id=${employee.id}"><span class="glyphicon glyphicon-pencil"></span></a>
    <a class="btn btn-danger"  style="font-size:8px;" href="/DemoPOC/deleteEmployee.html?id=${employee.id}" id="del" onclick="return deleteconfig()"><span class="glyphicon glyphicon-trash"></span></a>
    </td>
    </tr> 
</c:forEach>    
    </tbody>
    </table>
    </div>
</div>
</div>
</div>
    
   </div> 
</body>
</html>