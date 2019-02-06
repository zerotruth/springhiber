<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EditDepartment Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <link href="<c:url value="/resources/theme1/css/addDept.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/theme1/js/deptValidation.js" />"></script>
    
     <script type="text/javascript">
    function reset(){
	      document.getElementById("editDeptForm").reset();
   }
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
    
    <div id="sidebar-wrapper">
   <ul id="sidebar_menu" class="sidebar-nav">
           <li class="sidebar-brand"><a id="menu-toggle" href="/DemoPOC/reload.html">Dashboard</a></li>
      </ul>
        <ul class="sidebar-nav" id="sidebar">     
          <li><a href="/DemoPOC/deptSummary.html" class="selected" onclick="displayDept()">Department Summary</a></li>
          <li><a href="/DemoPOC/empSummary.html" class="selected">Employee Summary</a></li>
        </ul>
  </div>
    <br>
    <div class="row bs-example">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-primary">
       <div class="panel-heading dv-addemp">Modify Department Information</div><br>
        <form name="editDeptForm" id="editDeptForm" class="form-horizontal" onsubmit="return deptFormValidation()" action="/DemoPOC/saveDept.html" method="POST">
             <input type="hidden" value="${department.id}" name="id">
             <input type="hidden" id="status" value="${department.status}">
             <div class="form-group">
               <label for="department" class="col-sm-2 control-label">
                 Department Name</label>
                 <div class="col-sm-6">
                   <input type="text" maxlength="20" name="deptname" value="${department.deptname }"  class="form-control" id="department" placeholder="Enter Department" />
                   </div>
                   <div class="col-md-4">
                         <span id="errName" class="text-danger"></span> 
                   </div>
                  </div>
                  
                  <div class="form-group">
                   <label for="description" class="control-label col-sm-2">Description</label>
                 <div class="col-sm-6">
                  <input type="text" name="description" value="${department.description }" maxlength="30" class="form-control" id="descrip" placeholder="Enter Description">
        </div>
        <div class="col-md-4">
            <span id="errDescrip" class="text-danger"></span> 
            </div> 
        </div>
        <div class="form-group">
               <label for="status" class="col-sm-2 control-label">
                 Status</label>
               <div class="col-sm-6">
              <label class="radio-inline">&nbsp;
		                <input type="radio" name="status" id="active" value="Active" checked>Active
		                  </label>&nbsp;
		                          <label class="radio-inline">
		                             <input type="radio" name="status" id="inactive" value="Inactive">Inactive
		                           </label> 
                  
                   </div>
                  </div>
         <div class="form-group">
          <div class="col-sm-offset-2 col-sm-8">
             <input type="submit" class="btn btn-success" value="Update & Continue">&nbsp;
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
    
</div>

<script>
		$(document).ready(function() {
            
            var status = $("#status").val();
           
               if (status == 'Active') 
			  {
				$("#active").prop("checked", true);
			  } 
			  else 
			  {
			 	$("#inactive").prop("checked", true);
			  }
		});
</script>
</body>

</html>