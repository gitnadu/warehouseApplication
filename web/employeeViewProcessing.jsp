<%-- 
    Document   : registerInventoryEmployee_processing
    Created on : 11 14, 23, 12:04:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Inventory Employees Processing</title>
    </head>
    <body>
        <h2>View Inventory Employee</h2>
        <hr><br>
        <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        
        <% 
            String temp = request.getParameter("employee_idV");
            emp.employee_ID = Integer.valueOf(temp); 
            int status = emp.get_employee_record();
            if (status == 1){
        %>
        <h2> Success </h2>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        <form action="employee.html"> 
            Employee First Name: <%=emp.first_name %>  <br><br>
            Employee Last Name: <%=emp.last_name %> <br><br>
            Employee Middle Name: <%=emp.middle_name %>  <br><br>
            Employee Permanent Address: <%=emp.permanent_address %> <br><br>
            Employee Current Address:  <%=emp.current_address %> <br><br>
            Employee Gender:<%=emp.gender %> <br><br>
            Employee Birthday:<%=emp.birthday%> <br><br>
            Employee Email Address: <%=emp.email_address %>  <br><br>
            Employee Start of Employment Date: <%=emp.employment_start_date %>  <br><br>
            Employee End of Employment Date: 
            <% if (emp.employment_end_date == null) { %>
            --- <% } else { %> <%=emp.employment_end_date%> <% } %>
            Employee Phone Number: <%=emp.phone_number %>"> <br><br>
            <input type="submit" value="Go back">
        </form>
        <button onclick = "window.location.href = 'employee.html';">Go Home</button> <br><br>
        <button onclick = "window.location.href = 'employeeView.jsp';">Cancel</button>
    </body>
</html>