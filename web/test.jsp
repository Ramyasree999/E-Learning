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
    <% String d = (String)session.getAttribute("dd");%> 
<% int dig = Integer.parseInt(d); %> 
<% String uname = (String)session.getAttribute("uname");
if(uname==null)
{
    response.sendRedirect("index.html");
}
%>
 <h4 style="margin-top: -5%;color: white"> <% out.println(uname); %> </h4>
  <div class="col-md-offset-2 form-inline">
<% Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/elearning", "root", "root");
    int att=0,m=-1,vi;
    if(dig<=6){
    PreparedStatement pip2 = conn.prepareStatement("select * from btestval where uname='"+uname+"'");
    ResultSet rr2 = pip2.executeQuery();
    rr2.next();
    m= rr2.getInt(dig+1);
    }
    else if(dig<=12){
        PreparedStatement pip2 = conn.prepareStatement("select * from itestval where uname='"+uname+"'");
    ResultSet rr2 = pip2.executeQuery();
    rr2.next();
    vi = dig-6;
    m= rr2.getInt(vi+1);
    }
    else if(dig<=18){
        PreparedStatement pip2 = conn.prepareStatement("select * from atestval where uname='"+uname+"' ");
    ResultSet rr2 = pip2.executeQuery();
    rr2.next();
    vi = dig-12;
    m= rr2.getInt(vi+1);
    }
    
    
    if(m!=-1){
    PreparedStatement pip = conn.prepareStatement("select max(attno) from responseofc where uname='"+uname+"' and tno='"+dig+"'");
    ResultSet rr1 = pip.executeQuery();
    rr1.next();
    att = rr1.getInt(1);
    }
    if((m<=2)||(att<2))
    {
    %> <h2 align="center" style="margin-top: 7%;margin-left: -9%"><% out.println("Test"); %><br><br></h2><%
if(dig==1)
{ 
    %>
        <form action="basictestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) Which of the following Tokens?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1" required> Keywords<br>
                    <input type="radio" name="q1" value="2" required> Constants<br>
                    <input type="radio" name="q1" value="3" required> Literals<br>
                    <input type="radio" name="q1" value="4" required> All the above

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2) Comments are used to?
</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1" required> Decorate the program<br>
                    <input type="radio" name="q2" value="2" required> Understand the program<br>
                    <input type="radio" name="q2" value="3" required> To debug the program<br>
                    <input type="radio" name="q2" value="4" required> None
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) "//" these comments are used for? </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1" required> Single Line<br>
                    <input type="radio" name="q3" value="2" required> Double Line<br>
                    <input type="radio" name="q3" value="3" required> Multiple Line<br>
                    <input type="radio" name="q3" value="4" required> None
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) "/*" these comments are used for?
      </td></tr>
            <tr><td>
                    <input type="radio" name="q4" value="1" required> Single Line<br>
                    <input type="radio" name="q4" value="2" required> Double Line<br>
                    <input type="radio" name="q4" value="3" required> Multiple Line<br>
                    <input type="radio" name="q4" value="4" required> None
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) White spaces/Tab spaces are considered in C

            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1" required> True<br>
                    <input type="radio" name="q5" value="2" required> False
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" class="btn" style="padding: 15px 25px;" >Submit</button></td></tr>
</table> <form>
    <%
}
if(dig==2)
{
    %>
<form action="basictestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table> 
            <tr><td>1) The format identifier ?%i? is also used for _____ data type?
	</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> char<br>
                    <input type="radio" name="q1" value="2"> int<br>
                    <input type="radio" name="q1" value="3"> float<br>
                    <input type="radio" name="q1" value="4"> double
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2) What is the size of an int data type?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> 4 Bytes<br>
                    <input type="radio" name="q2" value="2">8 Bytes<br>
                    <input type="radio" name="q2" value="3">Depends on the system/compiler<br>
                    <input type="radio" name="q2" value="4">Cannot be determined
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) What is short int in C programming?</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1">  Basic data type of C<br>
                    <input type="radio" name="q3" value="2"> Qualifier<br>
                    <input type="radio" name="q3" value="3"> short is the qualifier and int is the basic datatype<br>
                    <input type="radio" name="q3" value="4"> All of the above 
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) Which is correct with respect to size of the datatypes?  </td></tr>
            <tr><td>
                    <input type="radio" name="q4" value="1"> char &gt; int &gt; float<br>
                    <input type="radio" name="q4" value="2"> int &gt; char &gt; float<br>
	    <input type="radio" name="q4" value="3"> char &lt; int &lt; double<br>
                    <input type="radio" name="q4" value="4"> double &gt; char &gt; int
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) What is the output of this C code?<br>
		int main()<br>
    	                  {<br>
       		     char chr;<br>
        		     chr = 128;<br>
    		    printf(&quot;%d\n&quot;, chr);<br>
		    }
		    return 0;<br>
		    }<br>

    What is the output of this C code?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 128<br>
                    <input type="radio" name="q5" value="2"> -128<br>
                    <input type="radio" name="q5" value="3"> Depends on the compiler<br>
                    <input type="radio" name="q5" value="4"> None of the mentioned
            </td></tr>
            <tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
            <tr><td><br></td></tr>
