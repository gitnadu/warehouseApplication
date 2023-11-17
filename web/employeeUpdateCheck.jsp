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
        <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeUpdateProcessing.jsp"> 
            <%  obj.last_name_holder  = request.getParameter("employee_lastnameU");
                obj.first_name_holder = request.getParameter("employee_firstnameU");
                obj.middle_name_holder = request.getParameter("employee_middlenameU");
                obj.permanent_address_holder = request.getParameter("employee_permaddressU");
                obj.current_address_holder = request.getParameter("employee_currddressU");
                obj.gender_holder = request.getParameter("employee_genderU");
                
                obj.birthday_temporary_holder = request.getParameter("employee_birthdayU");  

                obj.email_address_holder = request.getParameter("employee_emailaddU");
                obj.phone_number_holder = request.getParameter("employee_phonenumberU");
                obj.employment_end_date_temporary = request.getParameter("employee_enddateU");
                obj.get_employee_record();
                
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
                     
                     <td> <%=obj.last_name%> </td> &nbsp;
                     <td><%=obj.first_name%> </td> &nbsp;
                     <td><%=obj.middle_name %> </td>&nbsp;
                     <td><%=obj.permanent_address%> </td>&nbsp;
                     <td><%=obj.current_address %> </td>&nbsp;
                     <td><%=obj.gender %>  </td>&nbsp;
                     <td><%=obj.birthday %> </td>&nbsp;
                     <td><%=obj.employment_start_date %> </td>&nbsp;
                     <td><%=obj.employment_end_date %> </td> &nbsp;
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
                     
                     <td> <%=obj.last_name_holder%> </td> &nbsp;
                     <td><%=obj.first_name_holder%> </td> &nbsp;
                     <td><%=obj.middle_name_holder %> </td>&nbsp;
                     <td><%=obj.permanent_address_holder%> </td>&nbsp;
                     <td><%=obj.current_address_holder %> </td>&nbsp;
                     <td><%=obj.gender_holder %>  </td>&nbsp;
                     <td><%=obj.birthday_holder %> </td>&nbsp;
                     <td><%=obj.employment_start_date %> </td>&nbsp;
                     <td><%=obj.employment_end_date_temporary %> </td> &nbsp;
                    <tr>
            </table>
            <input type="submit" value="Save changes">
        </form>
        <button onclick = "window.location.href = 'employeeUpdate.jsp';"> Return </button>
        
        
    </body>
</html>
