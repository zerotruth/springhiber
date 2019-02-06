package com.application.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.application.model.Employee;

public interface EmployeeDAO {
	
	public void addEmployee(Employee employee) ;
	 public List<Employee> getAllEmployees();
	 public Employee updateEmployee(Employee employee);
	  public void deleteEmployee(Integer id);
	 public Employee getEmployee(int id);	 
	 public List<Employee> getListDept();
	List<Object []> getEmployeeByDepartmentId();
	List<Object []> getEmployeeSalary();
	
	Map<String,Integer> getSkillSet();
	List<Object []> getStacked();
	List<Employee> getEmployeeByDepartment(int id);
	 
}