</table>
</form>

    <%}
else if(dig==3){
    
    %>
    <form action="basictestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) Loop will execute?


</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> (intialization;
condition
;iteration
)<br>
                    <input type="radio" name="q1" value="2"> (intialization;iteration;condition)<br>
                    <input type="radio" name="q1" value="3"> (condition;initialization;iteration)<br>
                    <input type="radio" name="q1" value="4"> None of the above
            <tr><td><br></td></tr>
            <tr><td>2) We need to intialize a variable inside a loop.</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> True<br>
                    <input type="radio" name="q2" value="2"> False<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) When we use loop?

</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> For n iterations<br>
                    <input type="radio" name="q3" value="2"> For intialization<br>
<input type="radio" name="q3" value="3"> Both A & B<br>
                    <input type="radio" name="q3" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) #include<stdio.h><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int main(){<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int i,n=5;<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for(i=1;i<=n;i++){<br>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(i%2==0)<br>
	              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d ",i);<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

<br></td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> 2 4<br>
                    <input type="radio" name="q4" value="2"> 1 3 5<br> 
                    <input type="radio" name="q4" value="3"> 1 2 3 4 5<br>
                    <input type="radio" name="q4" value="4"> 0 1 2 3

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) #include<stdio.h><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;int main(){<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i,n=10;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for(i=n;i>0;i++){<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(i%2==0 && i%5==0)<br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("%d ",i);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 5<br>
                    <input type="radio" name="q5" value="2"> 1 2 3 4 5 6<br>
                    <input type="radio" name="q5" value="3">10<br>
                    <input type="radio" name="q5" value="4"> 5 10
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    <%
}
else if(dig==4){
    
    %>
<form action="basictestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table> 
            <tr><td>1) What is the time complexity of pop() operation when the stack is implemented using an array?

	</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">  O(1)<br>
                    <input type="radio" name="q1" value="2">  O(n)<br>
                    <input type="radio" name="q1" value="3">  O(logn)<br>
                    <input type="radio" name="q1" value="4">  O(nlogn)
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2) What will be the output of the program?<br>
		    int main()<br>
    	                  {<br>
       		      int a[5] = {5, 1, 15, 20, 25};<br>
       		     int i, j, m;<br>
       		     i = ++a[1];<br>
       		     j = a[1]++;<br>
        		     m = a[i++];<br>
    		    printf(&quot;%d, %d, %d&quot;, i, j, m);<br>
       		     return 0;<br>
       		     }
		</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> 2, 1, 15<br>
                    <input type="radio" name="q2" value="2"> 1, 2, 5<br>
                    <input type="radio" name="q2" value="3"> 3, 2, 15<br>
                    <input type="radio" name="q2" value="4"> 2, 3, 20
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) What will be the output of the program ? 
		    int main()<br>
    	                  {<br>
       		      int a[3][4] = {1, 2, 3, 4, 4, 3, 2, 8, 7, 8, 9, 0};<br>
       		     int *ptr;<br>
       		      ptr = &amp;a[0][0];<br>
       		     fun(&amp;ptr);<br>
        		     return 0;<br>
    		    }<br>
       		     void fun(int **p)<br>
		    {
		    printf(&quot;%d\n&quot;,**p);<br>
       		     }

</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1">  1<br>
                    <input type="radio" name="q3" value="2"> 2<br>
                    <input type="radio" name="q3" value="3"> 3<br>
                    <input type="radio" name="q3" value="4"> 4
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) Which of the following statements are correct about 6 used in the program?<br>
		    int num[6];<br>
		    num[6]=21;<br>
     		</td></tr>
            <tr><td>
                    <input type="radio" name="q4" value="1"> In the first statement 6 specifies a particular element, whereas in the second statement it specifies a type.<br>
                    <input type="radio" name="q4" value="2"> In the first statement 6 specifies a array size, whereas in the second statement it specifies a particular element of array<br>
	    <input type="radio" name="q4" value="3"> In the first statement 6 specifies a particular element, whereas in the second statement it specifies a array size.<br>
                    <input type="radio" name="q4" value="4"> In both the statement 6 specifies array size.
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) Which of the following statements are correct about an array?<br>
		    1:The array int num[26]; can store 26 elements.<br>
		    2:The expression num[1] designates the very first element in the array.<br>
		    3:It is necessary to initialize the array at the time of declaration.<br>
		    4:The declaration num[SIZE] is allowed if SIZE is a macro.
		 
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 1<br>
                    <input type="radio" name="q5" value="2"> 1,4<br>
                    <input type="radio" name="q5" value="3"> 2,3<br>
                    <input type="radio" name="q5" value="4"> 2,4
            </td></tr>
            <tr><td><br></td></tr>
	 <tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    <%}
