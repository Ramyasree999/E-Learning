<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String uname=(String)session.getAttribute("uname"); %>
<% 
if(uname==null)
{
    response.sendRedirect("index.html");
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
            height: 100%;}
            body {
  margin: 0;
  font-family: Arial;
}

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
            body{
                color: black;
            }
        </style>
    </head>
    <body>
<div class="jumbotron text-center " style="margin-top:-10px;margin-bottom:-10px;">
            <!--<h2 style="padding-bottom:20px;">Learn As You Like</h2>   -->
        </div>
        <div class="container" style="margin-top:-50px;width:100%">
            <nav class="navbar navbar-default">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="logout.jsp">Sign Out</a></li>
                    </ul>
                </div>
            </nav>
            <h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
            <div class="col-md-offset-1 form-inline" style="margin-top: 6%;font-size: 100%">   <h1 align="center">Initial Knowledge Test</h1>


        <form action="ptestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table> 
            
            <tr><td>1) Which do you consider the most time or space complexity</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1" required> Time Complexity<br>
                    <input type="radio" name="q1" value="2" required> Space Complexity<br>
                    <input type="radio" name="q1" value="3" required> Both<br>
                    <input type="radio" name="q1" value="4" required> None
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2) Why do you add comment lines</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1" required> To get the understanding of the code <br>
                    <input type="radio" name="q2" value="2" required> To Debug<br>
                    <input type="radio" name="q2" value="3" required> To Decorate<br>
            </td></tr>
            <tr><td><br></td></tr>
            
            <tr><td>3) What is the other name for Reserved words?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q3" value="1" required> Variables<br>
                    &nbsp;&nbsp;<input type="radio" name="q3" value="2" required> Keywords<br>
                    &nbsp;&nbsp;<input type="radio" name="q3" value="3" required> Constants<br>
                    &nbsp;&nbsp;<input type="radio" name="q3" value="4" required> Functions
            </td></tr>
            <tr><td><br></td></tr>
            
            <tr><td>4) What is meant by Nested Loop?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q4" value="1" required> Loop followed by Loop<br>
                    &nbsp;&nbsp;<input type="radio" name="q4" value="2" required> Loop within a Loop<br>
                    &nbsp;&nbsp;<input type="radio" name="q4" value="3" required> Loop within a function<br>
                    &nbsp;&nbsp;<input type="radio" name="q4" value="4" required> Function within a Loop
            </td></tr>
            <tr><td><br></td></tr>
            
            <tr><td>5) % gives the value of?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q5" value="1" required> remainder<br>
                    &nbsp;&nbsp;<input type="radio" name="q5" value="2" required> divisor<br>
                    &nbsp;&nbsp;<input type="radio" name="q5" value="3" required> Multiple<br>
                    &nbsp;&nbsp;<input type="radio" name="q5" value="4" required> Factor
            </td></tr>
            <tr><td><br></td></tr>
            
         
            
            <tr><td>6) Which programming language do you prefer?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q6" value="1" checked> C<br>
                    &nbsp;&nbsp;<input type="radio" name="q6" value="2" disabled> JAVA<br>
                    &nbsp;&nbsp;<input type="radio" name="q6" value="3" disabled> PYTHON<br>
                    &nbsp;&nbsp;<input type="radio" name="q6" value="4" disabled> C++
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>7) When you want the code to be repeated. What do you use</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q7" value="1" required> Functions or methods  <br>
                    &nbsp;&nbsp;<input type="radio" name="q7" value="2" required> Loops<br>
                    &nbsp;&nbsp;<input type="radio" name="q7" value="3" required> Write the code the number of times I want<br>
                    &nbsp;&nbsp;<input type="radio" name="q7" value="4" required> None
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>8) Variables in a program are</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q8" value="1" required> Name of the location which stores the value<br>
                    &nbsp;&nbsp;<input type="radio" name="q8" value="2" required> Constant<br>
                    &nbsp;&nbsp;<input type="radio" name="q8" value="3" required> Functions<br>
                    &nbsp;&nbsp;<input type="radio" name="q8" value="4" required> Datatypes
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>9) Keywords in a programming language can be used as  Variables</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q9" value="1" required> Yes  <br>
                    &nbsp;&nbsp;<input type="radio" name="q9" value="2" required> No
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>10) Will the comment line gets executed ?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q10" value="1" required> Yes<br>
                    &nbsp;&nbsp;<input type="radio" name="q10" value="2" required> No
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>11) What do you mean by static initialization?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q11" value="1" required> Allocating memory at run time<br>
                    &nbsp;&nbsp;<input type="radio" name="q11" value="2" required> Allocating memory in the program itself<br>
                    &nbsp;&nbsp;<input type="radio" name="q11" value="3" required> Free up allocated memory<br>
                    &nbsp;&nbsp;<input type="radio" name="q11" value="4" required> None <br>
                    
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>12) How are constants different from variables?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q12" value="1" required> Both are same<br>
                    &nbsp;&nbsp;<input type="radio" name="q12" value="2" required> Constant can be changed while variable cannot<br>
                    &nbsp;&nbsp;<input type="radio" name="q12" value="3" required> Constant cannot be modified whereas a variable can be<br>
                    &nbsp;&nbsp;<input type="radio" name="q12" value="4" required> None
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>13) Will the code get compiled if it has run-time bugs?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q13" value="1" required> Yes<br>
                    &nbsp;&nbsp;<input type="radio" name="q13" value="2" required> No
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>14) What do indentation mean?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q14" value="1" required> Variable<br>
                    &nbsp;&nbsp;<input type="radio" name="q14" value="2" required> Method<br>
                    &nbsp;&nbsp;<input type="radio" name="q14" value="3" required> Space<br>
                    &nbsp;&nbsp;<input type="radio" name="q14" value="4" required> Comment
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>15) A function or method, If it  calls itself the process is referred to as?</td></tr>
            <tr><td>
                    &nbsp;&nbsp;<input type="radio" name="q15" value="1" required> Loop<br>
                    &nbsp;&nbsp;<input type="radio" name="q15" value="2" required> Recursion<br>
                    &nbsp;&nbsp;<input type="radio" name="q15" value="3" required> Self block<br>
                    &nbsp;&nbsp;<input type="radio" name="q15" value="4" required> None
            </td></tr>
        <tr><td><br></td></tr>
            <tr><td><button type="submit" class="btn" style="padding: 15px 25px;" >Submit</button></td></tr>
        </table>
        </form>
            </div>
    </body>
</html>
