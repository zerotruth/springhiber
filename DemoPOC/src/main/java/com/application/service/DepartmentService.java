package com.application.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.dao.DepartmentDAO;
import com.application.model.Department;


@Service
public class DepartmentService
{
	@Autowired
	DepartmentDAO departmentDAO;
	
	public void addDepartment(Department department) {
		System.out.println("hello");
		departmentDAO.addDepartment(department);
		
	}
	
	public List<Department> getAllDepartments() {
		return departmentDAO.getAllDepartments();
	}
	
	public Department getDepartment(int id) {
		return departmentDAO.getDepartment(id);
	}
	
	@Transactional
    public void deleteDepartment(Integer id) {
        departmentDAO.deleteDepartment(id);
    }
    
    public Department updateDepartment(Department department) {
        
        return departmentDAO.updateDepartment(department);
    }
 
    public void setEmployeeDAO(DepartmentDAO departmentDAO) {
        this.departmentDAO = departmentDAO;
    }
}


