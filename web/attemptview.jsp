 
<%@page import="java.sql.*" %>
<%
String u = request.getQueryString();
%>
<%
                    
                    String uname = (String)session.getAttribute("uname");
if(uname==null)
{
    response.sendRedirect("index.html");
}
                %>
                
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
            .clr{
               color: #f4511e;
            }
        </style>
    </head>
    <body>
        <div class="jumbotron text-center " style="margin-top:-10px;margin-bottom:-10px;"> 
            <h2 style="padding-bottom:10px;"></h2>  
        </div> 
        <div class="container" style="margin-top:-50px;width:100%">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="userhome.jsp">Home</a></li>
                        <li><a href="basiclinks.jsp">Learn</a></li>
                        <li><a href="Progress.jsp">Progress</a></li>
                        <li><a href="logout.jsp">Sign Out</a></li>
                    </ul>
                </div>
            </nav>
            
    </div>
        <%
                Connection conn = null; 
  Class.forName("com.mysql.jdbc.Driver");  
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning","root","root");
  System.out.println("Connection Estalished"); 
PreparedStatement ps = conn.prepareStatement("select * from testscore where uname='"+uname+"' and tno='"+u+"'");
        ResultSet rs = ps.executeQuery();
        PreparedStatement ps1 = conn.prepareStatement("select * from testnames where id='"+u+"'");
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();%> <h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
        <div class="col-md-offset-5 form-inline clr" style="margin-top: 10%;font-size: 200%"> <%=rs1.getString(2) %><br><br> <table border="2" style="margin-left: -75px;"><col width="200"><col width="200">
                <tr> <td align="center"><b>Attempt No</b></td><td align="center"><b>Marks</b></td></tr><%
        while(rs.next()){%> 
        <tr align="center">
     <td><%=rs.getInt(3)%></td>
     <td><%=rs.getInt(4)%></td> </tr> 
       <% } %> </table> </div>
       
    </body>
</html>