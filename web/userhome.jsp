<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
                    
                   String uname = (String)session.getAttribute("uname");
if(uname==null)
{
    response.sendRedirect("index.html");
}
                %>
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
        </style>
    </head>
    <body>
        <div class="jumbotron text-center " style="margin-top:-10px;margin-bottom:-10px;">
            <h2 style="padding-bottom:20px;">Learn As You Like</h2>   
        </div> 
        <div class="container" style="margin-top:-50px;width:100%">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="learn.jsp">Learn</a></li>
                        <li><a href="Progress.jsp">Progress</a>
                        <li><a href="logout.jsp">Sign Out</a></li>
                    </ul>
                </div>
            </nav>
            <h4 style="margin-top: -5%;color: white">Welcome&nbsp;&nbsp;<% out.println(uname); %>&nbsp;!!</h4>
            
            <div class="col-md-offset-5 form-inline" style="margin-top: 10%">
<%
try
{
    Connection con = null;
    
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
ResultSet rs = con.createStatement().executeQuery(" select logtime from log where uname='"+uname+"' order by logtime desc ");
rs.next();
if(rs.next())
{
        Date date = rs.getTimestamp(1);
        
        String dateString = new SimpleDateFormat("dd-MM-YYYY HH:mm:ss aa").format(date);
%>
<h3 align="right">Last Visited Time : <%=dateString%></h3>
<%

}

}   
catch(Exception e)
{
    out.println("Exception:"+e.getMessage());
}
%>    
            </div>
        </div>
    </body>
</html>
