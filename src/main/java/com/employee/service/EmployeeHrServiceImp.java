package com.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.model.User;
import com.employee.repository.HrRepository;
@Service
public class EmployeeHrServiceImp implements EmployeeHrService {
@Autowired
  HrRepository hrRepository;
	
	@Override
	public boolean validateUser(String username ,String password) {
		
		List<User> user = hrRepository.selectRecordByName(username, password);
		if(user.size()>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	
}
