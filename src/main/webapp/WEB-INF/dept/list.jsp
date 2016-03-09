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
		console.log("ListController...");
	    
		$scope.left="왼쪽";
		$scope.right="오른쪽";
		// MODEL => VIEW로 바인딩

		var ajax = $http.get("/Employee/dept/list")
	    ajax.then(function(response) {
	    	console.dir(response);
			console.dir(response.data);
			$scope.depts = response.data;
	    });
		
		$scope.change=function(btnEvent){
		// Click 이벤트로 인한 VIEW => MODEL로 바인딩
		//alert("Change Click..."+btnEvent)
			switch (btnEvent) {
			case "Left":
				$scope.left+="#LeftClick";
				break;
			case "Clear":
				$scope.left="";
				$scope.right="";
				$scope.depts = [{
					deptno : 10,
					dname : '총무부',
					loc : '서울'
				}];
				break;
			case "Right":
				$scope.right+="@RightClick";
				break;

			default:
				break;
			}
		};
		
		$scope.format = function() {
			return JSON.stringify($scope.depts,null,4);
		};

	});
	
	
</script>
</head>
<body data-ng-controller="ListController" class="container">
<!-- class="container-fluid" // width 전체 -->
	 <div class="row">
	 	<div class="col-md-4"><Button class="btn btn-primary" data-ng-click="change('Left')">Change</Button></div>
	 	<div class="col-md-4"><Button class="btn btn-success" data-ng-click="change('Clear')">Change</Button></div>
	 	<div class="col-md-4"><Button class="btn btn-info" data-ng-click="change('Right')">Change</Button></div>
	 </div>
	 
	 <div class="row">
	 	<div class="col-sm-4" style="background-color: red;color:lightblue">{{left}}</div>
	 	<div class="col-sm-4 row-sm-4" style="background-color: green;color:lightblue"><textarea style="width:100%;height:100%">{{format()}}</textarea></div>
	 	<div class="col-sm-4" style="background-color: blue;color:lightblue">{{right}}</div>
	 </div>

	 <div class="row">
	 	<div class="col-sm-4" style="background-color: red"><input data-ng-model="left" style="width:100%;" /></div>
	 	<div class="col-sm-4" style="background-color: green"><textarea data-ng-bind="format()" style="width:100%;height:100%"></textarea></div>
	 	<div class="col-sm-4" style="background-color: blue"><input data-ng-model="right" style="width:100%;" /></div>
	 </div>

	 <hr>

	 <ul data-ng-repeat="dept in depts">
	 	<li><a href="./detail.jsp?deptno={{dept.deptno}}">{{dept.deptno}}</a> / {{dept.dname}} / {{dept.loc}} / <a href="./update.jsp?deptno={{dept.deptno}}">수정</a> / <a href="./delete.jsp?deptno={{dept.deptno}}">삭제</a></li>
	 </ul>
	 
	 
	 <a href="./append.jsp" class="btn btn-success">부서추가</a>
	 <table class="table table-bordered table-hover">
	 	<thead>
	 		<tr>
	 			<th>Deptno</th>
	 			<th>Dname</th>
	 			<th>Loc</th>
	 			<th>Modify</th>
	 			<th>Delete</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<tr data-ng-repeat="d in depts">
	 			<td class="active"><a href="./detail.jsp?deptno={{d.deptno}}">{{d.deptno}}</a></td>
	 			<td class="active">{{d.dname}}</td>
	 			<td class="active">{{d.loc}}</td>
	 			<td class="active"><a href="./update.jsp?deptno={{d.deptno}}" class="btn default">수정</a></td>
	 			<td class="active"><a href="./delete.jsp?deptno={{d.deptno}}">삭제</a></td>
	 		</tr>
	 	</tbody>
	 </table>
</body>
</html>