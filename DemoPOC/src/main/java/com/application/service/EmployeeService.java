package com.application.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.DepartmentDAO;
import com.application.dao.EmployeeDAO;
import com.application.model.Department;
import com.application.model.Employee;


@Service
public class EmployeeService {
  
@Autowired
EmployeeDAO employeeDAO;
	

@Autowired
DepartmentDAO  departmentDAO;
	public void addEmployee(Employee employee) {
		System.out.println("hello");
		employeeDAO.addEmployee(employee);
		
	}
	
	public Employee getEmployee(int id) {
		return employeeDAO.getEmployee(id);
		
	}
	public List<Employee> getAllEmployees() {
		return employeeDAO.getAllEmployees();
	}
	
	 public List<Employee> getListDept(){
			
	    	List<Employee> map ;
	    	map = employeeDAO.getListDept();
	    	return map;
	    	}
	
	public Employee getEmployeeById(int id) {
		return employeeDAO.getEmployee(id);
	}
	    @Transactional
	    public void deleteEmployee(Integer id) {
	        employeeDAO.deleteEmployee(id);
	    }
	    
	    public Employee updateEmployee(Employee employee) {
	        
	        return employeeDAO.updateEmployee(employee);
	    }
	 
	    public void setEmployeeDAO(EmployeeDAO employeeDAO) {
	        this.employeeDAO = employeeDAO;
	    }
	    
	    public List<Object[]> getEmployeesByAllDepartment() {
	    	
			return employeeDAO.getEmployeeByDepartmentId();
	    }
	    
	    public List<Object []> getEmployeeSalary() {
	    	return employeeDAO.getEmployeeSalary();
	    }
	    
	    public Map<String,Integer> getSkillSet(){
			return employeeDAO.getSkillSet();
	    	
	    }
	    public List<Object []> getStacked(){
			return employeeDAO.getStacked();
	    	
	    }
	    
	    public List<Employee> getAllEmployeeByDepartmentId(int id) {
			return employeeDAO.getEmployeeByDepartment(id);
		}

}
