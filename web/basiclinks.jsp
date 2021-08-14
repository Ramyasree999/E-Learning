<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<% String uname=(String)session.getAttribute("uname"); 
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
            <h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
            <h1 align="center" style="margin-top:8%"> <b><u><big> C Language </big></u></b></h1>
<% int ve; %>
<div style="margin-top:5px;font-size: 120%">
            <table style="margin-left :130px;">
                <tr align="center"><td><h1><b>Basic</b></h1></td><td><h1><b>Intermediate</b></h1></td><td><h1><b>Advanced</b></h1></td></tr>
            <tr align="center"><td style="width:400px;"><h1><span><a href="content.jsp?c=https://www.youtube.com/embed/QcjI_mpPW-c&d=1">Syntax rules</a></span></h1></td>
            <td style="width:400px;"><h1><span><a href="intcontent.jsp?c=https://www.youtube.com/embed/O-YVnoiH2Es&d=7">Loops-2</a></span></h1></td>
            <td style="width:400px;"><h1><span><a href="advcontent.jsp?c=https://www.youtube.com/embed/q4csanUFQMo&d=13">Loops-3</a></span></h1></td></tr>
               
 <tr align="center"><td><h1><a href="content.jsp?c=https://www.youtube.com/embed/SKqVQO0ab8s&d=2">Data Types</a></h1></td>
               <td><h1><span><a href="intcontent.jsp?c=https://www.youtube.com/embed/e22OJ6YkTRY/&d=8">Arrays-2</a></span></h1></td>
               <td><h1><span><a href="advcontent.jsp?c=https://www.youtube.com/embed/fxbNgR_ZAo8/&d=14">Arrays-3</a></span></h1></td></tr>
               
<tr align="center"> <td><h1><a href="content.jsp?c=https://www.youtube.com/embed/qUPXsPtWGoY&d=3">Loops</a></h1></td>
               <td><h1><span><a href="intcontent.jsp?c=https://www.youtube.com/embed/y1Q8VfgDX4c&d=9">Functions-2</a></span></h1>
               </td>
               <td><h1><span><a href="advcontent.jsp?c=https://www.youtube.com/embed/HEiPxjVR8CU&d=15">Functions-3</a></span></h1></td>
               </tr>
               
<tr align="center"> <td><h1><a href="content.jsp?c=https://www.youtube.com/embed/e22OJ6YkTRY/&d=4">Arrays</a></h1></td>
               <td><h1><span><a href="intcontent.jsp?c=https://www.youtube.com/embed/h-HBipu_1P0&d=10">Pointers-2</span></h1></td>
               <td><h1><span><a href="advcontent.jsp?c=https://www.youtube.com/embed/mw1qsMieK5c&d=16">Pointers-3</a></span></h1></td></tr>
               
               <tr align="center"> <td><h1><a href="content.jsp?c=https://www.youtube.com/embed/cg0p0oAhz8A&d=5">Functions</a></h1></td>
               <td><h1><span><a href="intcontent.jsp?c=https://www.youtube.com/embed/aw7r4VMmagE&d=11">Structures-1</a></span></h1></td>
               <td><h1><span><a href="advcontent.jsp?c=https://www.youtube.com/embed/5-KthEsjV1I&d=17">Structures-3</a></span></h1></td></tr>
               
               <tr align="center"> <td><h1><a href="content.jsp?c=https://www.youtube.com/embed/47IS8VtAM9E&d=6">Pointers</a></h1></td>
               <td><h1><span><a href="intcontent.jsp?c=https://www.youtube.com/embed/O2aJnTDl1jI&d=12">Files</a></span></h1></td>
               <td><h1><span><a href="advcontent.jsp?c=https://www.youtube.com/embed/7Q2CPMW8Mpo&d=18">Files-2</a></span></h1></td></tr>
        </table>


    </div>
    </body>
</html>
