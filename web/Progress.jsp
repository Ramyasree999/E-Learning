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
            .cent{text-align:center!important}
            .conta,.panel{width:305px;
  border: 1px solid white;}.panel{margin-top:16px;margin-bottom:16px}
            .bor{border:1px solid #ccc!important}
            .grey,.hover-grey:hover,.gray,.hover-gray:hover{color:#000!important;background-color:#E0E2E0!important}
       .green,.hover-green:hover{color:#fff!important;background-color:#4CAF50!important}
       .indigo,.hover-indigo:hover{color:#fff!important;background-color:#3f51b5!important}
       .blue,.hover-blue:hover{color:#fff!important;background-color:#2196F3!important}
       .red,.hover-red:hover{color:#fff!important;background-color:#f44336!important}
       .yellow,.hover-yellow:hover{color:#000!important;background-color:#ffeb3b!important}
       .round{border-radius:4px}
       .lightgrey,hover-light-gray:hover{color:#000!important;background-color:#E0E2E0!important}
       .barcontainer {
  position: relative;
  border: 3px solid black;
  border-radius: 5px 5px 0 0;
  width: 50%;
  margin: 0 auto;
  min-height: 20vw;
  max-height: 60vw;
  min-width: 20%;
  max-width: 50%;
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
  width: 12%;
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
  left: 20%;
}

.bar:nth-child(4) {
  left: 35%;
}

.bar:nth-child(5) {
  left: 50%;
}

.bar:nth-child(6) {
  left: 65%;
}
.bar:nth-child(7) {
  left: 80%;
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
                        <li><a href="Progress.jsp">Progress</a>
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

int c = 0;
int p1=0,p2=0, p3=0,n1=0,n2=0,n3=0;
int mark =0;%>
 <h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
<div class="col-md-offset-4 form-inline" style="margin-top:7px;font-size: 120%">
    <% 

 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
try{
    
    PreparedStatement ps=conn.prepareStatement("select * from score where username='"+uname+"'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
   float sc=rs.getFloat(2);
   String lang=rs.getString(3);
   int x =rs.getInt(4);
   lang = lang.toUpperCase();

  %> <h1 style="margin-left :125px;margin-top: 8%"> <% out.println(lang+" language"); %> </h1> <%     
if(lang.equalsIgnoreCase("c"))
{
    
    if(sc<=35){
        PreparedStatement pep = conn.prepareStatement("select * from btestval where uname = '"+uname+"'");
    ResultSet r=pep.executeQuery();
    %> 
    <table border="3" title="Basic"  style="margin-left:-15%"> <col width="200"><col width="200"><col width="200">
      
      <%  
    while(r.next()){
        int[] a = new int[6];
        for(int i=0;i<a.length;i++){
            a[i]=r.getInt(i+2);
        }
      for(int i=0;i<a.length;i++){
          if(i==0 && a[i]!=-1){
              out.println("<br> <h3 style='margin-left :130px;'> Basic </h3>"); %> <tr align="center"><h4><td><b>Test Name</b></td><td><b>Final Marks </td></b> <td><b>View all attempts</b></td></h4></tr> 
          <%
      }     
          if(a[i]!=-1){%><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+1)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+1)%>">Attempts</a></td></tr><%
             if(a[i]>2)
                 p1=p1+1;
          }
             if(a[i]==-1 && i==0){
             c = i;
                 break; 
          }
             if(a[i] == -1&& i!=0){
                 c = i;
                //out.println(uname);
                 mark = a[i-1];
                 break;
          }
      } n1 = p1*17;
      if(p1==6)
          n1=100;
      if(p1==3)
          n1=50;
    %> </table> <br><br>  <div class="conta cent grey" style='margin-left :550px;margin-top: -100px'>
<div class="bor">
  <div class="green" style="height:26px;width:<%=  p1*50 %>px"><%= n1 %>%</div>
</div>

</div> <br><br>

<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div> 
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br>
        <table border="3" style="margin-left:-15%"><col width="200"><col width="200"><col width="200"><%
    if(c==0 && a[0]!=-1){
        out.println("<br> Well!! You've taken all the tests in the Basic level");
        %>
    
        <%
        PreparedStatement pp = conn.prepareStatement("select * from itestval where uname='"+uname+"'");
        ResultSet rr = pp.executeQuery();
        while(rr.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr.getInt(i+2);
        }
      for(int i=0;i<a.length;i++){
          if(i==0 && a[i]!=-1){
              out.println("<br> <h3 style='margin-left :130px;'>Intermediate</h3>");   %> <tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b><td><b>View all attempts</b></td></h4></tr>
          <%
      }
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+7)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+7) %>">Attempts</a></td></tr><%
             if(a[i]>2)
                 p2=p2+1;
             //out.println(i);
          }
             if(a[i]==-1 && i==0){
             c = i;
                 break; 
          }
             if(a[i] == -1&& i!=0){
                 c = i;
                //out.println(uname);
                 mark = a[i-1];
                 break;
          }
      } n2 = p2*17;
      if(p2==6)
          n2=100;
      if(p2==3)
          n2=50;
        } %> </table> <br><br>  <div class="conta cent grey" style='margin-left :550px;margin-top: -100px'>
<div class="bor">
  <div class="red" style="height:26px;width:<%=  p2*50 %>px"><%= n2 %>%</div>
</div>

</div> <br><br>
<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br><table border="3" style="margin-left:-15%"><col width="200"><col width="200"><col width="200">  <%
        if(c==0 && a[0]!=-1){
            out.println("<br> Well!! You've taken all the tests in the Intermediate level");
           
        PreparedStatement pp1 = conn.prepareStatement("select * from atestval where uname='"+uname+"'");
        ResultSet rr1 = pp1.executeQuery();
        while(rr1.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr1.getInt(i+2);
        }
      for(int i=0;i<a.length;i++){
          if(i==0 && a[i]!=-1){
         out.println("<br> <h3 style='margin-left :130px;'>Advanced</h3>"); %>  <tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b> <td><b>View all attempts</b></td></h4></tr> 
          <%
      }
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+13)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+13)%>">Attempts</a></td></tr><%
             if(a[i]>2)
                 p3=p3+1;
          }
             if(a[i]==-1 && i==0){
             c = i;
                 break; 
          }
             if(a[i] == -1&& i!=0){
                 c = i;
                //out.println(uname);
                 mark = a[i-1];
                 break;
          }
      }n3 = p3*17;
      if(p3==6)
          n3=100;
      if(p3==3)
          n3=50; %> </table>  <br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="indigo" style="height:26px;width:<%=  p3*50 %>px"><%= n3 %>%</div>
</div>

</div> <br><br>
<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br><%
      if(c==0 && a[0]!=-1)
      {
          out.println("Great!! Taken all the tests");
      }
      
      else if(c>0)
          {
        out.println("<br>You have completed "+(c)+" test(s) in advanced level<br>");
        if(mark<=2){
            out.println("<br>Your score in previous test was "+mark);
            out.println("<br>You cannot view next content unless you score good");
        }
    }
    }
        }
        else if(c>0)
            {
        out.println("<br>You have completed "+(c)+" test(s) in Intermediate level");
        if(mark<=2){
            out.println("<br>Your score in previous test was "+mark);
            out.println("<br>You cannot view next content unless you score good");
        }
    }
            
    }
    else if(c==0&&a[0]==-1){
        out.println("You have not taken any test in basic level");
    }
    else if(c>0){
        out.println("<br>You have completed "+(c)+" test(s) in basic level");
        if(mark<=2){
            out.println("<br>Your score in previous test was "+mark);
            out.println("<br>You cannot view next content unless you score good");
        }
    } 
    }
    }
    if(sc<=75&&sc>35){
        
        PreparedStatement pep = conn.prepareStatement("select * from itestval where uname = '"+uname+"'");
    ResultSet r=pep.executeQuery();
    %> 
    <table border="3" style="margin-left:-15%"> <col width="200"><col width="200"><col width="200">
       <%
    while(r.next()){
        int[] a = new int[6];
        for(int i=0;i<a.length;i++){
            a[i]=r.getInt(i+2);
        }
      for(int i=0;i<a.length;i++){
          if(i==0 && a[i]!=-1){
       out.println("<br> <h3 style='margin-left :130px;'>Intermediate</h3>");   %> <tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b> <td><b>View all attempts</b></td> </h4></tr> 
          <%
      }
        
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+7)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+7)%>">Attempts</a></td></tr><%
             if(a[i]>2)
                 p1=p1+1;
 
          }
          if(a[i]==-1 && i==0){
             c = i;
                 break; 
          }
             if(a[i] == -1&& i!=0){
                 c = i;
                //out.println(uname);
                 mark = a[i-1];
                 break;
          }
      }n1 = p1*17;
      if(p1==6)
          n1=100;
      if(p1==3)
          n1=50;
    
    %></table> <br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="red" style="height:26px;width:<%=  p1*50 %>px"><%= n1 %>%</div>
</div>

</div>
<br><br> 
<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br>
        <table border="3" style="margin-left:-15%"><col width="200"><col width="200"><col width="200"><%
    if(c==0 && a[0]!=-1){
        
        out.println("<br> Well!! You've taken all the tests in the Intermediate level <br>");
        %> 
        <%
        PreparedStatement pp = conn.prepareStatement("select * from atestval where uname='"+uname+"'");
        ResultSet rr = pp.executeQuery();
        while(rr.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr.getInt(i+2);
        }
      for(int i=0;i<a.length;i++){
          if(i==0 && a[i]!=-1){
        out.println("<br> <h3 style='margin-left :130px;'> Advanced </h3>");  %> <tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b> <td><b>View all attempts</b></td></h4></tr> 
          <%
      }
          if(a[i]!=-1){%><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+13)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+13)%>">Attempts</a></td></tr><%
             if(a[i]>2)
                 p2=p2+1;
             //out.println(i);
          }
             else if(a[i]==-1){
                 c = i;
                 mark = a[i-1];
                 break;
          }
  %></table><%    } n2 = p2*17;
      if(p2==6)
          n2=100;
      if(p2==3)
          n2=50; %><br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="indigo" style="height:26px;width:<%=  p2*50 %>px"><%= n2 %>%</div>