else if(dig==5){
    
    %>
    <form action="basictestvalid.jsp" method="post" style="max-width:500px;margin:auto">
    <table>
            <tr><td>1) Why do we use functions?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> for dividing larger code into modules<br>
                    <input type="radio" name="q1" value="2">for code reusability<br>
                    <input type="radio" name="q1" value="3">both A & B<br>
                    <input type="radio" name="q1" value="4"> None of the above
            <tr><td><br></td></tr>
            <tr><td>2)what is the another name for function?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> module<br>
                    <input type="radio" name="q2" value="2"> definition<br>
                    <input type="radio" name="q2" value="3">description<br>
                    <input type="radio" name="q2" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3)what are the two types of functions in c programming? </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> user defined<br>
                    <input type="radio" name="q3" value="2"> pre defined<br>
                    <input type="radio" name="q3" value="3"> both a & b<br>
                    <input type="radio" name="q3" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) give an example for pre defined function?</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> printf()<br>
                    <input type="radio" name="q4" value="2"> scanf()<br>
                    <input type="radio" name="q4" value="3"> strlen()<br>
                    <input type="radio" name="q4" value="4">error

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)what is user defined function?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> complete logic must be written by user only<br>
                    <input type="radio" name="q5" value="2"> logic will be pre defined<br>
                    <input type="radio" name="q5" value="3"> both a & b<br>
                    <input type="radio" name="q5" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
    </form>
    <%
}
else if(dig==6){
    %>
    <form action="basictestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) What is the use of pointers?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">Pointers are used to access the information from the memory.<br>
                    <input type="radio" name="q1" value="2"> It acts as a memory tranformer<br>
<input type="radio" name="q1" value="3">It stores the address of the next value<br>
                    <input type="radio" name="q1" value="4"> both a & c
            <tr><td><br></td></tr>
            <tr><td>2) Is datatype* variable and datatype *variable are same?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> Yes<br>
                    <input type="radio" name="q2" value="2"> No<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) Which of the following statement is true?</td></tr>
            <tr><td>
                     <input type="radio" name="q3" value="1"> Typed pointer points to specific type of data <br>
                    <input type="radio" name="q3" value="2"> untyped pointer points to any type of data(generic pointer).<br>
<input type="radio" name="q3" value="3"> both a & b<br>
                    <input type="radio" name="q3" value="4">None of the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) What does * operator returns?
</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1">* operator returns the address of a particular variable.<br>
                    <input type="radio" name="q4" value="2">  * operator returns the value inside a specific address<br> 
                    <input type="radio" name="q4" value="3"> both a & b<br>
                    <input type="radio" name="q4" value="4">None of the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)  void main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;int a=500;<br>
&nbsp;&nbsp;&nbsp;&nbsp;int* pointer=&a;<br>
&nbsp;&nbsp;&nbsp;&nbsp;int* ptr=&pointer;<br>
&nbsp;&nbsp;&nbsp;&nbsp;printf("%d%d%d%d%d%d%d%d", a,pointer,ptr,&i,&pointer,&ptr,*pointer,*ptr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
 Predict the output?(consider address of a=200, pointer=204, ptr=208)
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 500 200 204 200 204 208 500 200<br>
                    <input type="radio" name="q5" value="2">500 200 205 200 204 105 500<br>
 <input type="radio" name="q5" value="3"> 500 200 204 200 204 500 200<br>
                    <input type="radio" name="q5" value="4">500 200 204 200 204 206 208 210
<br>
                    
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
    </form>
    <%
}
else if(dig==7){
   
    %>
    <form action="itestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) condition is checked before executing the body of a loop?


</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">True<br>
                    <input type="radio" name="q1" value="2"> False
            <tr><td><br></td></tr>
            <tr><td>2) What are the loops in c?

</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> for loop<br>
                    <input type="radio" name="q2" value="2">while loop<br>
<input type="radio" name="q2" value="3"> do while loop<br>
                    <input type="radio" name="q2" value="4">All the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) what is nested while loop?

</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1">loop inside a loop<br>
                    <input type="radio" name="q3" value="2"> loop after loop<br>
