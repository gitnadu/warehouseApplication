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
    </head>
    <body>
        <h2> Register Inventory Employee Form </h2>
        <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
        
        <% 
            
            String temp = request.getParameter("employee_idU");
            obj.employee_ID = Integer.valueOf(temp); 
            int status = obj.get_employee_record();
            if (status == 1){
        %>
        <h2> Success </h2>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        <form action="employeeUpdateProcessing.jsp"> 
            Employee First Name: <input type="text" id ="employee_firstnameU" name="employee_firstnameU" value="<%=obj.first_name %>"> <%=obj.first_name %>  <br>
            Employee Last Name: <input type="text" id ="employee_lastnameU" name="employee_lastnameU" value="<%=obj.last_name %>"> <br>
            Employee Middle Name: <input type="text" id ="employee_middlenameU" name="employee_middlenameU" value="<%=obj.middle_name %>">  <br>
            Employee Permanent Address: <input type="text" id ="employee_permaddressU" name="employee_permaddressU" value="<%=obj.permanent_address %>" ><br>
            Employee Current Address:  <input type="text" id ="employee_currddressU" name="employee_currddressU" value="<%=obj.current_address %>"> <br>
            Employee Gender: <select id="employee_genderU" name="employee_genderU" value=" <%=obj.gender %>">
                <option value ="M"> M </option>
                <option value ="F"> F </option>
            </select> <br>
            Employee Birthday:<input type="date" id ="employee_birthdayU" name="employee_birthdayU" value="<%=obj.birthday%>"> <%=new SimpleDateFormat("yyyy-MM-dd").format(obj.birthday)%><br>
            Employee Email Address: <input type="text" id ="employee_emailaddU" name="employee_emailaddU" value="<%=obj.email_address %>">  <br>
            Employee Phone Number: <input type="text" id ="employee_phonenumberU" name="employee_phonenumberU" value="<%=obj.phone_number %>"> <br>
            <input type="submit" value="Submit">
        </form> 
    </body>
</html>