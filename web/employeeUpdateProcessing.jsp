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
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeUpdateProcessing.jsp"> 
            <%= obj.birthday %>
            <% 
                obj.last_name  = request.getParameter("employee_lastnameU");
                obj.first_name = request.getParameter("employee_firstnameU");
                obj.middle_name = request.getParameter("employee_middlenameU");
                obj.permanent_address = request.getParameter("employee_permaddressU");
                obj.current_address = request.getParameter("employee_currddressU");
                obj.gender = request.getParameter("employee_genderU");
                
                obj.birthday_temporary = request.getParameter("employee_birthdayU");  

                obj.email_address = request.getParameter("employee_emailaddU");
                obj.phone_number = request.getParameter("employee_phonenumberU");
                int status = obj.update_employee();
                if (status == 1){
            %>
            <h1>Updating Inventory Employee Successful </h1>
            <% } else { %>
            <h1>Updating Inventory Employee Unsuccessful </h1>
            <% } %>
            

        
        </form>
        <input type="submit" value="Return too Menu">
    </body>
</html>
