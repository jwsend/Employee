<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>listpage.jsp</title>
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
		//alert("ListController...");

		var json = $http.get("/Employee/emp/page?pageNo=1");
		json.then(function(value) {
	    	//alert("success = "+res.data.success);
	    	console.dir(value);
	    	$scope.paging = value.data;
	    });
	    
		$scope.paging = {};
		
		$scope.pageChanged = function(){
			var json = $http.get("/Employee/emp/page?pageNo="+$scope.paging.pageNo);
			json.then(function(value) {
		    	//alert("success = "+res.data.success);
		    	console.dir(value);
		    	$scope.paging = value.data;
		    });
		};
	});
	

	
</script>
<style type="text/css">
	body{background-color:#f2f2f2}
	th,td{text-align:center}
</style>
</head>
<body data-ng-controller="ListController" class="container">
<!-- class="container-fluid" // width 전체 -->
	 <br/>
	 <a href="./append.jsp" class="btn btn-primary">직원추가</a>
	 <br/><br/>
	 <table class="table table-bordered table-hover">
	 	<thead>
	 		<tr>
	 			<th colspan="10">
	 				<div data-uib-pagination data-total-items="paging.totalCount" data-ng-model="paging.pageNo" data-ng-change="pageChanged()" data-items-per-page="5" data-max-size="5"></div>
	 			</th>
	 		</tr>
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
	 		<tr data-ng-repeat="pag in paging.emps">
			<td class="active">{{pag.emp.empno}}</td>
			<td class="active"><a href="./detail.jsp?empno={{pag.empno}}">{{pag.ename}}</a></td>
			<td class="active">{{pag.job}}</td>
			<td class="active">{{pag.mgr}}</td>
<!-- 			<td class="active">{{paging.hiredate | date:'yyyy년 MM월 dd일'}}</td> -->
			<td class="active">{{pag.hiredate | date:'yyyy년 MM월 dd일'}}</td>
			<td class="active">{{pag.sal}}</td>
			<td class="active">{{pag.comm}}</td>
			<td class="active">{{pag.deptno}}</td>
			<td class="active"><a href="./update.jsp?empno={{pag.empno}}" class="btn btn-default"><i class="glyphicon glyphicon-edit">수정</i></a></td>
	 		<td class="active"><a href="./delete.jsp?empno={{pag.empno}}" class="btn btn-default"><i class="glyphicon glyphicon-remove">삭제</i></a></td>
	 		</tr>
	 	</tbody>
	 </table>
</body>
</html>