<input type="radio" name="q3" value="3"> loop with out conditions<br>
                    <input type="radio" name="q3" value="4"> loop with two initializers
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) if inner condition fails outer while statements executes or not?
</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> True<br>
                    <input type="radio" name="q4" value="2"> False<br> 
                    
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) inside while loop even it is empty body it will execute?

            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> True<br>
                    <input type="radio" name="q5" value="2"> False<br>
                    
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    
    <%
}
else if(dig==8){
   
    %>
    <form action="itestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table> 
            <tr><td>1) What is the time complexity of pop() operation when the stack is implemented using an array?

	</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">  O(1)<br>
                    <input type="radio" name="q1" value="2">  O(n)<br>
                    <input type="radio" name="q1" value="3">  O(logn)<br>
                    <input type="radio" name="q1" value="4">  O(nlogn)
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2) What will be the output of the program?<br>
		    int main()<br>
    	                  {<br>
       		      int a[5] = {5, 1, 15, 20, 25};<br>
       		     int i, j, m;<br>
       		     i = ++a[1];<br>
       		     j = a[1]++;<br>
        		     m = a[i++];<br>
    		    printf(&quot;%d, %d, %d&quot;, i, j, m);<br>
       		     return 0;<br>
       		     }
		</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> 2, 1, 15<br>
                    <input type="radio" name="q2" value="2"> 1, 2, 5<br>
                    <input type="radio" name="q2" value="3"> 3, 2, 15<br>
                    <input type="radio" name="q2" value="4"> 2, 3, 20
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) What will be the output of the program ? 
		    int main()<br>
    	                  {<br>
       		      int a[3][4] = {1, 2, 3, 4, 4, 3, 2, 8, 7, 8, 9, 0};<br>
       		     int *ptr;<br>
       		      ptr = &amp;a[0][0];<br>
       		     fun(&amp;ptr);<br>
        		     return 0;<br>
    		    }<br>
       		     void fun(int **p)<br>
		    {
		    printf(&quot;%d\n&quot;,**p);<br>
       		     }

</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1">  1<br>
                    <input type="radio" name="q3" value="2"> 2<br>
                    <input type="radio" name="q3" value="3"> 3<br>
                    <input type="radio" name="q3" value="4"> 4
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) Which of the following statements are correct about 6 used in the program?<br>
		    int num[6];<br>
		    num[6]=21;<br>
     		</td></tr>
            <tr><td>
                    <input type="radio" name="q4" value="1"> In the first statement 6 specifies a particular element, whereas in the second statement it specifies a type.<br>
                    <input type="radio" name="q4" value="2"> In the first statement 6 specifies a array size, whereas in the second statement it specifies a particular element of array<br>
	    <input type="radio" name="q4" value="3"> In the first statement 6 specifies a particular element, whereas in the second statement it specifies a array size.<br>
                    <input type="radio" name="q4" value="4"> In both the statement 6 specifies array size.
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) Which of the following statements are correct about an array?<br>
		    1:The array int num[26]; can store 26 elements.<br>
		    2:The expression num[1] designates the very first element in the array.<br>
		    3:It is necessary to initialize the array at the time of declaration.<br>
		    4:The declaration num[SIZE] is allowed if SIZE is a macro.
		 
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 1<br>
                    <input type="radio" name="q5" value="2"> 1,4<br>
                    <input type="radio" name="q5" value="3"> 2,3<br>
                    <input type="radio" name="q5" value="4"> 2,4
            </td></tr>
            <tr><td><br></td></tr>
	 <tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    <%
}
else if(dig==9){
    
    %>
    <form action="itestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) write a syntax for function declaration in c programming?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> return type func-name(arg list){}<br>
                    <input type="radio" name="q1" value="2"> return type (arg list){}<br>
                    <input type="radio" name="q1" value="3"> return type Func-name(arg list){}<br>
                    <input type="radio" name="q1" value="4"> None of the above
            <tr><td><br></td></tr>
            <tr><td>2) What do you mean by the function call?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> This calls the actual function<br>
                    <input type="radio" name="q2" value="2"> This calls the return types of the function<br>
                    <input type="radio" name="q2" value="3"> Both a & b<br>
                    <input type="radio" name="q2" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) What is the syntax for function call? </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> return type func-name(arg list){}<br>
                    <input type="radio" name="q3" value="2"> func-name(arg list);<br>
                    <input type="radio" name="q3" value="3"> return type(arg list);<br>
                    <input type="radio" name="q3" value="4"> return type (arg list){}
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) Which of the statement is true about of function defination?</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> function defination does not contains all the statements to execute<br>
                    <input type="radio" name="q4" value="2"> function defination contains all the statements to execute<br>
                    <input type="radio" name="q4" value="3"> function defination calls the function<br>
                    <input type="radio" name="q4" value="4"> None of the above

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) What is the syntax for function defination?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> return type func-name(arg list)<br>
                                                                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br>
                                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;body of func;<br>
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    <input type="radio" name="q5" value="2"> return type Func-name(arg list)<br>
                                                                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br>
                                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;body of func;<br>
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    <input type="radio" name="q5" value="3"> return type (arg list)<br>
                                                                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br>
                                                                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;body of func;<br>
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    <input type="radio" name="q5" value="4"> All the above
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    <%
}
else if(dig==10){
    
    %>
    <form action="itestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) Memory allocated to the variable depends upon?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">The datatype<br>
                    <input type="radio" name="q1" value="2">The compiler<br>
<input type="radio" name="q1" value="3">both a & b<br>
                    <input type="radio" name="q1" value="4"> None
            <tr><td><br></td></tr>
            <tr><td>2) What is the syntax of the pointer?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> Yesdatatype* variable<br>
                    <input type="radio" name="q2" value="2"> datatype *varibale<br>
