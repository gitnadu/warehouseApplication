<%-- 
    Document   : employeeUpdate
    Created on : 11 15, 23, 12:32:26 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
    </head>
    <body>
        <h2> Delete Employee </h2>
        <form action="employeeDeleteForm.jsp"> 
            <jsp:useBean id="obj" class="invEmpMgmt.employee" scope="session" />
            Employee ID: <select id="employee_idD" name="employee_idD"> 
            <%  obj.get_employees();
                for(int i=0;i<obj.employee_IDList.size();i++){
            %>
            <option value="<%=obj.employee_IDList.get(i) %>" > <%=obj.employee_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
