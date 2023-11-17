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
     
            <% 
                obj.last_name_holder  = request.getParameter("employee_lastnameS");
                obj.first_name_holder = request.getParameter("employee_firstnameS");
                obj.middle_name_holder = request.getParameter("employee_middlenameS");
                obj.permanent_address_holder = request.getParameter("employee_permaddressS");
                obj.current_address_holder = request.getParameter("employee_currddressS");
                obj.gender_holder = request.getParameter("employee_genderS");
                obj.birthday_temporary_holder = request.getParameter("employee_birthdayS");

                int status = obj.search_employees();
                if (status == 1){
            %>
            <h1> Search Results </h1>
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
                       for(int i=0;i<obj.search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=obj.last_nameList.get(i) %> </td> &nbsp;
                        <td><%=obj.first_nameList.get(i) %> </td> &nbsp;
                        <td><%=obj.middle_nameList.get(i) %></td>&nbsp;
                        <td><%=obj.permanent_addressList.get(i) %> </td>&nbsp;
                        <td><%=obj.current_addressList.get(i) %> </td>&nbsp;
                        <td><%=obj.genderList.get(i) %>  </td>&nbsp;
                        <td><%=obj.birthdayList.get(i) %> </td>&nbsp;
                        <td><%=obj.employment_start_dateList.get(i) %></td>&nbsp;
                        <td><%=obj.employment_end_dateList.get(i) %></td> &nbsp;
                       <tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>Search Failed </h1>
            <% } %>
            <%=obj.temp_employeeIDList.size() %>
           
        </form>
        <input type="submit" value="Return too Menu">
    </body>
</html>