<input type="radio" name="q2" value="3"> both a & b<br>
                    <input type="radio" name="q2" value="4">None of the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3)  void main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;int a=10;<br>
&nbsp;&nbsp;&nbsp;&nbsp;int* p;<br>
&nbsp;&nbsp;&nbsp;&nbsp;p=&a;<br>
&nbsp;&nbsp;&nbsp;&nbsp;printf("%d%d%d",*p,&a,&p);<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
predict the output?(consider address of a=200, p=100)</td></tr>
            <tr><td>
                     <input type="radio" name="q3" value="1"> 10 200 100 <br>
                    <input type="radio" name="q3" value="2"> 10 20 100<br>
<input type="radio" name="q3" value="3"> 100 200 300<br>
                    <input type="radio" name="q3" value="4">100 200 100<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) *p=5;<br>
&nbsp;&nbsp;&nbsp;&nbsp;printf("%d",a); </td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> 6<br>
                    <input type="radio" name="q4" value="2"> 0<br> 
                    <input type="radio" name="q4" value="3"> 5<br>
                    <input type="radio" name="q4" value="4"> 4
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)  What is the memory allcated for int, char and float?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 4,1,4<br>
                    <input type="radio" name="q5" value="2">4,4,4<br>
 <input type="radio" name="q5" value="3"> 1,1,4<br>
                    <input type="radio" name="q5" value="4">4,4,1
