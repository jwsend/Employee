<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript">
	var app = angular.module("Employee",[]);
	app.controller("UpdateController", function($scope, $http) {
		
		$scope.deptno=${param.deptno}; // 바인딩 모델 생성
		
		var ajax=$http.get("/Employee/dept?deptno="+$scope.deptno);
		ajax.then(function(value) {
			$scope.dept=value.data;
		});
		
		$scope.submit=function(){
			var ajax = $http.put("/Employee/dept", $scope.dept);
			
			ajax.then(function(value) {
				console.dir(value);
				alert("부서가 수정되었습니다.");
				location.href="./list.jsp";
			}, function(reason) {
				console.dir(reason);
			});
			
		};
/*
		$scope.dept = {
				deptno:10,
				dname:"총무부",
				loc:"서울"
		};*/
		
		
		
		$scope.format = function() {
			var seen = [];
		    var json = JSON.stringify($scope.deptForm, function(key, value){
		        if (typeof value === 'object') {
		            if ( !seen.indexOf(value) ) {
		                return '__cycle__' + (typeof value) + '[' + key + ']'; 
		            }
		            seen.push(value);
		        }
		        return value;
		    }, 4);
		    return json;
		};


	});	
	
</script>
<style type="text/css">
	label{width:80px}
</style>
</head>
<body data-ng-controller="UpdateController" class="container">
	<a href="./list.jsp" class="btn btn-info">부서 리스트</a>
	<hr>
		<textarea rows="10" style="width:100%;">{{format()}}</textarea>
	<!-- ~~.$dirty = 입력여부 / ~~.$valid = 유효성 / ~~.$invalid = 비유효성 / ~~.$error = 오류상태 -->
	<ul>
		<li>deptForm.$dirty={{deptForm.$dirty}}</li>
		<li>deptForm.$valid={{deptForm.$valid}}</li>
		<li>deptForm.$invalid={{deptForm.$invalid}}</li>
		<li>deptForm.dname.$error={{deptForm.dname.$error}}</li>
		<li>deptForm.loc.$error={{deptForm.loc.$error}}</li>
		
	</ul>
	<div class="form-group">
		입력된 데이터 (JSON)<br/>
		<pre>{{dept}}</pre>
	</div>
	<!-- novalidate="novalidate" 검증x -->
	<form name="deptForm" method="post" novalidate="novalidate" data-ng-submit="submit()">
		
		<!-- deptno -->
		<div class="form-group">
			<label for="deptno">부서번호</label>
			<input id="deptno" type="number" name="deptno" class="form-control" data-ng-model="dept.deptno" data-ng-min="0" data-ng-max="99" required="required" readonly="readonly" />
			<div data-ng-show="deptForm.deptno.$dirty">
				<div data-ng-show="deptForm.deptno.$error.required">필수입력 항목입니다.</div>
				<div data-ng-show="deptForm.deptno.$error.number">숫자만 입력하세요.</div>
				<div data-ng-show="deptForm.deptno.$error.max">숫자를 99 이하의 범위에서 입력하세요.</div>
				<div data-ng-show="deptForm.deptno.$error.min">숫자를 0 이상의 범위에서 입력하세요.</div>
			</div>
		</div>

		
		<!-- dname -->
		<div class="form-group">
			<label for="dname">부서이름</label>
			<input id="dname" name="dname" class="form-control" data-ng-model="dept.dname" data-ng-minlength="3" data-ng-maxlength="12" data-ng-pattern="/^[가-힣a-zA-Z]+$/"  required="required" />
			<div data-ng-show="deptForm.dname.$dirty">
				<div data-ng-show="deptForm.dname.$error.required">필수입력 항목입니다.</div>
				<div data-ng-show="deptForm.dname.$error.maxlength">최대 12글자 이하로 입력하세요.</div>
				<div data-ng-show="deptForm.dname.$error.minlength">최소 3글자 이상으로 입력하세요.</div>
				<div data-ng-show="deptForm.dname.$error.pattern">한글과 영문자만 입력하세요.</div>
			</div>
		</div>
		
		<!-- loc -->
		<div class="form-group">
			<label for="loc">부서위치</label>
			<input id="loc" name="loc" class="form-control" data-ng-model="dept.loc" data-ng-maxlength="13" required="required" />
			<div data-ng-show="deptForm.loc.$dirty">
				<div data-ng-show="deptForm.loc.$error.required">필수입력 항목입니다.</div>
				<div data-ng-show="deptForm.loc.$error.maxlength">최대 13글자 이하로 입력하세요.</div>
			</div>
		</div>
			<input type="submit" class="btn btn-primary" data-ng-disabled="deptForm.$invalid" value="부서수정" />&nbsp;&nbsp;<input type="reset" class="btn btn-primary" value ="초기화" />

	</form>
</body>
</html>