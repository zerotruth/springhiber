package com.application.dao;

import java.util.List;

import com.application.model.Department;
public interface DepartmentDAO {
	public void addDepartment(Department department) ;
	 public List<Department> getAllDepartments();
	 public Department updateDepartment(Department department);
	 public void deleteDepartment(Integer id);
	 public Department getDepartment(int id);
//	 public void deleteDept(Integer id);
}