</div>

</div> <br><br>
 <div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br><%
      if(c==0 && a[0]!=-1){
          out.println("Great");
      }
      else if(c>0)
      {
          out.println("<br>You have completed "+(c)+" test(s) in Advanced level <br>");
        if(mark<=2){
            out.println("Your score in previous test was "+mark);
            out.println("<br>You cannot view next content unless you score good");
        }
      }  }
    }
      if(c==0 && a[0]==-1){
          out.println("You have not taken any test in Intermediate level");
      }
      else if(c>0)
      {
          out.println("<br>You have completed "+(c)+" test(s) in Intermediate level <br>");
        if(mark<=2){
            out.println("Your score in previous test was "+mark);
            out.println("<br>You cannot view next content unless you score good");
        }
      }  
    %> <%
          PreparedStatement pp1 = conn.prepareStatement("select * from btestval where uname='"+uname+"'");
        ResultSet rr1 = pp1.executeQuery();
        while(rr1.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr1.getInt(i+2);
        } int l=0; %>  <%
      for(int i=0;i<a.length;i++){
          if(l==0 && a[i]!=-1){
        out.println("<br> <h3 style='margin-left :130px;'> Basic </h3>"); l=l+1; %> <table border="3" style="margin-left:-15%"> <col width="200"><col width="200"><col width="200"><tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b> <td><b>View all attempts</b></td></h4></tr> 
          <%
      }
        
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+1)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+1)%>">Attempts</a></td></tr><%
             p3=p3+1;
             //out.println(i);
          }
      }  n3 = p3*17;
      if(p3==6)
          n3=100;
      if(p3==3)
          n3=50; %></table> <br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="green" style="height:26px;width:<%=  p3*50 %>px"><%= n3 %>%</div>
