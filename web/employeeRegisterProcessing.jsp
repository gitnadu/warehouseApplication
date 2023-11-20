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
    <body><center>
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
                <hr>
                <% if (emp.job_title.equals("Worker")){ %>
                <h2>The new employee's worker ID is <%=emp.employee_ID %>.</h2> <% } else { %>
                <h2>The new employee's manager ID is <%=emp.employee_ID %>.</h2> <% } %>
                <br><br>
                <table>
                    <tr>
                        <td>New Employee ID:</td>
                        <td><%=emp.employee_ID %></td>
                    </tr>
                    <tr>
                        <td>New Employee First Name:</td>
                        <td><%=emp.first_name %></td>
                    </tr>
                    <tr>
                        <td>New Employee Last Name:</td>
                        <td><%=emp.last_name %></td>
                    </tr>
                    <tr>
                        <td>New Employee Middle Name:</td>
                        <td><%=emp.middle_name %></td>
                    </tr>
                    <tr>
                        <td>New Employee Permanent Address:</td>
                        <td><%=emp.permanent_address %></td>
                    </tr>
                    <tr>
                        <td>New Employee Current Address:</td>
                        <td><%=emp.current_address %></td>
                    </tr>
                    <tr>
                        <td>New Employee Gender:</td>
                        <td><%=emp.gender %></td>
                    </tr>
                    <tr>
                        <td>New Employee Birthday:</td>
                        <td><%=emp.birthday%></td>
                    </tr>
                    <tr>
                        <td>New Employee Email Address:</td>
                        <td><%=emp.email_address %></td>
                    </tr>
                    <tr>
                        <td>New Employee Phone Number:</td>
                        <td><% if(emp.phone_number.length() == 10) {%> 0<%=emp.phone_number%> <% } else {%> <%=emp.phone_number%> <%} %></td>
                    </tr>
                    <tr>
                        <td>New Employee Start of Employment Date:</td>
                        <td><%=emp.employment_start_date %></td>
                    </tr>
                    <tr>
                        <td>New Employee End of Employment Date:</td>
                        <td><% if (emp.employment_end_date == null) { %> 
                --- <% } %></td>
                    </tr>
                </table><br><br>
                
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
