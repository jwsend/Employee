<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript">
	var app = angular.module("Employee",[]);
	app.controller("ListController", function($scope, $http) {
		//alert("ListController...");

		var json = $http.get("/Employee/emp/list");
	    json.then(function(res) {
	    	//alert("success = "+res.data.success);
	    	console.dir(res);
	    	$scope.response = res.data;
	    	
	    	$scope.emps = res.data.query;
	    }, function(res){
	    	console.dir(res.data.message);
	    });
	});
	
	
</script>
</head>
<body data-ng-controller="ListController" class="container">
<!-- class="container-fluid" // width 전체 -->
 	<div class="row">
	 	<div class="col-md-4" style="background-color: red;color:lightblue">{{response.success}}</div>
	 	<div class="col-md-4" style="background-color: blue;color:lightblue"><pre>{{response}}</pre></div>
	 	<div class="col-md-4" style="background-color: green;color:lightblue">{{response.message}}</div>
	 </div>
 
	 <table class="table table-bordered table-hover">
	 	<thead>
	 		<tr>
	 		<th>empno</th>
	 		<th>ename</th>
	 		<th>job</th>
	 		<th>mgr</th>
	 		<th>hiredate</th>
	 		<th>sal</th>
	 		<th>comm</th>
	 		<th>deptno</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<tr data-ng-repeat="d in emps">
			<td class="active">{{d.empno}}</td>
			<td class="active">{{d.ename}}</td>
			<td class="active">{{d.job}}</td>
			<td class="active">{{d.mgr}}</td>
<!-- 			<td class="active">{{d.hiredate | date:'yyyy년 MM월 dd일'}}</td> -->
			<td class="active">{{d.hiredate}}</td>
			<td class="active">{{d.sal}}</td>
			<td class="active">{{d.comm}}</td>
			<td class="active">{{d.deptno}}</td>
	 		</tr>
	 	</tbody>
	 </table>
</body>
</html>