<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Configuration Page</title>
 <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<link href="<c:url value="/resources/theme1/css/dashboard.css" />" rel="stylesheet">
<script src="<c:url value="/resources/theme1/js/modal.js" />"></script>



<script type="text/javascript">
function deleteconfig(){
	
    var del=confirm("Are you sure you want to delete this record?");
    if (del==true){
                  alert("record cannot be deleted"); 
           }
        else{
             alert("record is not deleted");
           }
                return del;
        }
</script>
<script>
    window.onload =displayDept;
   
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
          <li><a href="/DemoPOC/empSummary.html">Employee Summary</a></li>
        </ul>
  </div>
</div> 



		   <div class="row">
         <div class="col-sm-6" style="align-content: center;margin-left:400px;">
		  <div class="alert alert-${css}" role="alert">

			<h4 style="text-align:center;margin-left:50px;"><strong>${msg}</strong></h4>
		    </div></div>
		    </div>
		
		
		
<div class="row dv-dept" id="dv_dept">
<div class="col-md-10 col-md-offset-2">
<div class="panel panel-default">
	 <div class="panel-heading">
	 <div class="row">
	      <div class="col-xs-6">
	      <span id="deptSumm"><strong><span class="glyphicon glyphicon-folder-open"></span> Department Summary</strong></span>
	      </div>
	      <div class="col-xs-6 text-right">
	       <a href="/DemoPOC/addDept.html"><button type="button" class="btn btn-sm btn-primary btn-create dv-addbtn">Add</button></a>
	       </div>
	       </div>
	 </div>
	  <table class="table table-bordered table-striped">
	   <thead>
                        <tr>
                            <th style="width:40%;font-family: Lucida Console,Monaco, monospace;">Department Name</th>
                            <th style="width:40%;font-family: Lucida Console,Monaco, monospace;">Description</th>
                            <th class="text-center" style="width:10%;font-family: Lucida Console,Monaco, monospace;">Status</th>
                            <th class="text-center" style="width:10%;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="department" items="${departmentList}">
                        <tr>
                            <td class="text-left">
                                ${department.deptname }
                            </td>
                            <td class="text-left">${department.description }</td>
                           <td class="text-center">${department.status }</td>
                            <td class="text-center">
                                <a class="btn btn-primary" href="/DemoPOC/editDepartment.html?id=${department.id}" style="font-size:8px;"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;
                                <a class="btn btn-danger" href="/DemoPOC/deleteDepartment.html?id=${department.id}" id="del" onclick="return deleteconfig()" style="font-size:8px;"><span class=" glyphicon glyphicon-trash"></span></a>
                            </td>
                            </tr>
                            </c:forEach> 
                     </tbody>
	  </table>
</div>

</div>
</div>
</div>

</body>
</html>