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
        <title>View Inventory Employees</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h2>View Inventory Employees</h2>
        <hr><br>
        
        <form action="employeeViewProcessing.jsp"> 
            <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
            Employee ID: <select id="employee_idV" name="employee_idV"> 
            <%  emp.get_employees();
                for(int i=0;i<emp.employee_IDList.size();i++){
            %>
            <option value="<%=emp.employee_IDList.get(i) %>" > <%=emp.employee_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
        <button onclick = "window.location.href = 'employee.html';">Cancel</button>
    </body>
</html>
