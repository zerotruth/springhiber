package com.application.dao;



import java.util.List;



import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.model.Department;


@Transactional
@Repository

public class DepartmentDAOImpl implements DepartmentDAO{
    
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addDepartment(Department department)
	{
		Session session = sessionFactory.getCurrentSession();
		System.out.println("sdfd");
		session.save(department);
    	System.out.println("sda");
	}
	
	@Override
	public List<Department> getAllDepartments()
	{
		return sessionFactory.getCurrentSession().createQuery("from Department ORDER BY deptname").list();
	}

	@Override
	public Department updateDepartment(Department department)
	{
		sessionFactory.getCurrentSession().update(department);
        return department;
	}

	@Override
	public void deleteDepartment(Integer id)
	{
		Department department = (Department) sessionFactory.getCurrentSession().load(
                Department.class, id);
        if (null != department) {
            this.sessionFactory.getCurrentSession().delete(department);
        }
	}
	


	@Override
	public Department getDepartment(int id)
	{
		return sessionFactory.getCurrentSession().get(Department.class, id);
	}
}
