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
        <title>Search Inventory Employee Results</title>
    </head>
    <body>
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
            <h1> Search Inventory Employee Results </h1>
            <table>
                <tr> 
                    <th> Last Name </th> &nbsp;
                    <th> First Name </th> &nbsp;
                    <th> Middle Name </th> &nbsp;
                    <th> Permanent Address </th> &nbsp;
                    <th> Current Address </th> &nbsp;
                    <th> Gender </th> &nbsp;
                    <th> Birthday </th> &nbsp;
                    <th> Employment Start Date </th> &nbsp;
                    <th> Employment End Date </th> &nbsp;
                </tr>
                    <% 
                       for(int i=0;i<emp.search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=emp.last_nameList.get(i) %> </td> &nbsp;
                        <td><%=emp.first_nameList.get(i) %> </td> &nbsp;
                        <td><%=emp.middle_nameList.get(i) %></td>&nbsp;
                        <td><%=emp.permanent_addressList.get(i) %> </td>&nbsp;
                        <td><%=emp.current_addressList.get(i) %> </td>&nbsp;
                        <td><%=emp.genderList.get(i) %>  </td>&nbsp;
                        <td><%=emp.birthdayList.get(i) %> </td>&nbsp;
                        <td><%=emp.employment_start_dateList.get(i) %></td>&nbsp;
                        <td><%=emp.employment_end_dateList.get(i) %></td> &nbsp;
                       <tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>Search Failed </h1>
            <% } %>
           <input type="submit" value="Search Again">
        </form>
        <button onclick = "window.location.href = 'employee.html';"> Back to Main Menu </button>
    </body>
</html>
