<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
  *
    {

        padding: 0px;
        margin: 0px;
        
        
    }
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dee2e6;
}
.container
{
width :80%;
margin: 50px auto;
 height: 400px;
  box-shadow: 5px 10px 8px #888888;
  overflow: scroll;
}
header
{
   dispaly : flex;
   justify-content:space-around;
    background-color: #212529;
   
    font-size: 25px;
   font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    padding: 10px;
    color: #f8f9fa;
     box-shadow: 5px 5px 5px #888888;
}
header form
{
float:right;
}
form
{
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; 
}
footer
{
    text-align: center;
    position:absolute;
   bottom:0;
   width:100%;
   background-color: #212529;
    font-size: 15px;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; 
    padding-top: 5px;
    padding-bottom:5px;
    color: #f8f9fa;
   

}
#edit
{
width:80%;
border:none;
margin:0px auto;
background-color:#98c1d9;
cursor:pointer;
padding:3px;
border-radius:3px;
color:black;
}
#add
{
background-color:#1982c4;
cursor:pointer;
padding:3px;
border-radius:3px;
border:none;
color:black;

}
#download
{
background-color:#8ac926;
cursor:pointer;
padding:3px;
border-radius:3px;
border:none;
color:black;
}
#logout
{
border:none;
background-color:red;
padding:3px;
font-size:12px;
cursor:pointer;
margin-left:20px;
cursor:pointer
}
span
{
font-size:15px;
margin-right:10px;
}
#span
{
overflow: hidden;
  
  position: fixed; /* Set the navbar to fixed position */
 
  width: 100%; /* Full width */}
</style>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma" ,"no-cache");
response.setHeader("Expires","0");
   if(session.getAttribute("username")==null)
   {
	  
	   response.sendRedirect("login.jsp");
   }
%>
<header>

        
        All Employee Details
      
        <form action="/logout" method="get">
        <span>
     welcome ${username}
      </span>
               <input id="logout" type="submit" value="Logout">
              
               </form>
        
        </header>
<div class="container">
<span id="span">
<a href="${request.getContextPath()}/addemployee"><button id="add">Add Employee</button></a>
<a href="${request.getContextPath()}/download"><button id="download">Download Data</button></a>

</span>
<br>
<br>

<table>
<tr>
<th>Employee Code </th>
<th>Employee Name </th>
<th>Location </th>
<th>Dob</th>
<th>Email </th>
<th>Action</th>
</tr>
<c:forEach var="par" items="${employee}">
<tr>
    <td>${par.eid}</td>
    <td>${par.ename}</td>
    <td>${par.elocation}</td>
     <td>${par.edob}</td>
    <td>${par.eemail}</td>
    <td><a href="${request.getContextPath()}/employee/${par.eid}"><button id="edit">Edit</button></a></td>
     
  </tr>
        </c:forEach>
 </table>
</div>
 <footer>
    All Rights Reserved
    </footer>
</body>
</html>