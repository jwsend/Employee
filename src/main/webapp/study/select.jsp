<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>select.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap-tpls.min.js"></script>

<script type="text/javascript">
	var app = angular.module("Employee",['ui.bootstrap']);
	app.controller("ListController", function($scope, $http) {

		var json = $http.get("/Employee/emp/mgrs");
	    json.then(function(value) {
	    	console.dir(value);
	    	$scope.mgrs = value.data;
	    }, function(error){
	    	console.dir(error);
	    });

// 	$scope.mgrs = [
// 		{empno : 10, ename : '홍길동1'},
// 		{empno : 20, ename : '홍길동2'},
// 		{empno : 30, ename : '홍길동3'}	
// 	];
	
	$scope.submit = function(){
		var ajax =  $http.post("/Employee/emp", $scope.emp);
		ajax.then(function(value){
			console.dir(value);
			$scope.mgrs = value.data;
		});
	};
	
	$scope.emp={
			empno:50,
			ename:'테스트',
			deptno:10			
	}
	
	$scope.isOpen=false;
	$scope.open = function(){
		$scope.isOpen=true;
	};
	
});
	
</script>
</head>
<body data-ng-controller="ListController" class="container">
	<h1>select option 연습</h1>	
	<form name="empForm" data-ng-submit="submit()">
	<pre>{{emp}}</pre>
			<select name="mgr" data-ng-model="emp.mgr">
				<option value="">--선택하세요--</option>
				<option data-ng-repeat="mgr in mgrs" value="{{mgr.empno}}">{{mgr.empno}} / {{mgr.ename}}</option>				
			</select>
			<hr>
			<div class="input-group">
				<input type="text" name="hiredate" class="form-control" data-uib-datepicker-popup="{{format}}" data-ng-model="emp.hiredate" data-is-open="isOpen" data-datepicker-options="dateOptions" data-ng-required="true" data-close-text="Close" data-alt-input-formats="altInputFormats" readonly="readonly" />
				<span class="input-group-btn">
					<button type="button" class="btn btn-default" data-ng-click="open()"><i class="glyphicon glyphicon-calendar" style="color:lightblue;"></i></button>
				</span>
			</div>
        	<hr>
			<button type="submit" class="btn btn-primary">전송</button>
	</form>
</body>
</html>