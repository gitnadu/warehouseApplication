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
        <title>Update Employee Check</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h1>Double Check Changes</h1>
        <hr><br>

        <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeUpdateProcessing.jsp"> 
            <%  emp.last_name_holder  = request.getParameter("employee_lastnameU");
                emp.first_name_holder = request.getParameter("employee_firstnameU");
                emp.middle_name_holder = request.getParameter("employee_middlenameU");
                emp.permanent_address_holder = request.getParameter("employee_permaddressU");
                emp.current_address_holder = request.getParameter("employee_currddressU");
                emp.gender_holder = request.getParameter("employee_genderU");
                
                emp.birthday_temporary_holder = request.getParameter("employee_birthdayU");  

                emp.email_address_holder = request.getParameter("employee_emailaddU");
                emp.phone_number_holder = request.getParameter("employee_phonenumberU");
                emp.employment_end_date_temporary = request.getParameter("employee_enddateU");
                emp.get_employee_record();
                
            %>
            
            <table style = "width: 100%">
                <h2>Original Details:</h2>
                <tr>
                    <td> Last Name </td>
                    <td> First Name </td>
                    <td> Middle Name </td>
                    <td> Permanent Address </td>
                    <td> Current Address </td>
                    <td> Gender </td>
                    <td> Birthday </td>
                    <td> Phone Number </td>
                    <td> Employment Start Date </td>
                    <td> Employment End Date </td>
                </tr>
                </tr>
                    <tr> 
                     <td> <%=emp.last_name%> </td>
                     <td><%=emp.first_name%> </td>
                     <td><%=emp.middle_name %> </td>
                     <td><%=emp.permanent_address%> </td>
                     <td><%=emp.current_address %> </td>
                     <td><%=emp.gender %>  </td>
                     <td><%=emp.birthday %> </td>
                     <td><%=emp.phone_number %> </td>
                     <td><%=emp.employment_start_date %> </td>
                     <td><%=emp.employment_end_date %> </td>
                    <tr>
            </table>
                    
            <hr class = "short">

            <table style = "width: 100%">
                <h2> New Details: </h2>
                <tr> 
                    <td> Last Name </td>
                    <td> First Name </td>
                    <td> Middle Name </td>
                    <td> Permanent Address </td>
                    <td> Current Address </td>
                    <td> Gender </td>
                    <td> Birthday </td>
                    <td> Phone Number </td>
                    <td> Employment Start Date </td>
                    <td> Employment End Date </td>
                </tr>
                    <tr> 
                     
                     <td> <%=emp.last_name_holder%> </td>
                     <td><%=emp.first_name_holder%> </td>
                     <td><%=emp.middle_name_holder %> </td>
                     <td><%=emp.permanent_address_holder%> </td>
                     <td><%=emp.current_address_holder %> </td>
                     <td><%=emp.gender_holder %>  </td>
                     <td><%=emp.birthday_holder %> </td>
                     <td><%=emp.phone_number_holder %> </td>
                     <td><%=emp.employment_start_date %> </td>
                     <td><%=emp.employment_end_date_temporary %> </td>
                    <tr>
            </table>
                    <input type="submit" value="Save Changes"><br><br>
        </form>
        <button onclick = "window.location.href = 'employeeUpdate.jsp';"> Return </button>
        
        
    </body>
</html>