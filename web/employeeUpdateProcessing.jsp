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
        <title>Update Employee</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h1>Update an Employee Status</h1>
        <hr><br>
        
       <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeUpdate.jsp"> 
            <%              
                int status = emp.update_employee();
                if (status == 1){
            %>
            <h1>Success! You've updated an employee! </h1>
            <% } else { %>
            <h1>Updating Inventory Employee Unsuccessful </h1>
            <% } %>
            

            <input type="submit" value="Update a Record Again"><br><br>
        </form>
        
        <button onclick = "window.location.href = 'employee.html';"> Back to Menu </button>
    </body>
</html>
