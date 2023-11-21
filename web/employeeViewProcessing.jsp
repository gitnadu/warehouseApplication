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
        <title>Update Employee</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h1>View an Employee</h1>
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
        <form action="employeeView.jsp"> 
            <table>
                <tr>
                    <td>Employee First Name:</td>
                    <td><%=emp.first_name %></td>
                </tr>
                <tr>
                    <td>Employee Last Name:</td>
                    <td><%=emp.last_name %></td>
                </tr>
                <tr>
                    <td>Employee Middle Name:</td>
                    <td><%=emp.middle_name %></td>
                </tr>
                <tr>
                    <td>Employee Middle Name:</td>
                    <td><%=emp.middle_name %></td>
                </tr>

                <tr>
                    <td>Employee Permanent Address:</td>
                    <td><%=emp.permanent_address %></td>
                </tr>

                <tr>
                    <td>Employee Current Address:</td>
                    <td><%=emp.current_address %></td>
                </tr>

                <tr>
                    <td>Employee Gender:</td>
                    <td><%=emp.gender %></td>
                </tr>

                <tr>
                    <td>Employee Birthday:</td>
                    <td><%=emp.birthday%></td>
                </tr>

                <tr>
                    <td>Employee Email Address:</td>
                    <td><%=emp.email_address %> </td>
                </tr>

                <tr>
                    <td>Employee Start of Employment Date:</td>
                    <td><%=emp.employment_start_date %> </td>
                </tr>

                <tr>
                    <td>Employee End of Employment Date: </td>
                    <td>
                        <% if (emp.employment_end_date == null) { %>
                        --- <% } else { %> <%=emp.employment_end_date%> <% } %>
                    </td>
                </tr>

                <tr>
                    <td>Employee Phone Number: </td>
                    <td><%=emp.phone_number %></td>
                </tr>

            </table><br>
            <input type="submit" value="View Again"><br><br>
        </form>
        <button onclick = "window.location.href = 'employee.html';">Go Home</button>
    </body>
</html>