<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>detail.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript">
	var app = angular.module("Employee",[]);
	app.controller("DetailController", function($scope, $http) {
		$scope.deptno=${param.deptno}; // 바인딩 모델 생성
		
		var ajax = $http.get("/Employee/dept?deptno="+$scope.deptno);
		
		ajax.then(function(value) {
			$scope.dept = value.data;
		}, function(reason) {
			console.dir=reason.data;
		});
		
	});	
	
</script>
<style type="text/css">
	label{width:80px}
</style>
</head>
<body data-ng-controller="DetailController" class="container">
	<a href="./list.jsp" class="btn btn-info">부서 리스트</a>
	<hr>
	<div class="panel panel-primary">
		<div class="panel-heading">
			부서정보
		</div>
		<div class="panel-body">
			<ul>
				<li>Deptno : {{dept.deptno}}</li>
				<li>Dname : {{dept.dname}}</li>
				<li>Loc : {{dept.loc}}</li>
			</ul>
		</div>
		<div class="panel-footer">
		
		</div>		
	</div>

</body>
</html>