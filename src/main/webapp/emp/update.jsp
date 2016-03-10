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
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap-tpls.min.js"></script>

<script type="text/javascript">
	var app = angular.module("Employee",['ui.bootstrap']);
	app.controller("UpdateController", function($scope, $http) {
		
		$scope.empno=${param.empno}; // 직원번호 바인딩 모델 생성
		
		// mgrs 불러오기
		var json = $http.get("/Employee/emp/mgrs");
	    json.then(function(value) {
	    	console.dir(value);
	    	$scope.mgrs = value.data;
	    }, function(error){
	    	console.dir(error);
	    });
	    
	    $scope.label = function(mgr){
	    	return mgr.empno + " / " + mgr.ename;
	    };
	    
	    // dept_list 불러오기
		var json2 = $http.get("/Employee/dept/list");
	    json2.then(function(value) {
	    	console.dir(value);
	    	$scope.depts = value.data;
	    }, function(error){
	    	console.dir(error);
	    });
	    
	    $scope.deptLabel = function(dept){
	    	return dept.deptno + " / " + dept.dname + " / " + dept.loc;
	    };
		
	    // 직원정보 불러오기
		var ajax=$http.get("/Employee/emp?empno="+$scope.empno);
		ajax.then(function(value) {
			$scope.emp=value.data;
		});
		
		// 직원수정 전송
		$scope.submit=function(){
			var ajax = $http.put("/Employee/emp", $scope.emp);
			
			ajax.then(function(value) {
				console.dir(value);
				if(value.data.success){
					alert(value.data.message);
					location.href = "./list.jsp";
				}else{
					alert(value.data.message);
				}
			}, function(reason) {
				alert(value.data.message);
				console.dir(reason);
			});
			
		};

		
		$scope.format = function() {
			var seen = [];
		    var json = JSON.stringify($scope.empForm, function(key, value){
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

		// 달력
		$scope.isOpen=false;
		$scope.open = function(){
			$scope.isOpen=true;
		};
		
		// 달력 클리어

		$scope.clear = function(){
			//$scope.emp.hiredate=null;
			delete $scope.emp.hiredate;
		};
		
// 		$scope.select = function(check,check2){
// 			if(check==check2){
// 				return true;
// 			}else{
// 				return false;
// 			}
// 		};

	});	
	
</script>
<style type="text/css">
	label{width:80px}
	body{background-color:#f2f2f2;}
</style>
</head>
<body data-ng-controller="UpdateController" class="container">
	<br/>
	<a href="./list.jsp" class="btn btn-info">직원 리스트</a>	
	<br/><br/>	

	<div class="form-group">
		입력된 데이터 (JSON)<br/>
		<pre>{{emp}}</pre>
	</div>

	<div class="panel panel-primary">
	
		<div class="panel-heading">
		직원수정
		</div>

		<div class="panel-body">
	
		<!-- novalidate="novalidate" 검증x -->
		<form role="form" name="empForm" method="post" novalidate="novalidate" data-ng-submit="submit()">
			
			<!-- empno -->
			<div class="form-group">
				<label for="empno">Empno</label>
				<input id="empno" type="number" name="empno" class="form-control" data-ng-model="emp.empno" data-ng-min="1000" data-ng-max="9999" required="required" readonly="readonly" />
				<div data-ng-show="empForm.empno.$dirty">
					<div data-ng-show="empForm.empno.$error.required">필수입력 항목입니다.</div>
					<div data-ng-show="empForm.empno.$error.number">숫자만 입력하세요.</div>
					<div data-ng-show="empForm.empno.$error.max">숫자를 9999 이하의 범위에서 입력하세요.</div>
					<div data-ng-show="empForm.empno.$error.min">숫자를 1000 이상의 범위에서 입력하세요.</div>
				</div>
			</div>
	
			
			<!-- ename -->
			<div class="form-group">
				<label for="ename">Ename</label>
				<input id="ename" name="ename" class="form-control" data-ng-model="emp.ename" data-ng-minlength="2" data-ng-maxlength="10" data-ng-pattern="/^[가-힣a-zA-Z]+$/" required="required" />
				<div data-ng-show="empForm.ename.$dirty">
					<div data-ng-show="empForm.ename.$error.required">필수입력 항목입니다.</div>
					<div data-ng-show="empForm.ename.$error.maxlength">최대 10글자 이하로 입력하세요.</div>
					<div data-ng-show="empForm.ename.$error.minlength">최소 2글자 이상으로 입력하세요.</div>
					<div data-ng-show="empForm.ename.$error.pattern">한글과 영문자만 입력하세요.</div>
				</div>
			</div>
			
			<!-- job -->
			<div class="form-group">
				<label for="job">Job</label>
				<input id="job" name="job" class="form-control" data-ng-model="emp.job" data-ng-maxlength="9" />
				<div data-ng-show="empForm.job.$dirty">
					<div data-ng-show="empForm.job.$error.maxlength">최대 9글자 이하로 입력하세요.</div>
				</div>
			</div>
			
			<!-- mgr -->
			<div class="form-group">
				<label for="mgr">Mgr</label>
	<!-- 			<div> -->
	<!-- 				<select id="mgr" name="mgr" class="form-control" data-ng-model="emp.mgr"> -->
	<!-- 					<option>--선택하세요--</option> -->
	<!-- 					<option data-ng-repeat="mgr in mgrs" value="{{mgr.empno}}" data-ng-selected="select(emp.mgr,mgr.empno)">{{mgr.empno}} / {{mgr.ename}}</option>				 -->
	<!-- 				</select> -->
	<!-- 			</div> -->
				<div>
					<select id="mgr" name="mgr" class="form-control" data-ng-model="emp.mgr" data-ng-options="mgr.empno as label(mgr) for mgr in mgrs">
						<option value="">--선택하세요--</option>
					</select>
				</div>
			</div>
			
			<!-- mgr descript -->
	<!-- 		<div class="form-group"> -->
	<!-- 			<label for="mgr">Mgr</label> -->
	<!-- 			<input id="mgr" name="mgr" class="form-control" data-ng-model="emp.mgr" data-ng-min="1000" data-ng-max="9999"  /> -->
	<!-- 			<div data-ng-show="empForm.job.$dirty"> -->
	<!-- 				<div data-ng-show="empForm.job.$error.required">최소 1000 이상으로 입력하세요.</div> -->
	<!-- 				<div data-ng-show="empForm.job.$error.maxlength">최대 9999 이하로 입력하세요.</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
			
			<!-- hiredate -->
			<label for="hiredate">Hiredate</label>
				<div class="input-group">
					<input type="text" name="hiredate" class="form-control" data-ng-click="open()" data-uib-datepicker-popup="{{format}}" data-ng-model="emp.hiredate" data-is-open="isOpen" data-datepicker-options="dateOptions" data-ng-required="false" data-close-text="Close" data-alt-input-formats="altInputFormats" readonly="readonly" />
					<span class="input-group-btn">
						<button type="button" class="btn btn-default" data-ng-click="open()"><i class="glyphicon glyphicon-calendar" style="color:lightblue;"></i></button>
						<button type="button" class="btn btn-default" data-ng-click="clear()"><i class="glyphicon glyphicon-remove" style="color:lightblue;"></i></button>
					</span>
				</div>
			
			<!-- sal -->
			<div class="form-group">
				<label for="sal">Sal</label>
				<input id="sal" type="number" name="sal" class="form-control" data-ng-model="emp.sal" data-ng-min="0" data-ng-max="9999999" />
				<div data-ng-show="empForm.sal.$dirty">
					<div data-ng-show="empForm.sal.$error.number">숫자로만 입력하세요.</div>
					<div data-ng-show="empForm.sal.$error.min">최소 0 이상으로 입력하세요.</div>
					<div data-ng-show="empForm.sal.$error.max">최대 9999999 이하로 입력하세요.</div>
				</div>
			</div>
			
			<!-- comm -->
			<div class="form-group">
				<label for="comm">Comm</label>
				<input id="comm" type="number" name="comm" class="form-control" data-ng-model="emp.comm" data-ng-min="0" data-ng-max="9999999" />
				<div data-ng-show="empForm.comm.$dirty">
					<div data-ng-show="empForm.comm.$error.number">숫자로만 입력하세요.</div>
					<div data-ng-show="empForm.comm.$error.min">최소 0 이상으로 입력하세요.</div>
					<div data-ng-show="empForm.comm.$error.max">최대 9999999 이하로 입력하세요.</div>
				</div>
			</div>
			
			<!-- deptno -->
			<div class="form-group">
				<label for="deptno">Deptno</label>
				<select id="deptno" name="deptno" class="form-control" data-ng-model="emp.deptno" data-ng-options="dept.deptno as deptLabel(dept) for dept in depts">
					<option value="">--선택하세요--</option>
				</select>
			</div>
				<input type="submit" class="btn btn-primary" data-ng-disabled="empForm.$invalid" value="직원수정" />
	
		</form>
	
		</div>
	</div>
	
	
	<div class="panel panel-primary">

		<div class="panel-heading">
		직원수정(디버깅)
		</div>
	
		<div class="panel-body">

			<textarea rows="5" style="width:100%;">{{format()}}</textarea>
			<!-- ~~.$dirty = 입력여부 / ~~.$valid = 유효성 / ~~.$invalid = 비유효성 / ~~.$error = 오류상태 -->
			<ul>
				<li>empForm.$dirty={{empForm.$dirty}}</li>
				<li>empForm.$valid={{empForm.$valid}}</li>
				<li>empForm.$invalid={{empForm.$invalid}}</li>
				<li>empForm.empno.$dirty={{empForm.empno.$dirty}}</li>
				<li>empForm.empno.$valid={{empForm.empno.$valid}}</li>
				<li>empForm.empno.$invalid={{empForm.empno.$invalid}}</li>
				<li>empForm.empno.$error={{empForm.empno.$error}}</li>
				<li>empForm.ename.$error={{empForm.ename.$error}}</li>
				<li>empForm.job.$error={{empForm.job.$error}}</li>
			</ul>
		</div>
	</div>
</body>
</html>