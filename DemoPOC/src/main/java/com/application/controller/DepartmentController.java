package com.application.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.application.dto.EmployeeDTO;
import com.application.model.Department;
import com.application.model.Employee;
import com.application.service.DepartmentService;
import com.application.service.EmployeeService;
/**
 * 
 * @author Ankit
 *
 */
@Controller
public class DepartmentController
{
	
	@Autowired
	DepartmentService ds;
	
	@Autowired
	EmployeeService es;
	
	
	@RequestMapping(value="/deptSummary")
	public ModelAndView showDept(@ModelAttribute("department") Department department) {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		List<Department> departments = ds.getAllDepartments();
 	     modelAndView.addObject("departmentList", departments);
 	     

		
	  	return modelAndView;
	}
	
	@RequestMapping(value="/reload")
	public ModelAndView reload(@ModelAttribute("department") Department department) {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		List<Department> departments = ds.getAllDepartments();
 	     modelAndView.addObject("departmentList", departments);
 	    List<Employee> employees = es.getAllEmployees();
 	   List<EmployeeDTO> employeeDTO = new ArrayList<>();
		for(Employee e:employees) {
			EmployeeDTO dto = new EmployeeDTO();
			Department department1 = ds.getDepartment(e.getDepartment());
			System.out.println("Value For Department"+department1);
			BeanUtils.copyProperties(e, dto);
			System.out.println("Values in DTO"+dto);
			System.out.println(department1.getDeptname());
			dto.setDepartment(department1.getDeptname());
			employeeDTO.add(dto);
		}
		System.out.println(employeeDTO);
 	    modelAndView.addObject("employeeList", employeeDTO);
//	  	modelAndView.addObject("employeeList", employees);
 	    return modelAndView;
	}
		
	
	@RequestMapping(value="/showConfig")
	public ModelAndView showConfig(@ModelAttribute("department") Department department) {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		List<Department> departments = ds.getAllDepartments();
 	     modelAndView.addObject("departmentList", departments);
 	     
 	    
	  	return modelAndView;
	}
	
	@RequestMapping(value = "/logoutbtn" , method = RequestMethod.POST)
    public String logout(Model model,HttpServletRequest request,HttpServletResponse response){
	 
        response.setHeader("Cache-Control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");

        HttpSession session=request.getSession();  
        
        session.invalidate();
        return "loginPage";
    }
	@RequestMapping(value = "/addDept",  method = RequestMethod.GET)
	  public String init(Model model) {
	    
	    return "addDept";
    }   
	@RequestMapping("/backbtn")
	public ModelAndView backUser(@ModelAttribute("department") Department department) {
		
		ModelAndView modelAndView = new ModelAndView("dashboard");
		
		 
		
		 List<Department> departments = ds.getAllDepartments();
  	     modelAndView.addObject("departmentList", departments);
  	  
  	    return modelAndView;
	}
	@RequestMapping(value="/addition" ,  method = RequestMethod.POST)
	public ModelAndView addDept(@ModelAttribute("department") Department department) {
		ModelAndView modelAndView = new ModelAndView("dashboard");
		
		List<Employee> employees = es.getAllEmployees();
		List<EmployeeDTO> employeeDTO = new ArrayList<>();
		for(Employee e:employees) {
			EmployeeDTO dto = new EmployeeDTO();
			Department department1 = ds.getDepartment(e.getDepartment());
			System.out.println("Value For Department"+department1);
			BeanUtils.copyProperties(e, dto);
			System.out.println("Values in DTO"+dto);
			System.out.println(department1.getDeptname());
			dto.setDepartment(department1.getDeptname());
			employeeDTO.add(dto);
		}
		System.out.println(employeeDTO);
  	    modelAndView.addObject("employeeList", employeeDTO);
//	  	modelAndView.addObject("employeeList", employees);
		
		System.out.println("welcome" + "obj"+department);
		ds.addDepartment(department);
		List<Department> departments = ds.getAllDepartments();
		modelAndView.addObject("css", "success");
         modelAndView.addObject("msg","Department has been added succesfully");
  	    modelAndView.addObject("departmentList", departments);
  	    return modelAndView;
	}
	

	
	@RequestMapping(value="/getDepartmentDetails",method=RequestMethod.GET)
	public ModelAndView getDepartmentDetails(@RequestParam("id") int id) {
		Department department = ds.getDepartment(id);
		System.out.println("hhhhhh    "+department);
		  ModelAndView model = new ModelAndView("dashboard");
		  model.addObject("department", department);
		  return  model;	
   }
	
	@RequestMapping(value = "/deleteDepartment", method = RequestMethod.GET)
    public ModelAndView deleteDepartment(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
//        ds.deleteDepartment(id);
        
        ModelAndView modelAndView = new ModelAndView("dashboard");
        
//        List<Employee> employees = es.getAllEmployees();
//        List<EmployeeDTO> employeeDTO = new ArrayList<>();
//		for(Employee e:employees) {
//			EmployeeDTO dto = new EmployeeDTO();
//			Department department = ds.getDepartment(e.getDepartment());
//			System.out.println("Value For Department"+department);
//			BeanUtils.copyProperties(e, dto);
//			System.out.println("Values in DTO"+dto);
//			System.out.println(department.getDeptname());
//			dto.setDepartment(department.getDeptname());
//			employeeDTO.add(dto);
//		}
//		System.out.println(employeeDTO);
//  	    modelAndView.addObject("employeeList", employeeDTO);
////	  	modelAndView.addObject("employeeList", employees);
        
        List<Employee> employeeList = es.getAllEmployeeByDepartmentId(id);
        if(employeeList.isEmpty()) {
        	ds.deleteDepartment(id);
    		modelAndView.addObject("css" , "success");
    		modelAndView.addObject("msg" , " Department record deleted");
    		System.out.println("Employee LIst found");
    		
        }
        
        else {  
		
		modelAndView.addObject("css" , "danger");
		modelAndView.addObject("msg" , " Department records cannot be deleted");
        }
        List<Department> departments = ds.getAllDepartments();
  	    modelAndView.addObject("departmentList", departments);
		return modelAndView;
        
    }
	@RequestMapping(value = "/saveDept", method = RequestMethod.POST)
    public ModelAndView saveDepartment(@ModelAttribute Department department) {
	 	
	 ModelAndView modelAndView = new ModelAndView("dashboard");
	 System.out.println(department);
	 if (department.getId() == 0) { 
           ds.addDepartment(department);
          
          } else {
            ds.updateDepartment(department);
            List<Department> departments = ds.getAllDepartments();
            modelAndView.addObject("css", "success");
	         modelAndView.addObject("msg","Department information has been updated succesfully");
            modelAndView.addObject("departmentList", departments);
         }
	 return modelAndView;   
        
    }
	@RequestMapping(value = "/editDepartment", method = RequestMethod.GET)
    public ModelAndView editContact(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Department department = ds.getDepartment(id);
        ModelAndView model = new ModelAndView("editDept");
        model.addObject("department", department);
        
        return model;
    }
	
	
	
}
