<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
   box-shadow: 5px 5px 5px #888888; 
    font-size: 25px;
   font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    padding: 10px;
    color: #f8f9fa;
     
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
#logout
{
border:none;
background-color:red;
padding:3px;
font-size:12px;
cursor:pointer;
margin-left:20px;
}
</style>

<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma" ,"no-cache");
response.setHeader("Expires","0");

   if(session.getAttribute("username")==null)
   {
	  
	   response.sendRedirect("../login.jsp");
   }
%>
    <header>
        
        Edit Employee Details
       
         <form action="/logout"  method="get">
         <span>
          Welcome ${username} 
               <input type="submit" id="logout" value="Logout">
               </span>
               </form>
        </header>
    <div class="container">
       
    <form action="/update" method="post" id="form">
        <fieldset>
            <legend>Edit Employee Details</legend>
            <table>
                <br>
              
                <tr>
                    <td>Employee Code</td>
                    <td><input type="text" size="23"
                      value="${employee.eid}" name="eid" readonly ></td>
                </tr>
                <tr>
                    <td>Employee Name</td>
                    <td><input type="text" size="23"
                    value="${employee.ename}" name="ename"    ></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>
                        <input type="text" value="${employee.elocation}"
                        name="elocation" size="23"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" size="23"
                    value="${employee.eemail}" name="eemail"></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" style="width:180px;"
                    value="${employee.edob}"  name="edob" ></td>
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
    
<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
th,td,table
{
border:1px solid red;
}
</style>
<body>
<h1>Edit page jsp</h1>
<table>
<tr>
<th>Employee Code </th>
<th>Employee Name </th>
<th>Location </th>
<th>Email </th>
<th>Dob</th>
<th>Action</th>
</tr>
<tr>
  <form action="/update" method="post">
   <td> <input type="text" value="${employee.eid}" name="eid"/></td>
   <td>   <input type="text" value="${employee.ename}" name="ename"/></td>
     <td> <input type="text" value="${employee.elocation}" name="elocation"/></td>
    <td> <input type="text" value="${employee.eemail}" name="eemail"/></td>
    <td> <input type="text" value="${employee.edob}" name="edob"/></td>
    <input type="submit">
    </form>
  </tr>
 </table>

</body>
</html>
-->