<br>
                    
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    <%
}
else if(dig==11){
    
    %> <form action="itestvalid.jsp" method="post" style="max-width:500px;margin:auto">
    <table> 
            <tr><td>1) The correct syntax to access the member of the ith structure in the array of structures is?<br>
		    struct temp<br>
		    {<br>
    	                  int b;<br>
       		     }<br>
        		     s[50];
	</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> s.b[i];<br>
                    <input type="radio" name="q1" value="2"> s.[i].b;<br>
                    <input type="radio" name="q1" value="3"> s.b.[i];<br>
                    <input type="radio" name="q1" value="4"> s[i].b;
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2) What is the output of this C code?<br>
		    #include<br>
		    struct temp<br>
    	                  {<br>
       		     int a;<br>
        		     int b;<br>
		    int c;<br>
		    }<br>
		    main()<br>
        		     {<br>
		    struct temp p[]={{1,2,3},{4,5,6},{7,8,9}};<br>
		    }</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> No Compile time error, generates an array of structure of size 3<br>
                    <input type="radio" name="q2" value="2"> No Compile time error, generates an array of structure of size 9<br>
                    <input type="radio" name="q2" value="3"> Compile time error, illegal declaration of a multidimensional array<br>
                    <input type="radio" name="q2" value="4"> Compile time error, illegal assignment to members of structure
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) Which of the following uses structure? </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1">  Array of structures<br>
                    <input type="radio" name="q3" value="2"> Linked Lists<br>
                    <input type="radio" name="q3" value="3"> Binary Tree<br>
                    <input type="radio" name="q3" value="4"> All of the mentioned
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) What is the correct syntax to declare a function foo() which receives an array of structure in function?
            <tr><td>
                    <input type="radio" name="q4" value="1"> void foo(struct *var);<br>
                    <input type="radio" name="q4" value="2"> void foo(struct *var[]);<br>
	    <input type="radio" name="q4" value="3"> void foo(struct var);<br>
                    <input type="radio" name="q4" value="4"> none of the mentioned

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) What is the output of this C code?<br>
		     #include	
		     struct point<br>
    	                  {<br>
       		     int x;<br>
        		     int y;<br>
    		    };<br>
		    void foo(struct point*);<br>
		    foo(p1);<br>
		    }<br>
    		    void foo(struct point p[])<br>
		    {<br>
		    printf(&quot;%d\n&quot;,p[1].x);<br>
		    }<br>
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> compile time error<br>
                    <input type="radio" name="q5" value="2"> 3<br>
                    <input type="radio" name="q5" value="3"> 2<br>
                    <input type="radio" name="q5" value="4"> 1
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr></table></form>
    <%
}
else if(dig==12){
    
    %>
    <form action="itestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) Which of the below statements are true about files?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> It is a collection of reports<br>
	     <input type="radio" name="q1" value="2"> These can be manipulated easily<br>
                    <input type="radio" name="q1" value="3"> Both A & B<br>
                    <input type="radio" name="q1" value="4"> None of the above<br>
            <tr><td><br></td></tr>
            <tr><td>2) File is also called as? </td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> Memory storage<br>
                    <input type="radio" name="q2" value="2"> Disk<br>
                    <input type="radio" name="q2" value="3"> Drive<br>
                    <input type="radio" name="q2" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) How many types File I/O functions can be divided into?</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> 2<br>
                    <input type="radio" name="q3" value="2"> 3<br>
                    <input type="radio" name="q3" value="3"> 4<br>
                    <input type="radio" name="q3" value="4"> 5<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) What does text contain? </td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> Alphabets<br>
                    <input type="radio" name="q4" value="2"> Numbers<br>
                    <input type="radio" name="q4" value="3"> Both A &amp; B<br>
                    <input type="radio" name="q4" value="4"> None of the above

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)  fwrite() can be used only with files that are opened in binary mode.
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> True<br>
                    <input type="radio" name="q5" value="2"> False<br>
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
    </form>
    <%
}
else if(dig==13){
    
    %>
    <form action="atestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) whether the condition is checked or not the do-while is executed in how many times?

</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">one time<br>
                    <input type="radio" name="q1" value="2"> zero times<br>
<input type="radio" name="q1" value="3">n times<br>
                    <input type="radio" name="q1" value="4"> n-1 times
            <tr><td><br></td></tr>
            <tr><td>2) do-while loop is also named as exit controlled loop?
</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> True<br>
                    <input type="radio" name="q2" value="2"> False<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) semicolon is required for while loop or not?

</td></tr>
            <tr><td>
                     <input type="radio" name="q3" value="1"> True<br>
                    <input type="radio" name="q3" value="2"> False<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) condition will be checked after executinon of statement?


</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> No<br>
                    <input type="radio" name="q4" value="2"> Yes<br> 
                    
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) while loop evaluates the test expression inside ?


            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> parenthesis<br>
                    <input type="radio" name="q5" value="2">semicolon<br>
 <input type="radio" name="q5" value="3"> condition<br>
                    <input type="radio" name="q5" value="4">colon<br>
                    
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table></form>
    <%
}
else if(dig==14){
    
    %>
    <form action="atestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) What is the operator used to refer stucture variable pointer
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1" required> *<br>
                    <input type="radio" name="q1" value="2" required> -><br>
                    <input type="radio" name="q1" value="3" required> .<br>
                    <input type="radio" name="q1" value="4" required>^

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>2)We use dot(.) operator when the left operand must be of what type of variable
</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1" required>Stucture variable pointer<br>
                    <input type="radio" name="q2" value="2" required> Stucture variable <br>
                    <input type="radio" name="q2" value="3" required> variable pointer<br>
                    <input type="radio" name="q2" value="4" required>  variable 
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3)Right side operand is called </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1" required> variable<br>
                    <input type="radio" name="q3" value="2" required> member<br>
                    <input type="radio" name="q3" value="3" required> pointer<br>
                    <input type="radio" name="q3" value="4" required> keyword
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) How to access rollnumber<br>
      </td></tr>
            <tr><td>
                    <input type="radio" name="q4" value="1" required> a.rollnumber<br>
                    <input type="radio" name="q4" value="2" required> ptr->rollnumber<br>
   <input type="radio" name="q4" value="3" required>both a and b<br>
                    <input type="radio" name="q4" value="4" required> none 
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5) is it valid ptr.rollnumber<br>

            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1" required>yes<br>
                    
                    <input type="radio" name="q5" value="2" required>no

            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" class="btn" style="padding: 15px 25px;" >Submit</button></td></tr>
