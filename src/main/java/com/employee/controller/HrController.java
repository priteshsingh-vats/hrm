package com.employee.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.employee.model.Employee;
import com.employee.service.EmployeeHrService;


@RestController
public class HrController {
	Boolean isloggedin =false;
	@Autowired
	RestTemplate resttemplate;
	@Autowired
	EmployeeHrService employeeHrService;
	
	@GetMapping("/")
	public ModelAndView hrHome(ModelAndView mv,HttpServletRequest request)
	{
		mv.setViewName("login.jsp");
		
		return mv;
	}
	@GetMapping("/test")
	public ModelAndView testHome(ModelAndView mv,HttpServletRequest request)
	{
		mv.setViewName("index.jsp");
		
		return mv;
	}
	@PostMapping("/validate")
	public void validateUser(@Valid ModelAndView mv,HttpServletRequest req,HttpServletResponse res)
	{
		String username = req.getParameter("uname");
		String password  =req.getParameter("password");
		isloggedin = employeeHrService.validateUser(username, password);
		if(isloggedin==true)
		{
			HttpSession session = req.getSession();
			session.setAttribute("username",username);
			try {
				res.sendRedirect("/employees");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			try {
				res.sendRedirect("/");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@GetMapping("/addemployee")
	public ModelAndView addNewEmployee(ModelAndView mv)
	{

		mv.setViewName("newemployee.jsp");
		return mv;

	}
	@GetMapping("/employees")
	public ModelAndView getEmployee(ModelAndView mv)
	{
		String url ="http://localhost:8082/employees";
	     Employee[] employee =resttemplate.getForObject(url, Employee[].class);
	     mv.addObject("employee", employee);

	     mv.setViewName("hrhome.jsp");
	     return mv;

	}
	@GetMapping("/employee/{eid}")
	 public ModelAndView showInd(@PathVariable("eid") int eid , ModelAndView mv)
	 {
		String url = "http://localhost:8082/employee/"+eid;
		Employee employee = resttemplate.getForObject(url, Employee.class);
	     mv.addObject("employee", employee);

	     mv.setViewName("../editpage.jsp");
	     return mv;

	 }
	@PostMapping("/employee")
	public void addEmployee(HttpServletRequest request ,HttpServletResponse res)
	{
		Employee employee = new Employee();
		employee.setEid(Integer.parseInt(request.getParameter("eid")));
		employee.setEname(request.getParameter("ename"));
		employee.setEemail(request.getParameter("eemail"));
		employee.setElocation(request.getParameter("elocation"));
		employee.setEdob(request.getParameter("edob"));
		String url = "http://localhost:8082/employee";
		resttemplate.postForObject(url,employee,Employee.class);
		try {
			res.sendRedirect("/employees");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@PostMapping("/update")
	public void updateTemplate(HttpServletRequest request ,HttpServletResponse res)
	{
		Employee employee = new Employee();
		employee.setEid(Integer.parseInt(request.getParameter("eid")));
		employee.setEname(request.getParameter("ename"));
		employee.setEemail(request.getParameter("eemail"));
		employee.setElocation(request.getParameter("elocation"));
		employee.setEdob(request.getParameter("edob"));
		String url = "http://localhost:8082/employee";
		resttemplate.put(url,employee);
		try {
			res.sendRedirect("/employees");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@GetMapping("/download")
	 public void exportToCSV(HttpServletResponse response) throws IOException {
	        response.setContentType("text/csv");
	        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
	        String currentDateTime = dateFormatter.format(new Date());
	         
	        String headerKey = "Content-Disposition";
	        String headerValue = "attachment; filename=users_" + currentDateTime + ".csv";
	        response.setHeader(headerKey, headerValue);
	        String url ="http://localhost:8082/employees";
		     Employee[] employee =resttemplate.getForObject(url, Employee[].class);
	        
	 
	        ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
	        String[] csvHeader = {"Employee Code", 
	        		"Employee Name", "Location", "Email", "Birth Date"};
	        String[] nameMapping = {"eid", "ename", "elocation", "eemail", "edob"};
	         
	        csvWriter.writeHeader(csvHeader);
	         
	        for (Employee user : employee) {
	            csvWriter.write(user, nameMapping);
	        }
	         
	        csvWriter.close();
	         
	    }
	@GetMapping("/logout")
	public void logOutUser(HttpServletRequest req , HttpServletResponse res)
	{
		HttpSession session = req.getSession();
	   session.removeAttribute("username");
	   session.invalidate();
	   try {
		res.sendRedirect("login.jsp");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}
	

}
