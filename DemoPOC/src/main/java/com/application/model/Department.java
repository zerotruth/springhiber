package com.application.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.Column;

@Entity 
@Table(name="department_information")
public class Department {
   
	@Id
	@Column(name="dept_id")
	@GeneratedValue
	private int id;
	
	@Column(name="department_name")
	private String deptname;
	
	@Column(name="description")
	private String description;
	
	@Column(name="status")
	private String status;
	
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getDeptname()
	{
		return deptname;
	}

	public void setDeptname(String deptname)
	{
		this.deptname = deptname;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

	@Override
	public String toString()
	{
		return "Department [id=" + id + ", deptname=" + deptname + ", description=" + description + ", status=" + status + "]";
	}

}
