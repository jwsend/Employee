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

import com.hybrid.exception.EmptyEmpException;
import com.hybrid.model.Emp;
import com.hybrid.model.Mgr;
import com.hybrid.service.EmpService;

// 어노테이션으로 컨트롤러를 자동 bean등록
@Controller
public class EmpController {
	
	static Log log = LogFactory.getLog(EmpController.class);
	
	@Autowired
	EmpService empService;
	
	@RequestMapping(value="/emp/list", method=RequestMethod.GET)
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
		log.info("getEmp() empno="+empno);
		Emp emp = empService.getEmp(empno);
//		Dept dept = new Dept();
//		dept.setDeptno("총무부");
//		emp.setDept(dept);
		return emp;
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postEmp(@RequestBody Emp emp){
		// 파라미터 인자의 @RequestBody 어노테이션은 넘어온 파라미터 값을 JSON 형태로 바꿔준다.
//		log.info("Empno="+emp.getEmpno());
//		log.info("Ename="+emp.getEname());
//		log.info("Job="+emp.getJob());
//		log.info("Mgr="+emp.getMgr());
//		log.info("Sal="+emp.getSal());
//		log.info("Hiredate="+emp.getHiredate());
//		log.info("Comm="+emp.getComm());
//		log.info("Deptno="+emp.getDeptno());

		log.info("emp = " + emp);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "직원이 추가되었습니다.");
		
		try{
			empService.insert(emp);
		}catch (DuplicateKeyException ex){
			log.info(ex.getMessage());
			response.put("success", false);
			response.put("message", "직원번호 중복입니다. 다시 입력하세요.");
		}catch (DataIntegrityViolationException ex2){
			log.info("Error : "+ex2);
			response.put("success", false);
			response.put("message", "데이터 오류입니다. 다시 입력하세요.");
		}catch (RuntimeException ex3){
			log.info("Error : "+ex3);
			response.put("success", false);
			response.put("message", "실행 오류입니다. 다시 입력하세요.");			
		}
		
		return response;
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteEmp(Integer empno){		
		log.info("empno="+empno);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "직원이 삭제되었습니다.");
		
		try{
			empService.delete(empno);
			//서비스에서 리턴된 emp 값을 View 단으로 리턴
			//Emp emp = empService.delete(empno);
			//response.put("data", emp);
		}catch(EmptyEmpException e){
			log.info("Error : "+e);
			response.put("success", false);
			response.put("message", "직원이 없어서 삭제할 수 없습니다.");
		}catch(DataIntegrityViolationException ex){
			log.info("Error : "+ex);
			response.put("success", false);
			response.put("message", "부서가 포함된 직원은 삭제할 수 없습니다.");
		}catch(RuntimeException ex2){
			log.info(ex2.getMessage());
			response.put("success", false);
			response.put("message", "직원삭제 에러입니다. 다시 확인하세요.");
		}
		return response;
		
	}

	@RequestMapping(value="/emp", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> updateEmp(@RequestBody Emp emp){		
		log.info("empno="+emp.getEmpno());
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "직원이 수정되었습니다.");

		try{
			empService.update(emp);
		}catch (RuntimeException ex){
			log.info(ex.getMessage());
			response.put("success", false);
			response.put("message", "직원수정 에러입니다. 다시 확인하세요.");
		}
		return response;
	}
	
	@RequestMapping(value="/emp/mgrs")
	@ResponseBody
	public List<Mgr> getMgrs(){
		return empService.getMgrs();
	}
	
}

