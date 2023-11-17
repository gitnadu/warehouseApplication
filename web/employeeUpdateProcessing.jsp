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
    </head>
    <body>
        <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeUpdate.jsp"> 
            <%              
                int status = obj.update_employee();
                if (status == 1){
            %>
            <h1>Updating Inventory Employee Successful </h1>
            <% } else { %>
            <h1>Updating Inventory Employee Unsuccessful </h1>
            <% } %>
            

            <input type="submit" value="Update a record again">
        </form>
        
        <button onclick = "window.location.href = 'employee.html';"> Back to Main Menu </button>
    </body>
</html>
