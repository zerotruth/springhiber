package com.application.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name="employee_info")
public class Employee {
	@Id
	@Column(name="id")
	@GeneratedValue
	private int id;
	
	@Column(name="first_name")
	private String firstname;
	
	@Column(name="last_name")
	private String lastname;
	
	@Column(name="emp_id")
	private String empid;
	
	@Column(name="email_id")
	private String mail;
	
	@Column(name="designation")
	private String designation;
	
	@Column(name="skill_set")
	private String skill;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="salary")
	private String salary;
	
	@Column(name="password")
	private String password;
	
	@Column(name="dept_id")
	private int department;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDepartment()
	{
		return department;
	}

	public void setDepartment(int department)
	{
		this.department = department;
	}
	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", empid=" + empid
				+ ", mail=" + mail + ", designation=" + designation + ", skill=" + skill + ", gender=" + gender
				+ ", salary=" + salary + ", password=" + password + ", department=" + department + "]";
	}
}
