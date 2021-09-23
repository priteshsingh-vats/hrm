<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Welcome to test Page

<form:form action="helloagain" modelAttribute="emp">  
Username: <form:input path="name"/> <br><br>  
Password(*): <form:password path="pass"/>    
<form:errors path="pass" cssClass="error"/><br><br>  
<input type="submit" value="submit">  
</form:form>
</body>
</html>