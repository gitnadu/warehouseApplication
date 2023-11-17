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
        <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
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
            obj.job_title = request.getParameter("employee_jobtitle");
            
            int status = obj.register_employee();
            if (status==1) {
                %>
                <h1>Registering Inventory Employee Successful </h1>
                <% if (obj.job_title.equals("Worker")){ %>
                <h2> Newly Added Worker! </h2> <% } else { %>
                        <h2> Newly Added Manager! </h2> <% } %>
                <br>
                New Employee Employee ID: <%=obj.employee_ID %>  <br><br>
                New Employee First Name: <%=obj.first_name %>  <br>
                New Employee Last Name: <%=obj.last_name %> <br>
                New Employee Middle Name: <%=obj.middle_name %>  <br>
                New Employee Permanent Address: <%=obj.permanent_address %> <br>
                New Employee Current Address:  <%=obj.current_address %> <br>
                New Employee Gender:<%=obj.gender %> <br>
                New Employee Birthday:<%=obj.birthday%> <br>
                New Employee Email Address: <%=obj.email_address %>  <br>
                New Employee Start of Employment Date: <%=obj.employment_start_date %>  <br>
                New Employee End of Employment Date: 
                <% if (obj.employment_end_date == null) { %>
                --- <% } %>
                
                <button onclick = "window.location.href = 'employeeRegister.html';"> Again </button>
                <% 
            } else { 
                %>
                <h1>Registering Inventory Employee Unsuccessful </h1>
                <button onclick = "window.location.href = 'employeeRegister';"> Again </button>
            <% } 
        %>
    </body>
</html>
