<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginPage</title>

	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	   
     <link href="<c:url value="/resources/theme1/css/login.css" />" rel="stylesheet">
     <script src="<c:url value="/resources/theme1/js/loginValidation.js" />"></script>
     
     <script type="text/javascript">
      function myReset(){
	      document.getElementById("login-form").reset();
     }
      
    
</script>
</head>

<body>
  <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
         <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                         <form:form name="submitForm"  onsubmit="return validate()" action="/DemoPOC/LoginController.html" method="POST" id="login-form">
                           <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control" placeholder="Enter username" />
                               <span id="error" class="text-danger font-weight-bold"></span>
                            </div>
                             <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password"/>
                                <span id="error1" class="text-danger font-weight-bold"></span>
                            </div><br>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Sign In"><br/><br>
                               
                            </div>
                           
                            </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>