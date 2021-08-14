<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%

            session.invalidate();

        %>
        
<script type="text/javascript">
        alert("You are Sucessfully logged out...");
    window.location.replace("adminlogin.html");
</script>
    </body>

</html>
