<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Analytics Dashboard</title>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" >
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<link href="<c:url value="/resources/theme1/css/highchart.css" />" rel="stylesheet">
 <script src="<c:url value="/resources/theme1/js/modal.js" />"></script>

<!--  <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
<script src = "https://code.highcharts.com/highcharts.js"></script> 



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

 <div class="row" id="dv-highChart" style ="margin-top:10px;">
 
  <div class="col-sm-12">
<!--   <h4 id="pie-cs">Department wise Employees</h4> -->
  <div id="dv-pie" class="col-sm-6" style="width:550px;height:285px;margin:0 auto;margin-left:70px;border:1px solid #4E83EC;">
  
  <script language = "JavaScript">
         $(document).ready(function() {
        	 
        	 var chart = {
               plotBackgroundColor: null,
               plotBorderWidth: null,
               plotShadow: false
            };
            var title = {
               text: 'Department Wise Employees'   
            };
            var tooltip = {
               pointFormat: '{series.name}: '
            };
            var plotOptions = {
               pie: {
                  allowPointSelect: true,
                  cursor: 'pointer',
                  
                  dataLabels: {
                     enabled: true,
                     format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                     style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor)||
                        'black'
                     }
                  }
               }
            };
           
            
            var series = [{
               type: 'pie',
               name: 'Department wise Employees',
               data: [
            	   <c:forEach var="pie" items="${deptvalue}">['${pie[2]}',${pie[1]}],</c:forEach>
                 ]
            }];
            var json = {};   
            json.chart = chart; 
            json.title = title;     
            json.tooltip = tooltip;  
            json.series = series;
            json.plotOptions = plotOptions;
            $('#dv-pie').highcharts(json);  
         });
      </script>

</div>


<div id="contain" class="col-sm-6" style="width:550px;margin-left:60px;">
<div class="panel panel-primary">
<div class="panel-heading">
		      <div class="row">
	      <div class="col-sm-12">
	      <span id="deptSumm"><strong><span class="glyphicon glyphicon-folder-open"></span> Department Wise Employees and Salary</strong></span>
	      </div>
	   </div>
		    </div>
<table class="table table-bordered table-striped">
<thead>
<tr>
<th>Department Name</th> 
<th>No.Of Employee</th>
<th>Total Salary</th>
<th>Average Salary</th>
</tr>
</thead>

<tbody>
<c:forEach var="salary" items="${employeeSalary }">
<tr>
<td>${salary[0] }</td>
<td class="text-right">${salary[2] }</td>
<td>${salary[1] }</td>
<td>${salary[1]/salary[2]}</td>
</tr>
</c:forEach>
</tbody>

</table>

</div>
</div>
</div>
<br>
<div class="col-sm-12">

<div id="basic-bar" class="col-sm-6" style="width:550px;height:270px;margin-top:5px;margin-left:70px;border:1px solid #4E83EC">
<script language="Javascript">
 $(document).ready(function(){
	var chart = {
			type: 'column'
			
	};
	var title = {
		text: 'SkillSet View'
	};
	var subtitle = {
		text:''
	};
	var xAxis = {
		categories:['MyBatis','Struts','Spring'],
		crosshair: true
	};
	var yAxis = {
		min: 0,
		title: {
			text: 'Skillset'
		}
	};
	var tooltip = {
            headerFormat: '<span style = "font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style = "color:{series.color};padding:0">{series.name}: </td>' +
               '<td style = "padding:0"><b>{point.y:.1f} </b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
         };
         var plotOptions = {
            column: {
               pointPadding: 0.2,
               borderWidth: 0
            }
         };  
         var credits = {
            enabled: false
         };
         var series= [
            
            {
               name: 'Prohance',
               data: [<c:forEach var="skill" items="${employeeSkill}"> ${skill},</c:forEach>]
            }
         ];     
      
         var json = {};   
         json.chart = chart; 
         json.title = title;   
         json.subtitle = subtitle; 
         json.tooltip = tooltip;
         json.xAxis = xAxis;
         json.yAxis = yAxis;  
         json.series = series;
         json.plotOptions = plotOptions;  
         json.credits = credits;
         $('#basic-bar').highcharts(json);
 });
</script>
</div>

<div id="stacked" class="col-sm-6" style="width:520px;height:270px;margin-top:5px;margin-left:75px;border:1px solid #4E83EC;">
 <script language = "JavaScript">
         $(document).ready(function() {  
            var chart = {
               type: 'column'
            };
            var title = {
               text: 'Department Wise SkillSet'   
            };    
            var xAxis = {
               categories:[<c:forEach var="ski" items="${stack}"> '${ski[3]}',</c:forEach>]
            };
            var yAxis = {
               min: 0,
               title: {
                  text: 'Department Wise Skillset View'
               },
               stackLabels: {
                  enabled: true,
                  style: {
                     fontWeight: 'bold',
                     color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                  }
               }
            };
            var legend = {
               align: 'right',
               x: -30,
               verticalAlign: 'top',
               y: 25,
               floating: true,
               
               backgroundColor: (
                  Highcharts.theme && Highcharts.theme.background2) || 'white',
               borderColor: '#CCC',
               borderWidth: 1,
               shadow: false
            };   
            var tooltip = {
               formatter: function () {
                  return '<b>' + this.x + '</b><br/>' +
                  this.series.name + ': ' + this.y + '<br/>' +
                  'Total: ' + this.point.stackTotal;
               }
            };
            var plotOptions = {
               column: {
                  stacking: 'normal',
                  dataLabels: {
                     enabled: true,
                     color: (Highcharts.theme && Highcharts.theme.dataLabelsColor)
                        || 'white',
                     style: {
                        textShadow: '0 0 3px black'
                     }
                  }
               }
            };
            var credits = {
               enabled: false
            };
            var series = [
               {
                  name: 'Spring',
                  data: [5, 3, 4, 7]
               }, 
               {
                  name: 'Struts',
                  data: [2, 2, 3, 2]
               }, 
               {
                  name: 'MyBatis',
                  data: [3, 4, 4, 2]      
               }
               
            ];     
      
            var json = {};   
            json.chart = chart; 
            json.title = title;   
            json.xAxis = xAxis;
            json.yAxis = yAxis;
            json.legend = legend;
            json.tooltip = tooltip;
            json.plotOptions = plotOptions;
            json.credits = credits;
            json.series = series;
            $('#stacked').highcharts(json);
         });
      </script>
</div>
</div>

</div>
    </div>
</body>
</html>