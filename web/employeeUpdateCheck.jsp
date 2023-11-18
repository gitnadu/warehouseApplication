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
    </head>
    <body>
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
            
            <table>
                <th> OLD RECORD
                <tr> 
                    <th> Last Name </th> &nbsp;
                    <th> First Name </th> &nbsp;
                    <th> Middle Name </th> &nbsp;
                    <th> Permanent Address </th> &nbsp;
                    <th> Current Address </th> &nbsp;
                    <th> Gender </th> &nbsp;
                    <th> Birthday </th> &nbsp;
                    <th> Phone Number </th> &nbsp;
                    <th> Employment Start Date </th> &nbsp;
                    <th> Employment End Date </th> &nbsp;
                </tr>
                    <tr> 
                     <td> <%=emp.last_name%> </td> &nbsp;
                     <td><%=emp.first_name%> </td> &nbsp;
                     <td><%=emp.middle_name %> </td>&nbsp;
                     <td><%=emp.permanent_address%> </td>&nbsp;
                     <td><%=emp.current_address %> </td>&nbsp;
                     <td><%=emp.gender %>  </td>&nbsp;
                     <td><%=emp.birthday %> </td>&nbsp;
                     <td><%=emp.phone_number %> </td>&nbsp;
                     <td><%=emp.employment_start_date %> </td>&nbsp;
                     <td><%=emp.employment_end_date %> </td> &nbsp;
                    <tr>
            </table>
                    
                    <br>
            <table>
                <th> NEW RECORD </th>
                <tr> 
                    <th> Last Name </th> &nbsp;
                    <th> First Name </th> &nbsp;
                    <th> Middle Name </th> &nbsp;
                    <th> Permanent Address </th> &nbsp;
                    <th> Current Address </th> &nbsp;
                    <th> Gender </th> &nbsp;
                    <th> Birthday </th> &nbsp;
                    <th> Phone Number </th> &nbsp;
                    <th> Employment Start Date </th> &nbsp;
                    <th> Employment End Date </th> &nbsp;
                </tr>
                    <tr> 
                     
                     <td> <%=emp.last_name_holder%> </td> &nbsp;
                     <td><%=emp.first_name_holder%> </td> &nbsp;
                     <td><%=emp.middle_name_holder %> </td>&nbsp;
                     <td><%=emp.permanent_address_holder%> </td>&nbsp;
                     <td><%=emp.current_address_holder %> </td>&nbsp;
                     <td><%=emp.gender_holder %>  </td>&nbsp;
                     <td><%=emp.birthday_holder %> </td>&nbsp;
                     <td><%=emp.phone_number_holder %> </td>&nbsp;
                     <td><%=emp.employment_start_date %> </td>&nbsp;
                     <td><%=emp.employment_end_date_temporary %> </td> &nbsp;
                    <tr>
            </table>
            <input type="submit" value="Save changes">
        </form>
        <button onclick = "window.location.href = 'employeeUpdate.jsp';"> Return </button>
        
        
    </body>
</html>
