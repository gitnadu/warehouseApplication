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
        <title>View Warehouse Record</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Success! Viewing Warehouse Record..</h2>
        <hr><br>
        
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        
        <% 
            String temp = request.getParameter("warehouse_idV");
            ware.warehouse_ID = Integer.valueOf(temp); 
            int status = ware.get_warehouse_record();
            if (status == 1){
        %>
        <form action="warehouseView.jsp"> 
            
            <table>
                <tr><td>Warehouse ID: </td>
                <td><%=ware.warehouse_ID %> </td></tr>
                
                <tr><td>Warehouse Phone Number: </td>
                <td><%=ware.warehouse_phonenumber %></td></tr>
                
                <tr><td>Warehouse Name: </td>
                <td><%=ware.warehouse_name %></td></tr>
                
                <tr><td>Warehouse First Address: </td>
                <td><%=ware.warehouse_address %> </td></tr>
                
                <tr><td>Warehouse Max Row: </td>
                <td><%=ware.warehouse_maxrow%></td></tr>
                
                <tr><td>Warehouse Max Bay: </td>
                <td><%=ware.warehouse_maxbay %> </td></tr>
                
                <tr><td>Warehouse Max Level: </td>
                <td><%=ware.warehouse_maxlevel %> </td></tr>
                
                <tr><td>Warehouse Max Bin: </td>
                <td><%=ware.warehouse_maxbinNumber %> </td></tr>
            </table><br>
            
            <input type="submit" value="View Again"><br><br>
        </form> 
            <button onclick = "window.location.href = 'warehouse.html';"> Back to Menu </button>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        
    </body>
</html>

