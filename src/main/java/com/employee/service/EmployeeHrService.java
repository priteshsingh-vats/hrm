package com.employee.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public interface EmployeeHrService {
	
	

	boolean validateUser(String username, String password);

}
