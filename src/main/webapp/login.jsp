
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
.container
{
    margin: 100px auto;
    width: 55%;
    
}
#login
{
    background-color:#000000;
    font-weight: bold;
    padding: 15px;
    color: #e5e5e5;
    font-size: 20px;
}
#newuser
{
border:0.5px solid white}
*
{
    font-family: 'Courier New', Courier, monospace;
    margin: 0px ;
    padding: 0px;
    font-weight: bold;
}
#containerbottom
{
    background-color: #000000;
    padding:7px;
}
#containermid
{
    
    padding-top: 40px;
    padding-bottom: 40px;
    padding-left: 20px;
}
a
{
    font-size: 14px;
}
a{
    padding:5px;
    cursor: pointer;
    background-color: #14213d;
    color: #e5e5e5;
    border: none;
    text-decoration: none;
}
#loginbutton
{
    padding:5px;
    cursor: pointer;
    background-color: #14213d;
    color: #e5e5e5;
    border: none;
    border:0.5px solid white;

}

</style>

<script>

</script>
<body>
    <div class="container">
       <form action="/validate" method="post">
           <p id="login">Login</p>
           <hr>
           <div id="containermid">
           <span>
                Username:
               <input required  required type="text" size="22" name="uname">
           </span>
           <br>
           <br>
        <span>
            Password:
            <input  required type="password"  size="22" name="password" >
        </span>
        <br>
        </div>
        <hr>
           <div id="containerbottom">
           <input  type="submit" id="loginbutton" value="Sign in">
            <a href="${pageContext.request.contextPath}/usernew" id="newuser">New User</a>
            
           </div>
           </form> 
         
    
        </div>
</body>
</html>