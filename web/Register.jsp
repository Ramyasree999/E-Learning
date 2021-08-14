

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="datacon.DbCon"%>

<html>
<head>
        <%        
Class.forName("com.mysql.jdbc.Driver");
int count=0;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");

try
{

String name=request.getParameter("name"); 
String lname=request.getParameter("lname"); 
String uname=request.getParameter("uname");  
String pwd=request.getParameter("pwd");  
String gender =request.getParameter("gender"); 
String DOB = request.getParameter("date");
String email=request.getParameter("email"); 
String mob=request.getParameter("mob"); 
String c=request.getParameter("hq"); 
String loc=request.getParameter("loc"); 
String cont=request.getParameter("con"); 
String zip = request.getParameter("zip");
PreparedStatement ps=conn.prepareStatement("insert into StudentDetails values(?,?,?,?,?,?,?,?,?,?,?,?)");  
  
ps.setString(1,name);  
ps.setString(2,lname);  
ps.setString(3,gender);  
ps.setString(4,DOB); 
ps.setString(5,email);
ps.setString(6,mob);
ps.setString(7,uname);
ps.setString(8,pwd);
ps.setString(9,c);
ps.setString(10,loc);
ps.setString(11,cont);
ps.setString(12,zip);
          
int i=ps.executeUpdate();  

if(i>0) 
{ 
   try{
       PreparedStatement ps1=conn.prepareStatement("insert into logindetails values(?,?)"); 
       ps1.setString(1,uname);  
ps1.setInt(2,0);  
int j=ps1.executeUpdate();
   }
   catch(Exception e){
       out.print(e.getMessage());
   }
out.print("Registration Successful!!!!<br><br><a href='Login.html'>Back to Login</a>");
}
else
    out.print("Registration Failed");
             
             
        }
        catch(Exception e)
        {
            out.print(e.getMessage());
        }
       
        %>
    </head>
<body>
</body>
</html>