</table>
    </form>
    <%
}
else if(dig==15){
    
    %>
    <form action="atestvalid.jsp" method="post" style="max-width:500px;margin:auto">
       <table>
            <tr><td>1) what are the 2 ways for calling function?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> call by value<br>
                    <input type="radio" name="q1" value="2"> call by reference<br>
                    <input type="radio" name="q1" value="3"> both a & b<br>
                    <input type="radio" name="q1" value="4"> None of the above<br>
            <tr><td><br></td></tr>
            <tr><td>2) what is call by value?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1">the value of variable is passed to function as a parameter<br>
                    <input type="radio" name="q2" value="2">the value of variable is passed from function.<br>
                    <input type="radio" name="q2" value="3">Both a & b<br>
                    <input type="radio" name="q2" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) is the value of actual parameter can be modified by formal parameter? </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> Yes<br>
                    <input type="radio" name="q3" value="2"> No
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) what is meant by actual parameter?</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> this is arg which is used in func return<br>
                    <input type="radio" name="q4" value="2"> this is arg which is used in func call<br>
                    <input type="radio" name="q3" value="3"> Both a & b<br>
                    <input type="radio" name="q3" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)what is the meaning of formal parameter?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> this is arg which is used in func return<br>
                    <input type="radio" name="q5" value="2"> this is arg which is used in func call<br>
                     <input type="radio" name="q5" value="3"> this is arg which is used in func defination<br>
                    <input type="radio" name="q5" value="4"> All the above
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>

    </form>
    <%
}
else if(dig==16){
    
    %>
    <form action="atestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) What are the features of pointers?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1">saves memory space<br>
                    <input type="radio" name="q1" value="2">the execution time with pointers is faster because data is manipulated with the  address<br>
<input type="radio" name="q1" value="3">the memory is accessed efficiently with the pointer<br>
                    <input type="radio" name="q1" value="4"> All the above
            <tr><td><br></td></tr>
            <tr><td>2)How to access the pointer variable?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> indirection operator(*) is used<br>
                    <input type="radio" name="q2" value="2"> indirection operator(&) is used<br>
<input type="radio" name="q2" value="3"> both a & b<br>
                    <input type="radio" name="q2" value="4">None of the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3)  void main()<br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;int x=10,y;<br>
&nbsp;&nbsp;&nbsp;&nbsp;int* p;<br>
&nbsp;&nbsp;&nbsp;&nbsp;p=&x;<br>
&nbsp;&nbsp;&nbsp;&nbsp;y=*p;<br>
&nbsp;&nbsp;&nbsp;&nbsp;printf("%d%d%d%d%d",x,&x,*p,p,y);<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
predict the output?(address of x=5000)</td></tr>
            <tr><td>
                     <input type="radio" name="q3" value="1"> 10 5000 10 5000 10<br>
                    <input type="radio" name="q3" value="2"> 10 50 100 50 100<br>
<input type="radio" name="q3" value="3"> 100 500 10 5000<br>
                    <input type="radio" name="q3" value="4">100 5000 10 1000<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) *p=5;<br>
&nbsp;&nbsp;&nbsp;&nbsp;printf("%d",a); </td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> 6<br>
                    <input type="radio" name="q4" value="2"> 0<br> 
                    <input type="radio" name="q4" value="3"> 5<br>
                    <input type="radio" name="q4" value="4"> 4
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)  What is the memory allocated for int, char and float?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> 4,1,4<br>
                    <input type="radio" name="q5" value="2">4,4,4<br>
 <input type="radio" name="q5" value="3"> 1,1,4<br>
                    <input type="radio" name="q5" value="4">4,4,1
<br>
                    
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
</form>
    <%
}
else if(dig==17){
    
    %>
    <form action="atestvalid.jsp" method="post" style="max-width:500px;margin:auto">
        <table>
            <tr><td>1) What is a structure?
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> It is a collection of same data types<br>
                    <input type="radio" name="q1" value="2"> It is a collection of different data types<br>
                    <input type="radio" name="q1" value="3"> both a & b<br>
                    <input type="radio" name="q1" value="4"> None of the above<br>
            <tr><td><br></td></tr>
            <tr><td>2) Declaration and initialization of structure?</td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1">keyword name_of_strructure<br>
                                                                             &nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem3;<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    <input type="radio" name="q2" value="2"> name_of_strructure <br>
                                                                                     &nbsp;&nbsp;&nbsp;&nbsp;{<br>
                                                                                       &nbsp;&nbsp;&nbsp;&nbsp; datatype mem1;<br>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;datatype mem2;<br>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp; datatype mem3;<br>
                                                                                       &nbsp;&nbsp;&nbsp;&nbsp;}<br>
                    <input type="radio" name="q2" value="3"> keyword name_of_strructure<br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem3;<br>
