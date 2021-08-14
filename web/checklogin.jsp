<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Learn</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style> 
            .navbar {
                margin-bottom: 0;
                background-color: #209238;
                z-index: 9999;
                border: 0;
                font-size: 18px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
            }
            .navbar li a, .navbar .navbar-brand {
                color: #fff !important;
            }
            .navbar-nav li a:hover, .navbar-nav li.active a {
                color: #209238   !important;
                background-color: #fff !important;
            }
            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
            }
            span {
                font-style: normal;
            }
            .jumbotron
            { 
                background-color: #209238 ; 
                color: #ffffff;
                padding-top: 50px;
                font-family: Montserrat, sans-serif;
            }
            .btn:hover {
                border: 1px solid #209238 ;
                background-color: #fff !important;
                color: #f4511e;
            }
            .btn{
                background-color:#209238 ;
                color:white;
            }
        </style></head><body>
        <div class="jumbotron text-center " style="margin-top:-10px;margin-bottom:-10px;"> 
        </div> 
        <div class="container" style="margin-top:-50px;width:100%">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="logout.jsp">Sign Out</a></li>
                    </ul>
                </div>
            </nav>
            <div class="col-md-offset-4 form-inline" style="margin-top: 8%;font-size: 200%">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String a=request.getParameter("uname");
String b=request.getParameter("pwd");
Class.forName("com.mysql.jdbc.Driver");
int count=0;
session.setAttribute("uname",a);
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
try
{

PreparedStatement ps=conn.prepareStatement("select * from StudentDetails where Username='"+a+"' && Pwd1='"+b+"'");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
    
   PreparedStatement pstmt = conn.prepareStatement("insert into log(uname) values(?)");
   pstmt.setString(1, a);
   pstmt.execute();
    
    
    try
    {
    PreparedStatement ps1=conn.prepareStatement("select * from logindetails where username='"+a+"'");
ResultSet rs1=ps1.executeQuery();
rs1.next();
count=rs1.getInt(2);
count=count+1;
//out.println(count);
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    try{
PreparedStatement ps2=conn.prepareStatement("update logindetails set count=count+1 where username='"+a+"'");
int i=ps2.executeUpdate();
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    String uname = (String)session.getAttribute("uname");
    PreparedStatement ps2=conn.prepareStatement("select * from ptest1 where username='"+uname+"'");
    ResultSet rs2=ps2.executeQuery();
    if(!rs2.next())
    {
    out.println("You need to take knowledge test<br><br><a href='ptest.jsp'>Take the test</a>");
    }
    else
    {
        //out.println(count);
        
        
        
        
response.sendRedirect("userhome.jsp");
    }
}
else
  {
      
%> <!--
<script type="text/javascript">
    alert("Incorrect Credentials Try again");
    window.location.replace("Login.html");
</script> --> Incorrect Credentials.... Try again <br><br>
<a href="Login.html" style="margin-left :130px;">Back to Login</a> <br><br>
<a href="index.html" style="margin-left :130px;">Back to Home</a>
<% 
  }
     

}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
            </div>
</body>
</html>