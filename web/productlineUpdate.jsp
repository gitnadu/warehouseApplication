<%-- 
    Document   : productlineUpdate
    Created on : 11 20, 23, 6:24:49 PM
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
        <h2> Update Employee </h2>
        <form action="employeeUpdateForm.jsp"> 
            <jsp:useBean id="emp" class="invEmpMgmt.employee" scope="session" />
            Employee ID: <select id="employee_idU" name="employee_idU" required> 
            <option value="" > </option>
            <%  emp.get_employees();
                for(int i=0;i<emp.employee_IDList.size();i++){
            %>
            <option value="<%=emp.employee_IDList.get(i) %>" > <%=emp.employee_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
