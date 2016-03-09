package com.hybrid.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@XmlRootElement(name="Emp")
public class Emp {
	int empno; // 4  ( min=1000, max=9999 )
	String ename; // 10 ( maxlength=10 )
	String job; // 9 ( maxlength=9 )
	Integer mgr; // 4 ( min=1000, max=9999 )
	//@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm a z")
	//@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy년 MM월 dd일")
	Date hiredate; // Date
	Integer sal; // 7 ( min=0, max=9999999 )
	Integer comm; // 7 ( min=0, max=9999999 )
	Integer deptno; // 2 ( min=10, max=99 )
	Dept dept;
	
	@Override
	public String toString() {
		// emp 파라미터 값을 한번에 출력하기 위한 오버라이드	
		ObjectMapper mapper = new ObjectMapper();
		String value = null;
		try {
			value = mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			e.getMessage();
		}
		return value;
	}

	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Integer getMgr() {
		return mgr;
	}
	public void setMgr(Integer mgr) {
		this.mgr = mgr;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public Integer getSal() {
		return sal;
	}
	public void setSal(Integer sal) {
		this.sal = sal;
	}
	public Integer getComm() {
		return comm;
	}
	public void setComm(Integer comm) {
		this.comm = comm;
	}
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}	
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
}
