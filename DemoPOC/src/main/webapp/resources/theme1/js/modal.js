function openNav() {
	document.getElementById("dv_dept").style.display="block";
	document.getElementById("dv_dept").style.marginLeft="100px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("dv-adm").style.marginLeft = "150px";
}

function displayDept(){

	document.getElementById("dv_dept").style.display = "block";
	document.getElementById("dv_emp").style.display = "none";
	document.getElementById("dv_dept").style.marginLeft="100px";
}
function displayEmp(){
	document.getElementById("dv_emp").style.display = "block";
	document.getElementById("dv_dept").style.display = "none";
	
}
