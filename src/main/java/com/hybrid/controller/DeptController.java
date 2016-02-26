package com.hybrid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hybrid.model.Dept;
import com.hybrid.service.DeptService;

// 어노테이션으로 컨트롤러를 자동 bean등록
@Controller
public class DeptController {
	
	@Autowired
	DeptService deptService;
	
	@RequestMapping(value="/dept/list")
	// URL상으로 직접 호출이 가능하게 리퀘스트맵핑
	@ResponseBody
	// Jackson 라이브러리를 사용해서 JSON 형태의 포맷으로 리턴한다. (안드로이드에서도 동일)
	public List<Dept> getList(){
		
		return deptService.getList();
	}

}
