package com.hybrid.mapper;

import java.util.List;

import com.hybrid.model.Dept;

public interface DeptMapper {
	List<Dept> selectAll();
	Dept selectByDeptno(int deptno); // int deptno는 xml에서 #{deptno} 형식으로 전달받는다.
	
	int insert(Dept dept);
	int updateByDeptno(Dept dept);
	int deleteByDeptno(int deptno);
	
}