</div>

</div> <br><br>
<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div><br><br><%
    } 
    }
            
     
    }
    if(sc>75){
     %> <table border="3" style="margin-left:-15%"><col width="200"><col width="200"><col width="200"><%
        int[] a = new int[6];
        %>
        <%
        PreparedStatement pp = conn.prepareStatement("select * from atestval where uname='"+uname+"'");
        ResultSet rr = pp.executeQuery();
        //out.println(uname);
        while(rr.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr.getInt(i+2);
        }
      for(int i=0;i<a.length;i++){
                           //out.println(uname);

          if(i==0 && a[i]!=-1){
              out.println("<br> <h3 style='margin-left :130px;'> Advanced </h3>");  %><tr align="center"> <h4><td><b>Test No</b></td> <td> <b>Marks </td></b><td><b>View all attempts</b></td> </h4></tr>  
          <%
      }
        
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+13)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+13)%>">Attempts</a></td></tr><%
             if(a[i]>2)
                 p1=p1+1;
 
          }
          if(a[i]==-1 && i==0){
             c = i;
                 break; 
          }
             if(a[i] == -1&& i!=0){
                 c = i;
                //out.println(uname);
                 mark = a[i-1];
                 break;
          }
    } %></table><% 
      n1 = p1*17;
      if(p1==6)
          n1=100;
      if(p1==3)
          n1=50; %><br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="indigo" style="height:26px;width:<%=  p1*50 %>px"><%= n1 %>%</div>
