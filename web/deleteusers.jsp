update <%@page import="java.sql.*" %>
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
<%
try
{
  Connection conn = null; 
  Class.forName("com.mysql.jdbc.Driver");  
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning","root","root");
  System.out.println("Connection Estalished");
  PreparedStatement ps = conn.prepareStatement(" delete from StudentDetails where username='"+u+"'  ");
  ps.executeUpdate();
  PreparedStatement ps1 = conn.prepareStatement(" delete from logindetails where username='"+u+"'  ");
  ps1.executeUpdate();
  PreparedStatement ps2 = conn.prepareStatement(" delete from score where username='"+u+"'  ");
  ps2.executeUpdate();
  PreparedStatement ps3 = conn.prepareStatement(" delete from ptest1 where username='"+u+"'  ");
  ps3.executeUpdate();
  PreparedStatement ps4 = conn.prepareStatement(" delete from btestval where uname='"+u+"'  ");
  ps4.executeUpdate();
  PreparedStatement ps5 = conn.prepareStatement(" delete from itestval where uname='"+u+"'  ");
  ps5.executeUpdate();
  PreparedStatement ps6 = conn.prepareStatement(" delete from atestval where uname='"+u+"'  ");
  ps6.executeUpdate();
  PreparedStatement ps7 = conn.prepareStatement(" delete from cit where uname='"+u+"'  ");
  ps7.executeUpdate();
  PreparedStatement ps8 = conn.prepareStatement(" delete from cbt where uname='"+u+"'  ");
  ps8.executeUpdate();
  PreparedStatement ps9 = conn.prepareStatement(" delete from cat where uname='"+u+"'  ");
  ps9.executeUpdate();
  PreparedStatement ps10 = conn.prepareStatement(" delete from responseofc where uname='"+u+"'  ");
  ps10.executeUpdate();
  PreparedStatement ps11 = conn.prepareStatement(" delete from responseofjava where uname='"+u+"'  ");
  ps11.executeUpdate();
  PreparedStatement ps12 = conn.prepareStatement(" delete from responseofpython where uname='"+u+"'  ");
  ps12.executeUpdate();
  PreparedStatement ps13 = conn.prepareStatement(" delete from testscore where uname='"+u+"'  ");
  ps13.executeUpdate();
  response.sendRedirect("listusers.jsp");
  
}
catch(Exception e)
{
   out.println(e.getMessage()); 
}
%>