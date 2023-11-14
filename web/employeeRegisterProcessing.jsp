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
    </head>
    <body>
        <jsp:useBean id="obj" class="invEmpMgmt.inventoryEmployee" scope="session" />
        <%
            obj.last_name  = request.getParameter("employee_lastname");
            obj.first_name = request.getParameter("employee_firstname");
            obj.middle_name = request.getParameter("employee_middlename");
            obj.permanent_address = request.getParameter("employee_permaddress");
            obj.current_address = request.getParameter("employee_currddress");
            obj.gender = request.getParameter("employee_gender");
            obj.birthday_temporary = request.getParameter("employee_birthday");
            obj.email_address = request.getParameter("employee_emailadd");
            obj.phone_number = request.getParameter("employee_phonenumber");
            int status = obj.register_employee();
            if (status==1) {
                %>
                <h1>Registering Inventory Employee Successful </h1>
                <% 
            } else { 
                %>
                <h1>Registering Inventory Employee Unsuccessful </h1>
            <% } 
        %>
    </body>
</html>
