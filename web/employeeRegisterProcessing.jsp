<%-- 
    Document   : registerInventoryEmployee_processing
    Created on : 11 14, 23, 12:04:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, invEmpMgmt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Inventory Employee Processing</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        <%
            emp.last_name  = request.getParameter("employee_lastname");
            emp.first_name = request.getParameter("employee_firstname");
            emp.middle_name = request.getParameter("employee_middlename");
            emp.permanent_address = request.getParameter("employee_permaddress");
            emp.current_address = request.getParameter("employee_currddress");
            emp.gender = request.getParameter("employee_gender");
            emp.birthday_temporary = request.getParameter("employee_birthday");
            emp.email_address = (request.getParameter("employee_emailadd")).toLowerCase();
            emp.phone_number = request.getParameter("employee_phonenumber");
            emp.job_title = request.getParameter("employee_jobtitle"); 
            emp.employee_warehouse_ID_temporary = request.getParameter("employee_warehouseID");
            
            int status = emp.register_employee();
            if (status==1) {
                %>
                <h1>You have successfully registered a new inventory employee!</h1>
                <% if (emp.job_title.equals("Worker")){ %>
                <h2>The new employee's worker ID is <%=emp.employee_ID %></h2> <% } else { %>
                <h2>The new employee's manager ID is <%=emp.employee_ID %></h2> <% } %>
                <br><br>
                New Employee Employee ID: <%=emp.employee_ID %>  <br><br>
                New Employee First Name: <%=emp.first_name %>  <br><br>
                New Employee Last Name: <%=emp.last_name %> <br><br>
                New Employee Middle Name: <%=emp.middle_name %> <br><br>
                New Employee Permanent Address: <%=emp.permanent_address %> <br><br>
                New Employee Current Address:  <%=emp.current_address %> <br><br>
                New Employee Gender:<%=emp.gender %> <br><br>
                New Employee Birthday:<%=emp.birthday%> <br><br>
                New Employee Email Address: <%=emp.email_address %>  <br><br>
                New Employee Phone Number: <% if(emp.phone_number.length() == 10) {%> 0<%=emp.phone_number%> <% } else {%> <%=emp.phone_number%> <%} %> <br><br>
                New Employee Start of Employment Date: <%=emp.employment_start_date %>  <br><br>
                New Employee End of Employment Date: 
                <% if (emp.employment_end_date == null) { %> 
                --- <% } %> <br><br>
                
                <button onclick = "window.location.href = 'employee.html';"> Back to Employee Menu </button>
                <button onclick = "window.location.href = 'employeeRegister.jsp';"> Register Another Employee </button>
                <% 
            } else { 
                %>
                <h1>The register has been unsuccessful..</h1>
                <button onclick = "window.location.href = 'employee.html';"> Back to Employee Menu </button>
                <button onclick = "window.location.href = 'employeeRegister.jsp';"> Retry </button>
            <% } 
        %>
    </body>
</html>
