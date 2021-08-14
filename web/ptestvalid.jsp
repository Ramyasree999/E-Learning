<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% String uname=(String)session.getAttribute("uname"); 
if(uname==null)
{
    response.sendRedirect("index.html");
}
%>
<html>
<head>
<% String lang,selectedlang;
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
    String q6=request.getParameter("q6");
    int qv6 = Integer.parseInt(q6);
    String q7=request.getParameter("q7");
    int qv7 = Integer.parseInt(q7);
    String q8=request.getParameter("q8");
    int qv8 = Integer.parseInt(q8);
    String q9=request.getParameter("q9");
    int qv9 = Integer.parseInt(q9);
    String q10=request.getParameter("q10");
    int qv10 = Integer.parseInt(q10);
    String q11=request.getParameter("q11");
    int qv11= Integer.parseInt(q11);
    String q12=request.getParameter("q12");
    int qv12 = Integer.parseInt(q12);
    String q13=request.getParameter("q13");
    int qv13 = Integer.parseInt(q13);
    String q14=request.getParameter("q14");
    int qv14 = Integer.parseInt(q14);
    String q15=request.getParameter("q15");
    int qv15 = Integer.parseInt(q15);
    //out.print(qv1);
    if(q6.equals("1"))
        lang= "c";
    else if(q6.equals("2"))
        lang="java";
    else if(q6.equals("3"))
        lang="python";
    else
        lang="c++";
    selectedlang=request.getParameter("lang");
   
    session.setAttribute("selectedlang",selectedlang);
    PreparedStatement ps=conn.prepareStatement("insert into ptest1 values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
   ps.setString(1,uname);  
   ps.setInt(2,qv1);
   ps.setInt(3,qv2);
   ps.setInt(4,qv3);
   ps.setInt(5,qv4);
   ps.setInt(6,qv5);
   ps.setInt(7,qv6);
   ps.setInt(8,qv7);
   ps.setInt(9,qv8);
   ps.setInt(10,qv9);
   ps.setInt(11,qv10);
   ps.setInt(12,qv11);
   ps.setInt(13,qv12);
   ps.setInt(14,qv13);
   ps.setInt(15,qv14);
   ps.setInt(16,qv15);
   int i=ps.executeUpdate();  
   if(i>0){
       %>
       <script type="text/javascript">
    alert("Test submitted succesfully");
    window.location.replace("cluster.jsp");
</script>
<%
   }
   }
   catch(Exception e){
       out.print(e.getMessage());
   }
    %>
</head>
<body>
</body>
</html>
