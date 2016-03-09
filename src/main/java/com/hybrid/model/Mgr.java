package com.hybrid.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="Mgr")
public class Mgr {
	int empno; // 4  ( min=1000, max=9999 )
	String ename; // 10 ( maxlength=10 )
	
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
	
}
