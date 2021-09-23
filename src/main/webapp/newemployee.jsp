<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="/employee" method="post">
<br>
<br>
Employee Id:
<input type="text" name="eid">
<br>
<br>
Employee Name
<input type="text" name="ename">
<br>
<br>
Employee Location
<input type="text" name="elocation">
<br>
<br>
Employee Dob
<input type="text" name="edob">
<br>
<br>
Employee Email
<input type="text" name="eemail">
<br>
<br>
<input type="submit">

</form>
</body>
</html>
 -->
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee</title>
</head>
<style>
    *
    {
       
       
        padding: 0px;
        margin: 0px;
        
    }
.container
{
    width: 50%;
    margin: 50px auto;
}
td
{
    width: 25%;
    padding-left: 20px;
    
}
tr
{
   margin: 10px;
}
legend
{
    color: #343a40;
    font-weight: bold;
    padding-left: 5px;
    padding-right: 5px;
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
header form
{
float:right;
}
#form
{
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
     box-shadow: 5px 5px 5px #888888; 
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
#span
{
    margin: 20px;
    
}
#submit 
{
    cursor: pointer;
    padding-left:10px;
    padding-right: 10px;
    padding-top: 2px;
    padding-bottom: 2px;    
    background-color: #a2d2ff;
    border: none;
    border-radius: 2px;
}
button
{
    cursor: pointer;
    padding-left:10px;
    padding-right: 10px;
    padding-top: 2px;
    padding-bottom: 2px;    
    background-color: #e56b6f;
    border: none;
    border-radius: 2px;
}
fieldset
{
    padding: 10px;
    
    border: 0;
    border-top:1px solid black;
    border-left:1px solid black;
    border-radius:3px;
}
table
{
    margin-top: 10px;
    margin-bottom: 10px;
}
span
{
font-size:15px;
margin-right:10px;
}
 
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
        
        Add Employee Details
        <form action="/logout" method="get">
        <span>
        Welcome ${username}
               <input type="submit" id="logout" value="Logout">
               </span>
               </form>
        </header>
    <div class="container">
       
    <form action="/employee" method="post" id="form">
        <fieldset>
            <legend>Enter Employee Details</legend>
            <table>
                <br>
              
                <tr>
                    <td>Employee Code</td>
                    <td><input type="text" size="23"
                      name="eid"  ></td>
                </tr>
                <tr>
                    <td>Employee Name</td>
                    <td><input type="text" size="23"
                    name="ename"    ></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>
                        <input type="text" 
                        name="elocation" size="23"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" size="23"
                     name="eemail"></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" style="width:180px;"
                     placeholder="dd-mm-yyyy" name="edob" ></td>
                </tr>

            </table>
            <br>
            <span id="span"> 
                <input id="submit" type="submit" value="Save">
                <button>Cancel</button>
               
                <br>
                </span>
                <br>
               
        </fieldset>
        
    </form>
     
    </div>
    <footer>
    All Rights Reserved
    </footer>
</body>

</html>