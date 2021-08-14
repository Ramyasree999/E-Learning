<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <% String uname=(String)session.getAttribute("uname");
    if(uname==null)
{
    response.sendRedirect("index.html");
}
%>
<h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
<%  
Class.forName("com.mysql.jdbc.Driver");
int a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
     double v1,v2,v3,v4,v5,vt6,v7,v8,v9,v10,v11,v12,v13,v14,v15,score;
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
try{
    PreparedStatement ps=conn.prepareStatement("select * from ptest1 where username='"+uname+"'");
ResultSet rs=ps.executeQuery();
/*int[] a = new int[15];
if(rs.next())
{
  for(int i=0;i<a.length;i++)
 { 
    a[i] = rs.getInt(i+1);
  }
}*/

if(rs.next())
{
    a1=rs.getInt(2);
    a2=rs.getInt(3);
    a3=rs.getInt(4);
    a4=rs.getInt(5);
    a5=rs.getInt(6);
    a6=rs.getInt(7);
    a7=rs.getInt(8);
    a8=rs.getInt(9);
    a9=rs.getInt(10);
    a10=rs.getInt(11);
    a11=rs.getInt(12);
    a12=rs.getInt(13);
    a13=rs.getInt(14);
    a14=rs.getInt(15);
    a15=rs.getInt(16);
    
    if(a1==1||a1==2)
        v1=1;
    else if(a1==3)
        v1=2;
    else 
        v1=0;
    if(a2==1)
        v2=2;
    else if(a2==2)
        v2=1;
    else
        v2=0;
    if(a3==2)
        v3=2;
    else
        v3=0;
    if(a4==2)
        v4=2;
    else
        v4=0;
    if(a5==1)
        v5=2;
    else
        v5=0;
    if(a6==1||a6==2)
        vt6=2;
        else if(a6==3||a6==4)
            vt6=2;
    if(a7==1||a7==2)
        v7=2;
    else if(a7==3)
        v7=1;
    else
        v7=0;
    if(a8==1)
        v8=2;
    else
        v8=0;
    if(a9==1)
        v9=0;
    else
        v9=2;
    if(a10==2)
        v10=2;
    else
        v10=0;
    if(a11==2)
        v11=2;
    else
        v11=0;
    if(a12==3)
        v12=2;
    else
        v12=0;
    if(a13==1)
        v13=2;
    else
        v13=0;
    if(a14==3)
        v14=2;
    else
        v14=0;
    if(a15==2)
        v15=2;
    else
        v15=0;
 score=(2*(v5+2+v9+v14+v15))+(3*(v1+v4+v13))+(4*(v2+v3+v7+v12))+(5*(v8+v10+v11));
 double ar[];
ar = new double [15];
   ar[0]= 3*v1;
   ar[1]= 4*v2;
   ar[2]= 4*v3;
   ar[3]= 3*v4;
   ar[4]= 2*v5;
   ar[5]= 2*2;
   ar[6]= 4*v7;
   ar[7]= 5*v8;
   ar[8]= 2*v9;
   ar[9]= 5*v10;
   ar[10]= 5*v11;
   ar[11]= 4*v12;
   ar[12]= 3*v13;
   ar[13]= 2*v14;
   ar[14]= 2*v15;
   String lang;
   if(a6==1)
     lang="c";
   else if(a6==2)
       lang="java";
   else if(a6==3)
       lang ="python";
   else
       lang="c++";
   PreparedStatement ps1 =conn.prepareStatement("insert into score(username,score,lang,visit) values ('"+uname+"','"+score+"','"+lang+"','"+-1+"')");
   ps1.executeUpdate();
   response.sendRedirect("learn.jsp");
   out.println("Your score is "+score); 
}
}
catch(Exception e){
    out.print(e.getMessage());
}
%>