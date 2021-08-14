<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<% String uname=(String)session.getAttribute("uname");
int temp=-1;
out.println(uname);
if(uname==null)
{
    response.sendRedirect("index.html");
}
 %>
<% String dig = (String)session.getAttribute("dd");%> 
<% int d = Integer.parseInt(dig); int bef=-1;
 int count=0; int[] a = new int[5];
out.println(d);
int att=0;%> 
    <head>
        <% 
out.println(d);
   Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
   try{
       String q1=request.getParameter("q1");
    int qv1 = Integer.parseInt(q1);
    String q2=request.getParameter("q2");
    int qv2 = Integer.parseInt(q2);
    String q3=request.getParameter("q3");
    int qv3 = Integer.parseInt(q3);
    String q4=request.getParameter("q4");
    int qv4 = Integer.parseInt(q4);
    String q5=request.getParameter("q5");
    int qv5 = Integer.parseInt(q5);
    PreparedStatement ps2=conn.prepareStatement("select * from btestval where uname='"+uname+"'");
    ResultSet rs1=ps2.executeQuery();
    rs1.next();
    int id = rs1.getInt(7);
    //PreparedStatement ps5=conn.prepareStatement("update logindetails set count=count+1 where username='"+a+"' ");
    //ps5.executeUpdate();
    PreparedStatement ps= conn.prepareStatement("select * from answersbasic where btno= '"+d+"'");  
   ResultSet rs = ps.executeQuery();
if(rs.next())
{
  for(int i=0;i<a.length;i++)
 { 
    a[i] = rs.getInt(i+2);
  }
out.println(a[0]+" "+qv1);
  if(a[0]==qv1)
    count= count+1; 
  if(a[1]==qv2)
     count= count+1;
  if(a[2]==qv3)
      count= count+1;
  if(a[3]==qv4)
      count= count+1;
  if(a[4]==qv5)
      count= count+1;
 out.println(count);  

if(d==1)
{
    PreparedStatement ps5 = conn.prepareStatement("select t1 from btestval where uname='"+uname+"'");
    ResultSet rs5= ps5.executeQuery();
    rs5.next();
    bef=rs5.getInt(1);
    temp = count ;
    if(bef!=-1)
    {
        if(bef>count){
            count = bef;
        }
    }
PreparedStatement ps1 = conn.prepareStatement("update btestval set t1 = '"+count+"' where uname='"+uname+"'");
ps1.executeUpdate();
PreparedStatement prepo = conn.prepareStatement(("update cbt set nt1=nt1+1 where uname='"+uname+"'"));
prepo.executeUpdate();
PreparedStatement prep = conn.prepareStatement("select * from cbt where uname='"+uname+"'");
ResultSet res=prep.executeQuery();
res.next();
att = res.getInt(3);
out.println("done");
}
else if(d==2)
{PreparedStatement ps5 = conn.prepareStatement("select t2 from btestval where uname='"+uname+"'");
    ResultSet rs5= ps5.executeQuery();
    rs5.next();
    bef=rs5.getInt(1);
    temp = count ;
    if(bef!=-1)
    {
        if(bef>count){
            count = bef;
        }
    }
    PreparedStatement ps1 = conn.prepareStatement("update btestval set t2 = '"+count+"' where uname='"+uname+"' ");
ps1.executeUpdate();
PreparedStatement prepo = conn.prepareStatement(("update cbt set nt2=nt2+1 where uname='"+uname+"'"));
prepo.executeUpdate();
PreparedStatement prep = conn.prepareStatement("select * from cbt where uname='"+uname+"'");
ResultSet res=prep.executeQuery();
res.next();
att = res.getInt(4);
}
else if(d==3)
{PreparedStatement ps5 = conn.prepareStatement("select t3 from btestval where uname='"+uname+"'");
    ResultSet rs5= ps5.executeQuery();
    rs5.next();
    bef=rs5.getInt(1);
    temp = count ;
    if(bef!=-1)
    {
        if(bef>count){
            count = bef;
        }
    }
    PreparedStatement ps1 = conn.prepareStatement("update btestval set t3 = '"+count+"' where uname='"+uname+"'");
ps1.executeUpdate();
PreparedStatement prepo = conn.prepareStatement(("update cbt set nt3=nt3+1 where uname='"+uname+"'"));
prepo.executeUpdate();
PreparedStatement prep = conn.prepareStatement("select * from cbt where uname='"+uname+"'");
ResultSet res=prep.executeQuery();
res.next();
att = res.getInt(5);
}
else if(d==4){
    PreparedStatement ps5 = conn.prepareStatement("select t4 from btestval where uname='"+uname+"'");
    ResultSet rs5= ps5.executeQuery();
    rs5.next();
    bef=rs5.getInt(1);
    temp = count ;
    if(bef!=-1)
    {
        if(bef>count){
            count = bef;
        }
    }
    PreparedStatement ps1 = conn.prepareStatement("update btestval set t4 = '"+count+"' where uname='"+uname+"' ");
ps1.executeUpdate();
PreparedStatement prepo = conn.prepareStatement(("update cbt set nt4=nt4+1 where uname='"+uname+"'"));
prepo.executeUpdate();
PreparedStatement prep = conn.prepareStatement("select * from cbt where uname='"+uname+"'");
ResultSet res=prep.executeQuery();
res.next();
att = res.getInt(6);
}
else if (d==5)
{PreparedStatement ps5 = conn.prepareStatement("select t5 from btestval where uname='"+uname+"'");
    ResultSet rs5= ps5.executeQuery();
    rs5.next();
    bef=rs5.getInt(1);
    temp = count ;
    if(bef!=-1)
    {
        if(bef>count){
            count = bef;
        }
    }
    PreparedStatement ps1 = conn.prepareStatement("update btestval set t5 = '"+count+"' where uname='"+uname+"'");
ps1.executeUpdate();
PreparedStatement prepo = conn.prepareStatement(("update cbt set nt5=nt5+1 where uname='"+uname+"'"));
prepo.executeUpdate();
PreparedStatement prep = conn.prepareStatement("select * from cbt where uname='"+uname+"'");
ResultSet res=prep.executeQuery();
res.next();
att = res.getInt(7);
}
else
{
   PreparedStatement ps5 = conn.prepareStatement("select t6 from btestval where uname='"+uname+"'");
    ResultSet rs5= ps5.executeQuery();
    rs5.next();
    bef=rs5.getInt(1);
    temp = count ;
    if(bef!=-1)
    {
        if(bef>count){
            count = bef;
        }
    }
    PreparedStatement ps1 = conn.prepareStatement("update btestval set t6 = '"+count+"' where uname='"+uname+"'");
ps1.executeUpdate(); 
PreparedStatement prepo = conn.prepareStatement(("update cbt set nt6=nt6+1 where uname='"+uname+"'"));
prepo.executeUpdate();
PreparedStatement prep = conn.prepareStatement("select * from cbt where uname='"+uname+"'");
ResultSet res=prep.executeQuery();
res.next();
att = res.getInt(8);
}
}
 PreparedStatement pl = conn.prepareStatement("insert into testscore values('"+uname+"','"+d+"','"+att+"','"+temp+"')");
 pl.executeUpdate();
PreparedStatement prep1 = conn.prepareStatement("insert into responseofc values('"+uname+"','"+d+"','"+att+"','"+1+"','"+qv1+"','"+a[0]+"')");
prep1.executeUpdate();
PreparedStatement prep2 = conn.prepareStatement("insert into responseofc values('"+uname+"','"+d+"','"+att+"','"+2+"','"+qv2+"','"+a[1]+"')");
prep2.executeUpdate();
PreparedStatement prep3 = conn.prepareStatement("insert into responseofc values('"+uname+"','"+d+"','"+att+"','"+3+"','"+qv3+"','"+a[2]+"')");
prep3.executeUpdate();
PreparedStatement prep4 = conn.prepareStatement("insert into responseofc values('"+uname+"','"+d+"','"+att+"','"+4+"','"+qv4+"','"+a[3]+"')");
prep4.executeUpdate();
PreparedStatement prep5 = conn.prepareStatement("insert into responseofc values('"+uname+"','"+d+"','"+att+"','"+5+"','"+qv5+"','"+a[4]+"')");
prep5.executeUpdate();
String c= Integer.toString(count);
 session.setAttribute("co", c);
 String t = Integer.toString(temp);
 session.setAttribute("temp",t);
 String b = Integer.toString(bef);
 session.setAttribute("bef",b);
 String at1 = Integer.toString(att);
  session.setAttribute("att", at1);
 //out.println(co);
       %>
       <script type="text/javascript">
    alert("Test submitted succesfully");
    window.location.replace("marks.jsp");
</script>
<% 
   }
   catch(Exception e){
       out.print(e.getMessage());
   }
    %>
</head>
<body>
</body>
</html>