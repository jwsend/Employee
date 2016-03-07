<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript">
	var app = angular.module("Employee",[]);
	app.controller("DeleteController", function($scope, $http) {
	
		$scope.deptno=${param.deptno}; // 바인딩 모델 생성
		
			var ajax = $http['delete']("/Employee/dept?deptno="+$scope.deptno);			
			ajax.then(function(value) {
				console.dir(value);
				alert("부서가 삭제되었습니다.");
				location.href="./list.jsp";
			}, function(reason) {
				console.dir(reason);
				alert("부서가 삭제에 실패하였습니다.");
				location.href="./list.jsp";
			});

	});	
	
</script>
<style type="text/css">
	label{width:80px}
</style>
</head>
<body data-ng-controller="DeleteController" class="container">

</body>
</html>