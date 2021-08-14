
<%@page import="java.sql.*"%>
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
    <% String v = (String)request.getParameter("ve");
    float score=0;
    int k;%>
    <body>
        <div class="jumbotron text-center " style="margin-top:-10px;margin-bottom:-10px;">
        </div> 
        <div class="container" style="margin-top:-50px;width:100%">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="userhome.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="logout.jsp">Sign Out</a></li>
                    </ul>
                </div>
            </nav>
            
      <% String url=request.getParameter("c"); %>
      <% String d = request.getParameter("d"); %>
      <% String dd; int id; int val=0;
      session.setAttribute("dd", d); 
      String s = (String) session.getAttribute("dd");
      int dig = Integer.parseInt(s);int x1=0;
      String uname = (String)session.getAttribute("uname");
      if(uname==null)
{
    response.sendRedirect("index.html");
}

       %><h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4><% 
   Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
    PreparedStatement ps3 = conn.prepareStatement("select * from score where username= '"+uname+"'");
    ResultSet rs2 = ps3.executeQuery();
    if(rs2.next())
       {score = rs2.getFloat(2);
      //  out.println(score);
    x1 = rs2.getInt(4);
    id=rs2.getInt(5);
        PreparedStatement ps5 = conn.prepareStatement("update score set visit=visit+1 where id = '"+id+"'");
        ps5.executeUpdate();}
    PreparedStatement ps1 = conn.prepareStatement("select * from atestval where uname= '"+uname+"'");
        ResultSet rs1= ps1.executeQuery();
        if(!rs1.next()){
        PreparedStatement ps2 = conn.prepareStatement("insert into atestval(uname) values ('"+uname+"')");
        ps2.executeUpdate();
        }
       // out.println(uname);
        if(score<=75){
            //out.println(score);
            //out.println(uname);
            PreparedStatement ps5 = conn.prepareStatement("select * from itestval where uname='"+uname+"'");
            ResultSet rs5=ps5.executeQuery();
            rs5.next();
           int z= rs5.getInt(7);
          // out.println(z);
            if(z==1||z==2){ val=1;
                %>
             <!--   <script type="text/javascript">
    alert("U score in prev test is low please read again take test");
    window.location.replace("basiclinks.jsp");
</script> -->
             <div class="col-md-offset-4 form-inline" style="margin-top: 10%;font-size: 200%"> Your score in the previous test is Low. You cannot view this content <br><br>
            <a href="basiclinks.jsp" style="margin-left :130px;">Learn</a> <br><br>
            <a href="userhome.jsp" style="margin-left :130px;">Back to Home</a> </div>
                <%
            }
            else if(z==-1){ val=1;
                %>
               <!-- <script type="text/javascript">
    alert("U dint take prev test in intermediate");
    window.location.replace("basiclinks.jsp");</script> -->
               <div class="col-md-offset-4 form-inline" style="margin-top: 10%;font-size: 200%">  You have not taken the previous test in Intermediate <br><br>
            <a href="basiclinks.jsp" style="margin-left :130px;">Learn</a> <br><br>
            <a href="userhome.jsp" style="margin-left :130px;">Back to Home</a> </div>
                <%
            }
        }
    if(dig>=14&&dig<=18){
        
        PreparedStatement ps = conn.prepareStatement("select * from atestval where uname ='"+uname+"' ");
        ResultSet rs = ps.executeQuery();
        rs.next();
        for(k=2;k<=6;k=k+1){
            if(dig-12 ==k){
           int x =rs.getInt(k);
         if(x!=3&&x!=4&&x!=5)
         {  if(val==0){
             if(x==-1){ val=1;
            %>
            <!--
<script type="text/javascript">
    alert("U dint take prev test");
    window.location.replace("basiclinks.jsp");
</script> --> <div class="col-md-offset-4 form-inline" style="margin-top: 8%;font-size: 200%">You have not taken the previous test in this level <br><br>
            <a href="basiclinks.jsp" style="margin-left :130px;">Learn</a> <br><br>
            <a href="userhome.jsp" style="margin-left :130px;">Back to Home</a> </div>
<%     
        }
             else
             { val=1;
                 %> <!--
<script type="text/javascript">
    alert("U score in prev test is low please read again take test");
    window.location.replace("basiclinks.jsp");
</script> -->
                 <div class="col-md-offset-4 form-inline" style="margin-top: 10%;font-size: 200%"> Your score in the previous test is Low. You cannot view this content <br><br>
            <a href="basiclinks.jsp" style="margin-left :130px;">Learn</a> <br><br>
            <a href="userhome.jsp" style="margin-left :130px;">Back to Home</a> </div>
<%     
             }
        }
         }
            }
    }
    }
      if(val==0){      
    %>
    <br>
    <br>
    <iframe style="margin-left :300px;" align="center" width="900" height="500" src="<% out.println(url); %>" frameborder="0" allowfullscreen></iframe><br><br>
    <form action="test.jsp">
   <button type="submit" class="btn" style="padding: 15px 25px; margin-left: 50%" >Attempt test</button>
   <br><br><br>
</form>   <% 
  
  } %>
   </body>
</html> 