&nbsp;&nbsp;&nbsp;&nbsp;};<br>
                    <input type="radio" name="q2" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) Declaration of structure variables. </td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> keyword name_of_strructure<br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem3;<br>
&nbsp;&nbsp;&nbsp;&nbsp;}b;<br>
                    <input type="radio" name="q3" value="2">keyword <br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem3;<br>
&nbsp;&nbsp;&nbsp;&nbsp;}b;<br>
                    <input type="radio" name="q3" value="3"> keyword name_of_strructure<br>
&nbsp;&nbsp;&nbsp;&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem2;<br>
&nbsp;&nbsp;&nbsp;&nbsp;datatype mem3;<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;&nbsp;&nbsp;Struct name_of_strructure b;<br>
                    <input type="radio" name="q3" value="4"> All the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) Structure is a collection of different datatypes ,grouped together into a single name.</td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> false<br>
                    <input type="radio" name="q4" value="2"> true
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)Is initialization and declaration is required for structures?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> No<br>
                    <input type="radio" name="q5" value="2"> Yes
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table>
    </form>
    <%
}
else if(dig==18){
    
    %>
    <form action="atestvalid.jsp" method="post" style="max-width:500px;margin:auto">
       <table>
            <tr><td>1) Syntax for close a file
</td></tr>
            <tr><td>
                    <input type="radio" name="q1" value="1"> int fclose(file fp);<br>
	     <input type="radio" name="q1" value="2"> int close(file fp);<br>
                    <input type="radio" name="q1" value="3"> int fclose(FILE fp);<br>
                    <input type="radio" name="q1" value="4"> int close(File fp);<br>
            <tr><td><br></td></tr>
            <tr><td>2) What if a file doesn't exist? </td></tr>
            <tr><td>
                    <input type="radio" name="q2" value="1"> Returns null value<br>
                    <input type="radio" name="q2" value="2"> returns value 0<br>
                    <input type="radio" name="q2" value="3"> Both A & B<br>
                    <input type="radio" name="q2" value="4"> None of the above
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>3) Syntax to read a file?</td></tr>
            <tr><td>
                    <input type="radio" name="q3" value="1"> int getc(file fp);<br>
                    <input type="radio" name="q3" value="2"> int getc(FILE fp);<br>
                    <input type="radio" name="q3" value="3"> Both A & B<br>
                    <input type="radio" name="q3" value="4"> None of the above<br>
            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>4) To work with a file input and output we use? </td></tr>
         <tr><td>
                    <input type="radio" name="q4" value="1"> fprintf<br>
                    <input type="radio" name="q4" value="2"> fscanf<br>
                    <input type="radio" name="q4" value="3"> Both A &amp; B<br>
                    <input type="radio" name="q4" value="4"> None of the above

            </td></tr>
            <tr><td><br></td></tr>
            <tr><td>5)  fgetc function returns?
            </td></tr>
            <tr><td>
                    <input type="radio" name="q5" value="1"> int<br>
                    <input type="radio" name="q5" value="2"> char<br>
                    <input type="radio" name="q5" value="3"> float<br>
                    <input type="radio" name="q5" value="4"> double<br>
            </td></tr>
            <tr><td><br></td></tr>
<tr><td><button type="submit" style="padding:15px 25px">Submit</button></td></tr>
</table></form>
    <%
}
    }
    else
    { %> <div class="col-md-offset-3 form-inline" style="margin-top: 18%;font-size: 200%"> <%
    out.println("You can only attempt the test for 2 times");
    out.println("<br><br><a href='basiclinks.jsp'>Back To Previous</a>");
    %> </div> <%}
    try
    {
        PreparedStatement ps = conn.prepareStatement("select * from btestval where uname= '"+uname+"'");
        ResultSet rs=ps.executeQuery();
        if(!rs.next()){
        
            PreparedStatement ps1 = conn.prepareStatement("insert into btestval(uname) values ('"+uname+"')");
        ps1.executeUpdate();
        }
        PreparedStatement ps2 = conn.prepareStatement("select * from itestval where uname= '"+uname+"'");
        ResultSet rs1=ps2.executeQuery();
        if(!rs1.next()){
        PreparedStatement ps3 = conn.prepareStatement("insert into itestval(uname) values ('"+uname+"')");
        ps3.executeUpdate();
        }
        PreparedStatement ps5 = conn.prepareStatement("select * from atestval where uname= '"+uname+"'");
        ResultSet rs2=ps5.executeQuery();
        if(!rs2.next()){
        PreparedStatement ps4 = conn.prepareStatement("insert into atestval(uname) values ('"+uname+"')");
        ps4.executeUpdate();
    }
        
    }

  catch(Exception e){
       out.print(e.getMessage());
    }
    %> </div>
            </body>
        </html>
