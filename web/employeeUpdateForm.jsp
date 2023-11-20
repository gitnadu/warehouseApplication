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
        <h1>Update an Employee</h1>
        <hr><br>
        
       <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        
        <% 
            String temp = request.getParameter("employee_idU");
            emp.employee_ID = Integer.valueOf(temp); 
            int status = emp.get_employee_record();
            if (status == 1){
        %>
        <% } else { %>
        <% } %>
        <form action="employeeUpdateCheck.jsp"> 
            <table>    
                <tr>
                    <td>Employee First Name: </td>
                    <td><input type="text" id ="employee_firstnameU" name="employee_firstnameU" value="<%=emp.first_name %>"></td>
                </tr>
                <tr>
                    <td>Employee Last Name: </td>
                    <td><input type="text" id ="employee_lastnameU" name="employee_lastnameU" value="<%=emp.last_name %>" ></td>
                </tr>
                <tr>
                    <td>Employee Middle Name: </td>
                    <td><input type="text" id ="employee_middlenameU" name="employee_middlenameU" value="<%=emp.middle_name %>" ></td>
                </tr>
                <tr>
                    <td>Employee Permanent Address:</td>
                    <td><input type="text" id ="employee_permaddressU" name="employee_permaddressU" value="<%=emp.permanent_address %> "></td>
                </tr>
                <tr>
                    <td>Employee Current Address: </td>
                    <td><input type="text" id ="employee_currddressU" name="employee_currddressU" value="<%=emp.current_address %>"></td>
                </tr>
                <tr>
                    <td>Employee Gender: </td>
                    <td><select id="employee_genderU" name="employee_genderU">
                    <% if (emp.gender.equals("M")){ %>
                    <option value ="<%=emp.gender %>"> M </option>
                    <option value ="F"> F </option>
                    <% } else { %>
                    <option value ="<%=emp.gender %>"> F </option>
                    <option value ="M"> M </option>

                    <% } %>
                    </select> </td>
                </tr>
                <tr>
                <td>Employee Birthday:</td>
                <td><input type="date" id ="employee_birthdayU" name="employee_birthdayU" value="<%=emp.birthday%>" ></td>
                </tr>
                <tr>
                    <td>Employee Email Address:</td> 
                    <td><input type="text" id ="employee_emailaddU" name="employee_emailaddU" value="<%=emp.email_address %>">  </td>
                </tr>
                <tr>
                    <td>Employee End Date: </td>
                    <td><input type="date" id ="employee_enddateU" name="employee_enddateU" value==<%=emp.employment_end_date %>" > </td>
                </tr>

                <tr>
                    <td>Employee Phone Number: </td>
                    <td><input type="number" id ="employee_phonenumberU" name="employee_phonenumberU" value="<%=emp.phone_number %>" min="1000000000" max="9999999999" > </td>
                </tr>
            </table>
            <br> <input type="submit" value="Next">
        </form> 
        <br>
        <button onclick = "window.location.href = 'employee.html';"> Cancel Update </button>
    </body>
</html>
