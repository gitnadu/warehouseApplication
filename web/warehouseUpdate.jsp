<%-- 
    Document   : warehouseUpdate
    Created on : 11 18, 23, 10:17:56 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
    </head>
    <body>
        <h2> Update Employee </h2>
        <form action="warehouseUpdateForm.jsp"> 
            <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
            Supplier ID: <select id="warehouse_idU" name="warehouse_idU"> 
            <%  ware.get_functional_warehouses();
                for(int i=0;i<ware.warehouse_IDList.size();i++){
            %>
            <option value="<%=ware.warehouse_IDList.get(i) %>" > <%=ware.warehouse_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
