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
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<% String uname=(String)session.getAttribute("uname"); 
if(uname==null)
{
    response.sendRedirect("index.html");
}
%>
<h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
<div class="col-md-offset-3 form-inline" style="margin-top: 10%;font-size: 200%"><% 
Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
try{
    PreparedStatement ps=conn.prepareStatement("select * from score where username='"+uname+"'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
   float sc=rs.getFloat(2);
   String lang=rs.getString(3);
   int x =rs.getInt(4);
out.println("Your score is "+sc); 
out.println("You selected "+lang+" language");
PreparedStatement pis = conn.prepareStatement("select * from btestval where uname= '"+uname+"'");
        ResultSet ris=pis.executeQuery();
        if(!ris.next()){
        
            PreparedStatement pis1 = conn.prepareStatement("insert into btestval(uname) values ('"+uname+"')");
        pis1.executeUpdate();
        }
        PreparedStatement pis2 = conn.prepareStatement("select * from itestval where uname= '"+uname+"'");
        ResultSet ris1=pis2.executeQuery();
        if(!ris1.next()){
        PreparedStatement pis3 = conn.prepareStatement("insert into itestval(uname) values ('"+uname+"')");
        pis3.executeUpdate();
        }
        PreparedStatement pis5 = conn.prepareStatement("select * from atestval where uname= '"+uname+"'");
        ResultSet ris2=pis5.executeQuery();
        if(!ris2.next()){
        PreparedStatement pis4 = conn.prepareStatement("insert into atestval(uname) values ('"+uname+"')");
        pis4.executeUpdate();
        }
if(lang.equalsIgnoreCase("c"))
{
    
    if(x==-1){
if(sc<=35){PreparedStatement ps1 = conn.prepareStatement("insert into cbt(uname)values('"+uname+"')");
    ps1.executeUpdate();
    PreparedStatement ps2 = conn.prepareStatement("insert into cit(uname)values('"+uname+"')");
    ps2.executeUpdate();
    PreparedStatement ps3 = conn.prepareStatement("insert into cat(uname)values('"+uname+"')");
    ps3.executeUpdate();
       out.println("You are a beginner...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");}
else if(sc<=75){
    PreparedStatement ps1 = conn.prepareStatement("insert into cbt(uname)values('"+uname+"')");
    ps1.executeUpdate();
    PreparedStatement ps2 = conn.prepareStatement("insert into cit(uname)values('"+uname+"')");
    ps2.executeUpdate();
    PreparedStatement ps3 = conn.prepareStatement("insert into cat(uname)values('"+uname+"')");
    ps3.executeUpdate();
       out.println("You are in an Intermediate level...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");}
    else{
        PreparedStatement ps1 = conn.prepareStatement("insert into cbt(uname)values('"+uname+"')");
    ps1.executeUpdate();
    PreparedStatement ps2 = conn.prepareStatement("insert into cit(uname)values('"+uname+"')");
    ps2.executeUpdate();
    PreparedStatement ps3 = conn.prepareStatement("insert into cat(uname)values('"+uname+"')");
    ps3.executeUpdate();
    out.println("You are in an Advanced level...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");
    }
}
    else
    {
        %> <script>
       window.location.replace("basiclinks.jsp");</script>
       <%
    }
}
else if(lang.equalsIgnoreCase("Java"))
{PreparedStatement ps1 = conn.prepareStatement("insert into responseofjava(uname)values('"+uname+"')");
ps1.executeUpdate();
    if(x==-1)
{
    if(sc<=35)
       out.println("You are a beginner...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");
else if(sc<=75)
       out.println("You are in an Intermediate level...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");
else
    out.println("You are in an Advanced level...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");
}
else
{
   %> <script>
       window.location.replace("basiclinks.jsp");</script>
       <%
    } 
}
else if(lang.equalsIgnoreCase("Python"))
        {
      PreparedStatement ps1 = conn.prepareStatement("insert into responseofpython(uname)values('"+uname+"')");
      ps1.executeUpdate();
    if(x==-1){
    if(sc<=35)
       out.println("You are a beginner...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");
else if(sc<=75)
       out.println("You are in an Intermediate level...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");
else
    out.println("You are in an Advanced level...<br><br>"
               + "Start learning.....<a href='basiclinks.jsp'>Learn</a>");

    
}
    else
    {
        %> <script>
       window.location.replace("basiclinks.jsp");</script>
       <%
}
}
}
}
catch(Exception e){
    out.print(e.getMessage());
}

    
%>
</div>
        </div>
    </body>
</html>