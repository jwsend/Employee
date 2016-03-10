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
	
		$scope.empno=${param.empno}; // 바인딩 모델 생성
		
		var ajax = $http.get("/Employee/emp?empno="+$scope.empno);
		
		ajax.then(function(value) {
			$scope.emp = value.data;
		}, function(reason) {
			console.dir=reason.data;
		});
		
		$scope.delpass = function(){
			var ajax = $http['delete']("/Employee/emp?empno="+$scope.empno);			
			ajax.then(function(value) {
				console.dir(value);
				if(value.data.success){
					alert(value.data.message);
					location.href = "./list.jsp";
				}else{
					alert(value.data.message);
				}
			}, function(reason) {
				console.dir(reason);
				alert(value.data.message);
				console.dir(reason);
			});
		}
	});	
	
</script>
<style type="text/css">
	label{width:80px}
	body{background-color:#f2f2f2;}
</style>
</head>
<body data-ng-controller="DeleteController" class="container">
	<br/>
	<a href="./list.jsp" class="btn btn-info">직원 리스트</a>
	<br/><br/>
	
	<div class="panel panel-primary">
		<div class="panel-heading">
			직원삭제
		</div>
		<div class="panel-body">
			<ul>
				<li>Empno : {{emp.empno}}</li>
				<li>Ename : {{emp.ename}}</li>
				<li>Job : {{emp.job}}</li>
				<li>Mgr : {{emp.mgr}}</li>
				<li>hiredate : {{emp.hiredate | date:'yyyy년 MM월 dd일'}}</li>
				<li>sal : {{emp.sal}}</li>
				<li>comm : {{emp.comm}}</li>
				<li>deptno : {{emp.deptno}} {{emp.dept.dname}} {{emp.dept.loc}}</li>
			</ul>
		</div>
		<div class="panel-footer">
			<input type="button" class="btn btn-primary" value="삭제" data-ng-click="delpass()" />
		</div>		
	</div>
	
	<pre>{{emp}}</pre>

</body>
</html>