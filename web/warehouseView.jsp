<%-- 
    Document   : warehouseView
    Created on : 11 18, 23, 11:13:11 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Warehouse</title>
    </head>
    <body>
        <h2> View Warehouse </h2>
        <form action="warehouseViewProcessing.jsp"> 
            <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
            Employee ID: <select id="warehouse_idV" name="warehouse_idV"> 
            <%  ware.get_warehouses(); 
                for(int i=0;i<ware.warehouse_IDList.size();i++){
            %>
            <option value="<%=ware.warehouse_IDList.get(i) %>" > <%=ware.warehouse_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
