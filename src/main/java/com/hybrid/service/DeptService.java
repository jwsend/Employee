package com.hybrid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hybrid.mapper.DeptMapper;
import com.hybrid.model.Dept;

//어노테이션 서비스등록(@Service), 자동DI(@Autowired), 트렉젝션시작(@Transactional)

@Service
public class DeptService { // Bean등록을 하지 않아도 SpringFactory Bean에 자동등록
	
	// Spring 프레임웍에서 자동주입(필드주입)
	@Autowired
	DeptMapper deptMapper;

	// Spring 프레임웍에서 커넥션을 자동으로 가져온다.
	@Transactional
	public List<Dept> getList(){
		List<Dept> depts = deptMapper.selectAll();
		return depts;
	}
	
	@Transactional
	public Dept getDept(Integer deptno){
		return deptMapper.selectByDeptno(deptno);
	}
	
	@Transactional
	public void insert(Dept dept){
		deptMapper.insert(dept);
	}
	
	@Transactional
	public Dept delete(Integer deptno){
		Dept dept = deptMapper.selectByDeptno(deptno);
		deptMapper.deleteByDeptno(deptno);
		return dept;
		
	}
	
	@Transactional
	public void update(Dept dept){
		deptMapper.updateByDeptno(dept);		
	}

}
