package com.hybrid.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hybrid.model.Emp;
import com.hybrid.service.EmpService;

// 어노테이션으로 컨트롤러를 자동 bean등록
@Controller
public class EmpController {
	
	static Log log = LogFactory.getLog(EmpController.class);
	
	@Autowired
	EmpService empService;
	
	@RequestMapping(value="/emp/list")
	// URL상으로 직접 호출이 가능하게 리퀘스트맵핑
	@ResponseBody
	// Jackson 라이브러리를 사용해서 JSON 형태의 포맷으로 리턴한다. (안드로이드에서도 동일)
	public Map<String, Object> getList(){
		Map<String, Object> result = new HashMap<String, Object>();
		// 어노테이션으로 DB에서 가져온 데이터를 JSON 타입으로 변경하고
		// HashMap으로 그 데이터의 상태 스테이더스를 추가하여
		// 실제 데이터는 KeyValue인 query 로 참조한다. 
		result.put("success", true);
		result.put("message", "조회성공");
		result.put("query", empService.getList());
		return result;
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.GET)
	@ResponseBody
	public Emp getEmp(Integer empno){
		log.info("getEmp(); empno="+empno);
		return empService.getEmp(empno);
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.POST)
	@ResponseBody
	public Emp postEmp(Emp emp){
		log.info("empno="+emp.getEmpno());
		empService.insert(emp);		
		return emp;
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.DELETE)
	@ResponseBody
	public Emp deleteEmp(Integer empno){		
		
		return empService.delete(empno);
		
	}

	@RequestMapping(value="/emp", method=RequestMethod.PUT)
	@ResponseBody
	public Emp updateEmp(Emp emp){		
		log.info("empno="+emp.getEmpno());
		empService.update(emp);
		return emp;
	}

}
