package com.hybrid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hybrid.mapper.EmpMapper;
import com.hybrid.model.Emp;

//어노테이션 서비스등록(@Service), 자동DI(@Autowired), 트렉젝션시작(@Transactional)

@Service
public class EmpService { // Bean등록을 하지 않아도 SpringFactory Bean에 자동등록
	
	// Spring 프레임웍에서 자동주입(필드주입)
	@Autowired
	EmpMapper empMapper;

	// Spring 프레임웍에서 커넥션을 자동으로 가져온다.
	@Transactional
	public List<Emp> getList(){
		List<Emp> Emps = empMapper.selectAll();
		return Emps;
	}
	
	@Transactional
	public Emp getEmp(Integer empno){
		return empMapper.selectByEmpno(empno);
	}
	
	@Transactional
	public void insert(Emp emp){
		empMapper.insert(emp);
	}
	
	@Transactional
	public Emp delete(Integer empno){
		Emp Emp = empMapper.selectByEmpno(empno);
		empMapper.deleteByEmpno(empno);
		return Emp;
		
	}
	
	@Transactional
	public void update(Emp emp){
		empMapper.updateByEmpno(emp);		
	}

}
