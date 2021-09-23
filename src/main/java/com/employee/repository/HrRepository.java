package com.employee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.employee.model.User;

public interface HrRepository extends JpaRepository<User,Integer> {
	
	@Query("from User where uname=:name and upassword=:password")
	List<User> selectRecordByName(@Param("name") String name ,@Param("password") String password);
	
	

}
