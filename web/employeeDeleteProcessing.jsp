<%-- 
    Document   : employeeUpdateProcessing
    Created on : 11 15, 23, 8:11:11 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeDelete.jsp"> 
            
            <% 
                int status = emp.delete_employee();
                if (status == 1){
            %>
            <h1>Record is successfully Deleted </h1>
            <% } else { %>
            <h1>Record is unsuccessfully Deleted </h1>
            <% } %>
            <input type="submit" value="Delete again">   
        </form>
            
        <button onclick = "window.location.href = 'index.jsp';"> Return to main menu</button>
        
    </body>
</html>
