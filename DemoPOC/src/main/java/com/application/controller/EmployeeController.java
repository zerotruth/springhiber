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
import org.apache.log4j.Logger;

import com.application.dto.EmployeeDTO;
import com.application.model.Department;
import com.application.model.Employee;
import com.application.service.DepartmentService;
import com.application.service.EmployeeService;



@Controller
public class EmployeeController
{
	static Logger logger = Logger.getLogger(EmployeeController.class.getName());
	
	@Autowired
	EmployeeService es;
	
	@Autowired
	DepartmentService ds;
	
	@Autowired
	HttpSession session;
	

	@RequestMapping(value="/empSummary")
	public ModelAndView showEmp(@ModelAttribute("employee") Employee employee) {
		ModelAndView modelAndView = new ModelAndView("dashemp");
		
		String id =(String) session.getAttribute("id");
		
		System.out.println("Value of id in session"+id);
		if(id==null) {
			session.invalidate();
			modelAndView.setViewName("loginPage");
			return modelAndView;
		}
 	     
 	    List<Employee> employees = es.getAllEmployees();
 	    List<EmployeeDTO> employeeDTO = new ArrayList<>();
		for(Employee e:employees) {
			EmployeeDTO dto = new EmployeeDTO();


			BeanUtils.copyProperties(e, dto);
			logger.info("values in DTO"+dto);


			employeeDTO.add(dto);
		}
		System.out.println(employeeDTO);
 	    modelAndView.addObject("employeeList", employeeDTO);


 	    
	  	return modelAndView;
	}
	

	@RequestMapping(value = "/addEmp",  method = RequestMethod.GET)
	  public String init(Model model) {
	    List<Department> departments = ds.getAllDepartments();
	    model.addAttribute("deptlist", departments);
	    System.out.println("Values :"+es.getListDept().size());
	     return "addEmp";
      }   
	
	
	
	
	@RequestMapping(value = "/logout" , method = RequestMethod.POST)
    public String logout(Model model,HttpServletRequest request,HttpServletResponse response){
	 
        response.setHeader("Cache-Control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");

        HttpSession session=request.getSession();  
        
        session.invalidate();
        
        return "loginPage";
    }
	 
	@RequestMapping("/back")
	public ModelAndView backUser(@ModelAttribute("employee") Employee employee) {
		
		ModelAndView modelAndView = new ModelAndView("dashemp");
		

	     
		List<Employee> employees = es.getAllEmployees();
		List<EmployeeDTO> employeeDTO = new ArrayList<>();
		for(Employee e:employees) {
			EmployeeDTO dto = new EmployeeDTO();


			BeanUtils.copyProperties(e, dto);
			System.out.println("Values in DTO"+dto);

			employeeDTO.add(dto);
		}
		System.out.println(employeeDTO);
  	    modelAndView.addObject("employeeList", employeeDTO);

  	  
  	    return modelAndView;
	}
	
	
    
	@RequestMapping(value="/add" ,  method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("employee")  Employee employee) {
		ModelAndView modelAndView = new ModelAndView("dashemp");
	    es.addEmployee(employee);
		List<Employee> employees = es.getAllEmployees();
//  	    modelAndView.addObject("employeeList", employees);
		List<EmployeeDTO> employeeDTO = new ArrayList<>();
		for(Employee e:employees) {
			EmployeeDTO dto = new EmployeeDTO();
			Department department = ds.getDepartment(e.getDepartment());
			System.out.println("Value For Department"+department);
			logger.info("helloooooo");
			BeanUtils.copyProperties(e, dto);
			System.out.println("Values in DTO"+dto);
			System.out.println(department.getDeptname());
			dto.setDepartment(department.getDeptname());
			employeeDTO.add(dto);
		}
		 System.out.println(employeeDTO);
		 
		    modelAndView.addObject("css", "success");
	        modelAndView.addObject("msg","Employee has been added succesfully");
  	     modelAndView.addObject("employeeList", employeeDTO);
  	

	     return modelAndView;
	}
	
	
	
	
	/**
	 * this is the method
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getEmployeeDetails",method=RequestMethod.GET)
	public ModelAndView getEmployeeDetails(@RequestParam("id") int id) {
		Employee employee = es.getEmployee(id);
		System.out.println("hhhhhh    "+employee);
		  ModelAndView model = new ModelAndView("dashemp");
		  model.addObject("employee", employee);
		  return  model;	
   }
	
	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
    public ModelAndView saveEmployee(@ModelAttribute Employee employee) {
	 	
	 ModelAndView modelAndView = new ModelAndView("dashemp");
	 System.out.println(employee);
	 if (employee.getId() == 0) { 
           es.addEmployee(employee);
          
          } else {
            es.updateEmployee(employee);
            List<Employee> employees = es.getAllEmployees();
            List<EmployeeDTO> employeeDTO = new ArrayList<>();
    		for(Employee e:employees) {
    			EmployeeDTO dto = new EmployeeDTO();
    			
    			BeanUtils.copyProperties(e, dto);
    			System.out.println("Values in DTO"+dto);
    		
    			employeeDTO.add(dto); 
    		}
    		System.out.println(employeeDTO);
    		
    		 modelAndView.addObject("css", "success");
 	         modelAndView.addObject("msg",employee.getFirstname()+ " " + "Employee information has been updated succesfully");
      	    modelAndView.addObject("employeeList", employeeDTO);
     
           }
	 
	 return modelAndView;   
        
    }
	@RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
    public ModelAndView editContact(HttpServletRequest request,Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = es.getEmployee(id); 
        List<Department> departments = ds.getAllDepartments();
	    model.addAttribute("deptlist", departments);
        ModelAndView modelAndView = new ModelAndView("addEmp");
        modelAndView.addObject("employee", employee);
 
        return modelAndView;
    }
    
	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
    public ModelAndView deleteEmployee(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        es.deleteEmployee(id);
        
      ModelAndView modelAndView = new ModelAndView("dashemp");
      
		List<Employee> employees = es.getAllEmployees();
		List<EmployeeDTO> employeeDTO = new ArrayList<>();
		for(Employee e:employees) {
			EmployeeDTO dto = new EmployeeDTO();
						BeanUtils.copyProperties(e, dto);
			logger.info("deleted sssssssss");
			
			employeeDTO.add(dto);
		}
		System.out.println(employeeDTO);
		
		modelAndView.addObject("css", "danger");
         modelAndView.addObject("msg","Employee information has been deleted succesfully");
  	    modelAndView.addObject("employeeList", employeeDTO);

  	    
  	    
		return modelAndView;
        
    }
	
  @RequestMapping(value="/showAnalysis", method = RequestMethod.GET)
  public ModelAndView showAnalysis(HttpServletRequest request,HttpServletResponse response) {
	ModelAndView modelAndView = new ModelAndView("highchart");
    modelAndView.addObject("deptvalue", es.getEmployeesByAllDepartment());

	List<Object[]> objects = es.getEmployeeSalary();
    modelAndView.addObject("employeeSalary", objects);
    modelAndView.addObject("employeeSkill", es.getSkillSet());
	return modelAndView;

	}
}
