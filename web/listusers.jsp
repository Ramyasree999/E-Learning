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
            .barcontainer {
  position: relative;
  border: 3px solid black;
  border-radius: 5px 5px 0 0;
  width: 35%;
  margin: 0 auto;
  min-height: 20vw;
  max-height: 60vw;
  min-width: 20%;
  max-width: 25%;
  z-index: 1;
}

.barcontainerheader {
  display: inline;
  position: absolute;
  width: 100%;
  padding-top: 3px;
  padding-bottom: 3px;
  background: #663399;
  border-bottom: 3px solid black;
  font-size: 1.5em;
  color: white;
  text-align: center;
  text-shadow: 2px 2px 0 black;
  z-index: 0;
}

.bar {
  position: absolute;
  display: inline-block;
  bottom: 0;
  border: 1px solid black;
  border-radius: 6px 6px 0 0;
  background: #663399;
  width: 25%;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 0 black;
  box-shadow: 4px 0 8px #888;
}

.barlabel {
  position: absolute;
  border-top: 2px solid black;
  background: #888;
  bottom: 0;
  width: 100%;
  text-shadow: 1px 1px 0px black;
  color: white;
}

.bar:nth-child(2) {
  left: 5%;
}

.bar:nth-child(3) {
  left: 38%;
}

.bar:nth-child(4) {
  left: 70%;
}


        </style></head><body>
        <div class="jumbotron text-center " style="margin-top:-10px;margin-bottom:-10px;"> 
        </div> 
        <div class="container" style="margin-top:-50px;width:100%">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="adminhome.jsp">Home</a></li>
                        <li><a href="adminlogout.jsp">Sign Out</a></li>
                    </ul>
                </div>
            </nav>
            <div class="col-md-offset-0 form-inline" style="font-size: 120%"><div>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3 align="center"><u>View/Delete Users</u></h3><br>
     <table align="center" border="2" width="1300">
         <tr align="center">
             <td><h5><b>FULL NAME</b></h5></td>
             <td><h5><b>GENDER</b></h5></td>
             <td><h5><b>USER NAME</b></h5></td>
             <td><h5><b>SCORE</b></h5></td>
              <td><h5><b>Delete User</b></h5></td>
               <td><h5><b>View Progress</b></h5></td>
         </tr>
<%
Connection con = null; 
Class.forName("com.mysql.jdbc.Driver");  
con = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning","root","root");
System.out.println("Connection Estalished");
ResultSet rs = con.createStatement().executeQuery("select StudentDetails.FirstName,StudentDetails.Gender,StudentDetails.Username,score.score,score.lang from StudentDetails inner join score on StudentDetails.Username =score.username ");
while(rs.next())  
{
 %>
 <tr align="center">
     <td><%=rs.getString(1).toUpperCase()%></td>
     <td><%=rs.getString(2).toUpperCase()%></td> 
     <td><%=rs.getString(3).toUpperCase()%></td> 
     <td><%=rs.getString(4).toUpperCase()%></td> 
     <td><a href="deleteusers.jsp?<%=rs.getString(3)%>">Delete</a></td>
     <td><a href="viewprogress.jsp?<%=rs.getString(3)%>">View Progress</td>
 </tr>
 <%
}


%>    
     
     
     </table>
                </div>
<%
PreparedStatement pps = con.prepareStatement("select count(distinct uname) from responseofc where tno<7");
ResultSet rrs = pps.executeQuery();
rrs.next();
int one=rrs.getInt(1);
PreparedStatement pps1 = con.prepareStatement("select count(distinct uname) from responseofc where tno>=7 and tno<=12");
ResultSet rrs1 = pps1.executeQuery();
rrs1.next();
int two=rrs1.getInt(1);
PreparedStatement pps2 = con.prepareStatement("select count(distinct uname) from responseofc where tno>=13");
ResultSet rrs2 = pps2.executeQuery();
rrs2.next();
int third =rrs2.getInt(1);%>
<br><br>
<div class='barcontainer'>
  <div class='barcontainerheader'>
    Bar Graph
  </div>
  <div class='bar' style='height:<%=((one*4))%>%'>
    <%=one%>
    <div class='barlabel'>
      Basic
    </div>
  </div>
  <div class='bar' style='height: <%=((two*4))%>%'>
    <%=two%>
    <div class='barlabel'>
      Intermediate
    </div>
  </div>
  <div class='bar' style='height: <%=((third*4))%>%'>
    <%=third%>
    <div class='barlabel'>
      Advanced
    </div>
  </div></div>
<br><br>
</body>
</html>

