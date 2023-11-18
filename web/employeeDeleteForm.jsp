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
        <title>Register Inventory Employee Form</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h2> Register Inventory Employee Form </h2>
        <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        <% 
            
            String temp = request.getParameter("employee_idD");
            emp.employee_ID = Integer.valueOf(temp); 
            int status = emp.get_employee_record();
            if (status == 1){
        %>
        <h2> Success </h2>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        <form action="employeeDeleteProcessing.jsp"> 
            Employee First Name: <%=emp.first_name %>  <br>
            Employee Last Name: <%=emp.last_name %> <br>
            Employee Middle Name: <%=emp.middle_name %>  <br>
            Employee Permanent Address: <%=emp.permanent_address %> <br>
            Employee Current Address:  <%=emp.current_address %> <br>
            Employee Gender:<%=emp.gender %> <br>
            Employee Birthday:<%=emp.birthday%> <br>
            Employee Email Address: <%=emp.email_address %>  <br>
            Employee Start of Employment Date: <%=emp.employment_start_date %>  <br>
            Employee End of Employment Date: 
            <% if (emp.employment_end_date == null) { %>
            --- <% } else { %> <%=emp.employment_end_date%> <% } %> <br>
            Employee Phone Number: <%=emp.phone_number %>"> <br>
            <input type="submit" value="Submit">
        </form> 
    </body>
</html>