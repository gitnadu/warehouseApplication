<%-- 
    Document   : employeeUpdate
    Created on : 11 15, 23, 12:32:26 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h1>View an Employee</h1>
        <hr><br>
        
       <form action="employeeViewProcessing.jsp"> 
            <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
            Employee ID: <select id="employee_idV" name="employee_idV" required>  
            <%  emp.get_employees();
                for(int i=0;i<emp.employee_IDList.size();i++){
            %>
            <option value="<%=emp.employee_IDList.get(i) %>" > <%=emp.employee_IDList.get(i) %> </option>
            <% } %>
            </select> <br><br>
            <input type="submit" value="Submit"> <br><br>
        </form>
        <button onclick = "window.location.href = 'employee.html';">Cancel</button>
    </body>
</html>
