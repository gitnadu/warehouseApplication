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
        <title>Update Inventory Employee Form</title>
    </head>
    <body>
        <h2> Update Inventory Employee Form </h2>
        <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
        
        <% 
            String temp = request.getParameter("employee_idU");
            obj.employee_ID = Integer.valueOf(temp); 
            int status = obj.get_employee_record();
            if (status == 1){
        %>
        <% } else { %>
        <% } %>
        <form action="employeeUpdateCheck.jsp"> 
            Employee First Name: <input type="text" id ="employee_firstnameU" name="employee_firstnameU" value="<%=obj.first_name %>">  <br>
            Employee Last Name: <input type="text" id ="employee_lastnameU" name="employee_lastnameU" value="<%=obj.last_name %>" > <br>
            Employee Middle Name: <input type="text" id ="employee_middlenameU" name="employee_middlenameU" value="<%=obj.middle_name %>" >  <br>
            Employee Permanent Address: <input type="text" id ="employee_permaddressU" name="employee_permaddressU" value="<%=obj.permanent_address %> "><br>
            Employee Current Address:  <input type="text" id ="employee_currddressU" name="employee_currddressU" value="<%=obj.current_address %>"> <br>
            Employee Gender: <select id="employee_genderU" name="employee_genderU">
                <% if (obj.gender.equals("M")){ %>
                <option value ="<%=obj.gender %>"> M </option>
                <option value ="F"> F </option>
                <% } else { %>
                <option value ="<%=obj.gender %>"> F </option>
                <option value ="M"> M </option>
                
                <% } %>
            </select> <br>
            Employee Birthday:<input type="date" id ="employee_birthdayU" name="employee_birthdayU" value="<%=obj.birthday%>" > <br>
            Employee Email Address: <input type="text" id ="employee_emailaddU" name="employee_emailaddU" value="<%=obj.email_address %>">  <br>
            Employee End Date: <input type="date" id ="employee_enddateU" name="employee_enddateU" value==<%=obj.employment_end_date %>" > <br>

            Employee Phone Number: <input type="number" id ="employee_phonenumberU" name="employee_phonenumberU" value="<%=obj.phone_number %>" min="1000000000" max="9999999999" > <br>
            <br> <input type="submit" value="Next">
        </form> 
        <br>
        <button onclick = "window.location.href = 'employee.html';"> Cancel Update </button>
    </body>
</html>
