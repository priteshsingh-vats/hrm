package com.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity
public class User {
	@Id
	int uid;
	@Size(min = 5, max = 50)
	
	String uname;
	String upassword;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public User(int uid, String uname, String upassword) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upassword = upassword;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
