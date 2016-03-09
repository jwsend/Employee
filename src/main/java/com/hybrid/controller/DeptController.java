package com.hybrid.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hybrid.model.Dept;
import com.hybrid.service.DeptService;

// 어노테이션으로 컨트롤러를 자동 bean등록
@Controller
public class DeptController {
	
	static Log log = LogFactory.getLog(DeptController.class);
	
	@Autowired
	DeptService deptService;
	
	@RequestMapping(value="/dept/list", method=RequestMethod.GET)
	// URL상으로 직접 호출이 가능하게 리퀘스트맵핑
	@ResponseBody
	// Jackson 라이브러리를 사용해서 JSON 형태의 포맷으로 리턴한다. (안드로이드에서도 동일)
	public List<Dept> getList(){
		
		return deptService.getList();
	}
	
	@RequestMapping(value="/dept", method=RequestMethod.GET)
	@ResponseBody
	public Dept getDept(Integer deptno){
		log.info("getDept(); deptno="+deptno);
		return deptService.getDept(deptno);
	}
	
	@RequestMapping(value="/dept", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postDept(@RequestBody Dept dept){
		// 파라미터 인자의 @RequestBody 어노테이션은 넘어온 파라미터 값을 JSON 형태로 바꿔준다.
		log.info("deptno="+dept.getDeptno());
		log.info("deptdname="+dept.getDname());
		log.info("deptloc="+dept.getLoc());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서가 추가되었습니다.");
		
		try{
			deptService.insert(dept);
		}catch (DuplicateKeyException ex){
			log.info(ex.getMessage());
			response.put("success", false);
			response.put("message", "부서번호 중복입니다. 다시 입력하세요.");
		}		
		
		return response;
	}
	
	@RequestMapping(value="/dept", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteDept(Integer deptno){		
		log.info("deptno="+deptno);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서가 삭제되었습니다.");
		
		try{
			deptService.delete(deptno);
		}catch(DataIntegrityViolationException ex){
			log.info("Error : "+ex);
			response.put("success", false);
			response.put("message", "직원이 포함된 부서는 삭제할 수 없습니다.");
		}catch (RuntimeException ex2){
			log.info(ex2.getMessage());
			response.put("success", false);
			response.put("message", "부서삭제 에러입니다. 다시 확인하세요.");
		}
		return response;
		
	}

	@RequestMapping(value="/dept", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> updateDept(@RequestBody Dept dept){		
		log.info("deptno="+dept.getDeptno());
		log.info("deptdname="+dept.getDname());
		log.info("deptloc="+dept.getLoc());
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서가 수정되었습니다.");

		try{
			deptService.update(dept);
		}catch (RuntimeException ex){
			log.info(ex.getMessage());
			response.put("success", false);
			response.put("message", "부서수정 에러입니다. 다시 확인하세요.");
		}
		return response;
	}
	
	
	// Spring 통한 View 구현 (REST 방식에선 필요없다.)
	@RequestMapping(value="/dept/listview",method=RequestMethod.GET)
	public String getListView(){
		log.info("getListView()...");
		return "dept/list";
	}
	
}
