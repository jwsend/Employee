
select * from emp

select * from dept where deptno=10

select * from dept

delete from dept where deptno=0



--- emp table ---
--- select ALL ---
select empno,
	ename,
	job,
	mgr,
	hiredate,
	sal,
	comm,
	deptno
from emp

--- select (where)  ---
select empno,
	ename,
	job,
	mgr,
	hiredate,
	sal,
	comm,
	deptno
	from emp
where empno = 1


--- insert ---
insert into emp
(
	empno,
	ename,
	job,
	mgr,
	hiredate,
	sal,
	comm,
	deptno
)
values
(
	23,
	'홍길동',
	null,
	null,
	null,
	null,
	null,
	null
)


--- update ---
update emp
	set ename = '테스트',
		job = 'developer',
		mgr = 1,
		hiredate = null,
		sal = null,
		comm = null,
		deptno = 10
where empno = 1


--- delete ---
delete from emp where empno = 1


--- select (join)  ---
select e.empno	as emp_empno,
	e.ename	as emp_ename,
	e.job	as emp_job,
	e.mgr	as emp_mgr,
	e.hiredate	as emp_hiredate,
	e.sal	as emp_sal,
	e.comm	as emp_comm,
	d.deptno	as dept_deptno,
	d.dname	as dept_dname,
	d.loc	as dept_loc
	from emp e, dept d
where e.deptno=d.deptno and empno=7369


--- select (left outer) 일치하지 않아도 나온다 (left,right) ---
select e.empno	as emp_empno,
	e.ename	as emp_ename,
	e.job	as emp_job,
	e.mgr	as emp_mgr,
	e.hiredate	as emp_hiredate,
	e.sal	as emp_sal,
	e.comm	as emp_comm,
	d.deptno	as dept_deptno,
	d.dname	as dept_dname,
	d.loc	as dept_loc
	from emp e left outer join dept d 
	on e.deptno = d.deptno
	where empno=21
	

--- select (inner join) 반드시 일치해야 나온다. ---
select e.empno	as emp_empno,
	e.ename	as emp_ename,
	e.job	as emp_job,
	e.mgr	as emp_mgr,
	e.hiredate	as emp_hiredate,
	e.sal	as emp_sal,
	e.comm	as emp_comm,
	d.deptno	as dept_deptno,
	d.dname	as dept_dname,
	d.loc	as dept_loc
	from emp e inner join dept d on e.deptno = d.deptno
	where empno=7369