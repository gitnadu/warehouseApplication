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
                obj.last_name_holder  = request.getParameter("employee_lastnameV");
                obj.first_name_holder = request.getParameter("employee_firstnameV");
                obj.middle_name_holder = request.getParameter("employee_middlenameV");
                obj.permanent_address_holder = request.getParameter("employee_permaddressV");
                obj.current_address_holder = request.getParameter("employee_currddressV");
                obj.gender_holder = request.getParameter("employee_genderV");
                
                obj.birthday_temporary = request.getParameter("employee_birthdayV");
                obj.employment_start_date_temporary = request.getParameter("employee_startdateV");
                // obj.employment_end_date_temporary = request.getParameter("employee_enddateV");
                int status = obj.search_employees();
                if (status == 1){
            %>
            <h1> Search Results </h1>
            <ins> First Name &nbsp; First Name &nbsp; Middle Name &nbsp; Permanent Address &nbsp;
                Current Address &nbsp; Gender &nbsp; Birthday &nbsp; Employment Start Date &nbsp;&nbsp; Employment End Date </ins><br>
            <% 
               for(int i=0;i<obj.search_count;i++)
               { %>
               <%=obj.last_nameList.get(i) %> &nbsp;
               <%=obj.first_nameList.get(i) %> &nbsp;
               <%=obj.middle_nameList.get(i) %> &nbsp;
               <%=obj.permanent_addressList.get(i) %> &nbsp;
               <%=obj.current_addressList.get(i) %> &nbsp;
               <%=obj.genderList.get(i) %> &nbsp; 
               <%=obj.birthdayList.get(i) %> &nbsp;
               <%=obj.employment_start_dateList.get(i) %> &nbsp;
               <%=obj.employment_end_dateList.get(i) %> &nbsp; <br>
            %>
            <% } } else { %>
            <h1>Search Failed </h1>
            <% } %>
           
        </form>
        <input type="submit" value="Return too Menu">
    </body>
</html>
