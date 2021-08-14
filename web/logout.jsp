<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%

            session.invalidate();

        %>
        
<script type="text/javascript">
        alert("You are Sucessfully logged out...");
    window.location.replace("Login.html");
</script>
    </body>

</html>
