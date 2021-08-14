<html>
<script>
function updatePercent(percent)
{
 var oneprcnt = 1;
 var prcnt = document.getElementById('prcnt');
 prcnt.style.width = percent*oneprcnt;
 prcnt.innerHTML = percent + " %";

}
</script>
<body>
<div style="width: 1000px; height: 20px;background-color:white;	padding:0px;" id="status">
    <div id="prcnt" style="height:18px;width:1000px;overflow:hidden;background-color:lightgreen" align="center">0%</div></div>
 <%
//call my fist stuff
 out.println("<script>updatePercent(" + 30 + ")</script>"); 
out.flush();
out.println("<script>updatePercent(" + 30 + ")</script>");
out.flush();
// the fthird parth
 out.println("<script>updatePercent(" + 30 + ")</script>");
out.flush();
//done
 %>

</body>
</html>
    