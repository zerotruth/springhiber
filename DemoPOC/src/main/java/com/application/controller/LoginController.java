package com.application.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.application.dto.EmployeeDTO;
import com.application.model.Department;
import com.application.model.Employee;
import com.application.model.LoginBean;
import com.application.service.DepartmentService;
import com.application.service.EmployeeService;

@Controller
public class LoginController
{
	@Autowired
	EmployeeService es;
	@Autowired
	DepartmentService ds;
	@Autowired
	HttpSession session;
	 @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	  public String init(Model model) {
	    return "loginPage";
    
	 }   
    //Separate method to  validate Username and password
	 @PostMapping(value="/LoginController")
	 public String submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean, HttpServletRequest request) {
  		 //validate user
		
		 session.setAttribute("id", "id");
		 session.setMaxInactiveInterval(2000);
    	      if (loginBean.getUsername().equals("admin") && loginBean.getPassword().equals("admin")) {
    	    	  
    	    	
    	    	  
    	    	  List<Department> departments = ds.getAllDepartments();
    	    	  request.setAttribute("departmentList", departments);
    	    	  request.setAttribute("test", "test");
    	    	  return "dashboard";
    	      } else {
    	        
    	    	  System.out.println("failed");
    	       
    	        return "loginPage";
    	        
    	      }
    	      
    	    		  
	 }
    	  
}
	