</div>

</div> <br><br>
<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br><% 
      if(c==0 && a[0]!=-1){
          out.println("Great");
      }
      else if(c==0 && a[0]==-1){
          out.println("You have not taken any test in advanced level");
      }
      else if(c!=0)
      {
          out.println("<br>You have completed "+(c)+" test(s) in Advanced level <br>");
        if(mark<=2){
            out.println("Your score in previous test was "+mark);
            out.println("<br>You cannot view next content unless you score good");
        }
      }  
    }
       // out.println(uname);
          PreparedStatement pp1 = conn.prepareStatement("select * from btestval where uname='"+uname+"'");
        ResultSet rr1 = pp1.executeQuery();
        while(rr1.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr1.getInt(i+2);
        }
        int l1=0;
      for(int i=0;i<a.length;i++){
          if(l1==0 && a[i]!=-1){
        out.println("<br> <h3 style='margin-left :130px;'> Basic </h3>"); l1=l1+1; %> <table border="3" style="margin-left:-15%"><col width="200"><col width="200"><col width="200"><tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b> <td><b>View all attempts</b></td></h4></tr> 
          <%
      }
        
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+1)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
             %><td><a href="attemptview.jsp?<%=(i+1)%>">Attempts</a></td></tr><%
             p2=p2+1;
             //out.println(i);
          }
      } %></table><% n2 = p2*17;
      if(p2==6)
          n2=100;
      if(p2==3)
          n2=50; %><br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="green" style="height:26px;width:<%=  p2*50 %>px"><%= n2 %>%</div>
</div>

</div> <br><br><div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br><%
    }
          PreparedStatement pp2 = conn.prepareStatement("select * from itestval where uname='"+uname+"'");
        ResultSet rr2 = pp2.executeQuery();
        while(rr2.next()){
        for(int i=0;i<a.length;i++){
            a[i]=rr2.getInt(i+2);
        }
         int l2=0;
      for(int i=0;i<a.length;i++){
          if(l2==0 && a[i]!=-1){
        out.println("<br> <h3 style='margin-left :130px;'> Intermediate </h3>");  l2=l2+1;%> <table border="3" style="margin-left:-15%"><col width="200"><col width="200"><col width="200"><tr align="center"><h4><td><b>Test No</b></td> <td> <b>Marks </td></b> <td><b>View all attempts</b></td></h4></tr> 
          <%
      }
        
          if(a[i]!=-1){ %><tr align="center"><%
              PreparedStatement p1s = conn.prepareStatement("select * from testnames where id='"+(i+7)+"'");
              ResultSet r1s = p1s.executeQuery();
              r1s.next();
             %> <td><%=r1s.getString(2) %></td> <%
             out.println("<td>"+a[i]+"</td>");
 %><td><a href="attemptview.jsp?<%=(i+7)%>">Attempts</a></td></tr><%              p3=p3+1;
             //out.println(i);
          }
      } %></table><% n3 = p3*17;
      if(p3==6)
          n3=100;
      if(p3==3)
          n3=50; %><br><br>  <div class="conta cent grey" style='margin-left :480px;margin-top: -100px'>
<div class="bor">
  <div class="red" style="height:26px;width:<%=  p2*50 %>px"><%= n2 %>%</div>
</div>

</div> <br><br>
<div class='barcontainer' style="margin-left:-10%">
  <div class='barcontainerheader'>
    Bar Graph
  </div>
    <% for(int i=0;i<a.length;i++){%>
  <div class='bar' style='height:<%=a[i]*17%>%'>
    <%= a[i]*20%>%
    <div class='barlabel'>
      test <%=i+1 %>
    </div>
  </div>
    <%
    }%>
  
    
</div> <br><br><%
    } 
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