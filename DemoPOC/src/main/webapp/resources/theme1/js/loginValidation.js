function validate(){
	var uname = document.getElementById('username').value;
	var pass = document.getElementById('password').value;
	
	
	if(uname == ""){
		document.getElementById("username").focus();
		document.getElementById('username').style.borderColor="red";
		document.getElementById('error').innerHTML="*Enter your username.";
		return false;
	}
	else {
		document.getElementById('username').style.borderColor="green";
		document.getElementById('error').style.display="none";
	}
	if(pass == ""){
		document.getElementById("password").focus();
		document.getElementById('password').style.borderColor="red";
		document.getElementById('error1').innerHTML="*Enter your password.";
		return false;
	}
	
	return true;
}
