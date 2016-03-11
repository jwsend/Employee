package com.hybrid.mapper;

import java.util.List;
import java.util.Map;

import com.hybrid.model.Emp;
import com.hybrid.model.Mgr;

public interface EmpMapper {
	List<Emp> selectAll();
	List<Mgr> selectMgrs();
	int selectCount();
	List<Emp> selectPage(Map<String, Integer> paging);

	Emp selectByEmpno(int empno); // int empno는 xml에서 #{empno} 형식으로 전달받는다.

	int insert(Emp emp);
	int updateByEmpno(Emp emp);
	int deleteByEmpno(int empno);
	
}
