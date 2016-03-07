package com.hybrid.mapper;

import java.util.List;

import com.hybrid.model.Emp;

public interface EmpMapper {
	List<Emp> selectAll();
	Emp selectByEmpno(int empno); // int empno는 xml에서 #{empno} 형식으로 전달받는다.
	
	int insert(Emp emp);
	int updateByEmpno(Emp emp);
	int deleteByEmpno(int empno);
	
}