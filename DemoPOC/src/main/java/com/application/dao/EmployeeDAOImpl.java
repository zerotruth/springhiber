package com.application.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.application.dto.EmployeeDTO;
import com.application.model.Department;
import com.application.model.Employee;

@Transactional
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void addEmployee(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("sdfd");
		session.save(employee);
    	System.out.println("sda");
	}

	
	

	@Override
	public List<Employee> getAllEmployees() {
		return sessionFactory.getCurrentSession().createQuery("from Employee order by firstname").list();
		
	}
	public Employee getEmployee(int id) {
        return (Employee) sessionFactory.getCurrentSession().get(
                Employee.class, id);
    }
	@Override
	public Employee updateEmployee(Employee employee) {
        sessionFactory.getCurrentSession().update(employee);
        return employee;
    }


	@Override
	public void deleteEmployee(Integer id) {
		 Employee employee = (Employee) sessionFactory.getCurrentSession().load(
	                Employee.class, id);
	        if (null != employee) {
	            this.sessionFactory.getCurrentSession().delete(employee);
	        }
		
	}




	@Override
	public List<Employee> getListDept(){
		
	       return sessionFactory.getCurrentSession().createQuery("select id,deptname from Department").list();
			
		}
	
	@Override
	public List<Object[]> getEmployeeByDepartmentId() {
         Query query = sessionFactory.getCurrentSession().createNativeQuery("select dept_id,count(*) as count,(select department_name from employee_details.department_information where dept_id=e.dept_id) as department_name from employee_details.employee_info e group by dept_id");
      
        List<Object[]> employees = query.getResultList(); 
        Employee employee = null;
		System.out.println("Rsult for queries "+employees);
		for(Object[] object:employees) {
		employee = new Employee();
		Integer deptId = (Integer) object[0];
		String deptName = (String) object[2];
		System.out.println(deptName);
		BigInteger count = (BigInteger) object[1];
		System.out.println(count);
		}
         return employees;
	}
	
	public List<Object[]> getEmployeeSalary(){
		String qry = "select (select department_name from department_information where dept_id=e.dept_id) as department,sum(e.salary) as salary,count(*) as count from employee_info e group by dept_id";
		Query query = sessionFactory.getCurrentSession().createNativeQuery(qry);
		List<Object[]> employees=query.getResultList();

		Employee employee = null;
		System.out.println("Rsult for queries "+employees);
		for(Object[] object:employees) {
		employee = new Employee();
		String deprtmentName = (String) object[0];
		BigDecimal salary = (BigDecimal) object[1];
		System.out.println(salary);
		BigInteger count = (BigInteger) object[2];
		System.out.println(count);
		}
		
		return employees;
	}
	
	public Map<String,Integer> getSkillSet(){
		String qry = "SELECT skill_set,count(*) FROM employee_details.employee_info group by skill_set";
		Query query = sessionFactory.getCurrentSession().createNativeQuery(qry);
		List<Object[]> employees=query.getResultList();
		Map<String,Integer> skillSets = new HashMap<>();
		Employee employee = null;
		System.out.println("Rsult for queries "+employees);
		for(Object[] object:employees) {
		employee = new Employee();
		String skillSet = (String) object[0];
		BigInteger count = (BigInteger) object[1];
		int countInteger = count.intValue();
		String [] skill = skillSet.split(",");
		System.out.println("skills are:"+skill);
		for(String s:skill) {
			if(skillSets.containsKey(s)) {
				int i = skillSets.get(s).intValue();
				i = i+countInteger;
				skillSets.put(s, i);
				System.out.println(skillSets.get(s) +":"+i);
			}else {
				skillSets.put(s, countInteger);
			}
		}
		System.out.println("Skill:" +skillSets);
		System.out.println(count);
		}
	
		return skillSets;
		
	}
	
	public List<Object[]> getStacked(){
		String qry = "select dept_id,skill_set,count(id),(select department_name from employee_details.department_information where dept_id=e.dept_id) as department_name from employee_details.employee_info e group by skill_set,dept_id";
		System.out.println("query executed:"+qry);
		Query query = sessionFactory.getCurrentSession().createNativeQuery(qry);
		List<Object[]> employees=query.getResultList();
		EmployeeDTO employeeDTO = null;
		System.out.println("Rsult for queries "+employees);
		for(Object[] object:employees) {
		employeeDTO = new EmployeeDTO();
		Integer deptId = (Integer) object[0];
		String skillSet = (String) object[1];
		System.out.println("Skill:" +skillSet);
		BigInteger count = (BigInteger) object[2];
		String deptName = (String) object[3];
		System.out.println("Dept:" +deptName);
		System.out.println(count);
		}
	
		return employees;
		
	}
	
	@Override
	public List<Employee> getEmployeeByDepartment(int id)
	{
		String hql = "FROM Employee e WHERE e.department = :departmentId ORDER BY e.department ASC";
	    Query query = sessionFactory.getCurrentSession().createQuery(hql);
	    query.setParameter("departmentId",id);		
	    
	    List<Employee> employeeList = query.getResultList();
	    
	    System.out.println("Employee by department ID" +employeeList);
	    
	    return employeeList;
	}
}
