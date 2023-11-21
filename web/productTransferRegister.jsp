<%-- 
    Document   : productTransferRegister
    Created on : 11 22, 23, 12:05:29 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product Line</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>View a Product Line</h2>
        <hr><br>
        
        <form action="productLineViewProcessing.jsp"> 
            <jsp:useBean id="transfer" class="productMgmt.product_line" scope="session" />
            Warehouse Origin ID <select id="transfer_warehouse" name="transfer_warehouse"> 
                <option value=""> </option>
            <%  transfer.get_warehouses();
                for(int i=0;i<transfer.transfer_warehouse_origin_ID_list.size();i++){
            %>
            <option value="<%=transfer.transfer_warehouse_origin_ID_list.get(i) %>" > <%=transfer_warehouse_origin_ID_list.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
        <button onclick = "window.location.href = 'stockTransfer.html';">Cancel</button>
    </body>
</html>  
