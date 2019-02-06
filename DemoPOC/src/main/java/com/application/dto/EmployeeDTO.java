package com.application.dto;


public class EmployeeDTO {

    @Override
	public String toString() {
		return "EmployeeDTO [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", empid=" + empid
				+ ", mail=" + mail + ", designation=" + designation + ", skill=" + skill + ", gender=" + gender
				+ ", salary=" + salary + ", password=" + password + ", department=" + department + "]";
	}

	private int id;
	
	private String firstname;
	
	private String lastname;
	
	private String empid;
	
	private String mail;
	
	private String designation;
	
	private String skill;
	
	private String gender;
	
	private String salary;
	
	private String password;
	
	private String department;


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

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

}