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
        <title>Update Warehouse</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Update a Warehouse</h2>
        <hr><br>
        
       <form action="warehouseUpdateForm.jsp"> 
            <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
            Warehouse ID: <select id="warehouse_idU" name="warehouse_idU"> 
            <%  ware.get_warehouses();
                for(int i=0;i<ware.warehouse_IDList.size();i++){
            %>
            <option value="<%=ware.warehouse_IDList.get(i) %>" > <%=ware.warehouse_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'warehouse.html';">Cancel</button>
    </body>
</html>
