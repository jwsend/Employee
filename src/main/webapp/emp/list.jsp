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
	    json.then(function(value) {
	    	//alert("success = "+res.data.success);
	    	console.dir(value);
	    	$scope.response = value.data;
	    	
	    	$scope.emps = value.data.query;
	    }, function(error){
	    	console.dir(error.data.message);
	    });
	});
	
	
</script>
<style type="text/css">
	body{background-color:#f2f2f2}
	th,td{text-align:center}
</style>
</head>
<body data-ng-controller="ListController" class="container">
<!-- class="container-fluid" // width 전체 -->
 	<div class="row">
	 	<div class="col-md-4" style="background-color: red;color:lightblue">{{response.success}}</div>
	 	<div class="col-md-4" style="background-color: blue;color:lightblue"><pre style="height:50px">{{response}}</pre></div>
	 	<div class="col-md-4" style="background-color: green;color:lightblue">{{response.message}}</div>
	 </div>
	 <br/><br/>
	 <a href="./append.jsp" class="btn btn-primary">직원추가</a>
	 <br/><br/>
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
 			<th>Modify</th>
 			<th>Delete</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<tr data-ng-repeat="d in emps">
			<td class="active">{{d.empno}}</td>
			<td class="active"><a href="./detail.jsp?empno={{d.empno}}">{{d.ename}}</a></td>
			<td class="active">{{d.job}}</td>
			<td class="active">{{d.mgr}}</td>
<!-- 			<td class="active">{{d.hiredate | date:'yyyy년 MM월 dd일'}}</td> -->
			<td class="active">{{d.hiredate | date:'yyyy년 MM월 dd일'}}</td>
			<td class="active">{{d.sal}}</td>
			<td class="active">{{d.comm}}</td>
			<td class="active">{{d.deptno}}</td>
			<td class="active"><a href="./update.jsp?empno={{d.empno}}" class="btn btn-default"><i class="glyphicon glyphicon-edit">수정</i></a></td>
	 		<td class="active"><a href="./delete.jsp?empno={{d.empno}}" class="btn btn-default"><i class="glyphicon glyphicon-remove">삭제</i></a></td>
	 		</tr>
	 	</tbody>
	 </table>
</body>
</html>