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
        <title>Search Employee</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h1>Search Results:</h1>
        <hr><br>
        
       <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
        <form action="employeeSearch.html"> 
     
            <% 
                emp.last_name_holder  = request.getParameter("employee_lastnameS");
                emp.first_name_holder = request.getParameter("employee_firstnameS");
                emp.middle_name_holder = request.getParameter("employee_middlenameS");
                emp.permanent_address_holder = request.getParameter("employee_permaddressS");
                emp.current_address_holder = request.getParameter("employee_currddressS");
                emp.gender_holder = request.getParameter("employee_genderS");
                emp.birthday_temporary_holder = request.getParameter("employee_birthdayS");

                int status = emp.search_employees();
                if (status == 1){
            %>
            <table>
                <tr> 
                    <td> Last Name </td> 
                    <td> First Name </td> 
                    <td> Middle Name </td> 
                    <td> Permanent Address </td> 
                    <td> Current Address </td> 
                    <td> Gender </td> 
                    <td> Birthday </td> 
                    <td> Employment Start Date </td> 
                    <td> Employment End Date </td> 
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                    <% 
                       for(int i=0;i<emp.search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=emp.last_nameList.get(i) %> </td> 
                        <td><%=emp.first_nameList.get(i) %> </td> 
                        <td><%=emp.middle_nameList.get(i) %></td>
                        <td><%=emp.permanent_addressList.get(i) %> </td>
                        <td><%=emp.current_addressList.get(i) %> </td>
                        <td><%=emp.genderList.get(i) %>  </td>
                        <td><%=emp.birthdayList.get(i) %> </td>
                        <td><%=emp.employment_start_dateList.get(i) %></td>
                        <td><%=emp.employment_end_dateList.get(i) %></td> 
                       <tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>There is no record that matches your search query..</h1>
            <% } %>
           <input type="submit" value="Search Again">
        </form>
        <button onclick = "window.location.href = 'employee.html';"> Back to Menu </button>
    </body>
</html>
