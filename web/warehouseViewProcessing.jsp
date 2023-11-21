<%-- 
    Document   : warehouseViewProcessing
    Created on : 11 18, 23, 11:13:31 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewing Warehouse Record</title>
    </head>
    <body>
        <h2> Viewing Warehouse Record </h2>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        
        <% 
            String temp = request.getParameter("warehouse_idV");
            ware.warehouse_ID = Integer.valueOf(temp); 
            int status = ware.get_warehouse_record();
            if (status == 1){
        %>
        <form action="warehouseView.jsp"> 
            Warehouse ID: <%=ware.warehouse_ID %>  <br><br>
            Warehouse Phone Number: <%=ware.warehouse_phonenumber %> <br>
            Warehouse Name: <%=ware.warehouse_name %> <br>
            Warehouse First Address: <%=ware.warehouse_address %>  <br>
            Warehouse Max Row: <%=ware.warehouse_maxrow%> <br>
            Warehouse Max Bay: <%=ware.warehouse_maxbay %>  <br>
            Warehouse Max Level: <%=ware.warehouse_maxlevel %>  <br>
            Warehouse Max Bin: <%=ware.warehouse_maxbinNumber %>  <br>
            <input type="submit" value="View again">
        </form> 
            <button onclick = "window.location.href = 'index.html';"> Back to Main Menu </button>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        
    </body>
</html>

