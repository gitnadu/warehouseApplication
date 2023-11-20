<%-- 
    Document   : supplierViewProcessing
    Created on : 11 18, 23, 8:04:20 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewing Product</title>
    </head>
    <body>
        <h2>View Product</h2>
        <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
        
        <% 
            String temp = request.getParameter("product_idV");
            prod.product_product_ID = Integer.parseInt(temp); 
            int status = prod.get_product_record();
            if (status == 1){
        %>
        <h2> Success </h2>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        <form action="productView.jsp"> 
    
            Product Warehouse ID: <td><%=prod.product_warehouse_ID%></td><br><br>
            Product Date Received: <td><%=prod.product_date_received%></td><br><br>
            Product Line ID: <td><%=prod.product_product_line_ID%></td><br><br>
            Product Condition: <td><%=prod.product_product_condition%></td><br><br>
            Product Reason: <td><%=prod.product_reason%></td><br><br>
            Product Stock Price: <td><%=prod.product_stock_price%></td><br><br>
            Product Supplier ID: <td><%=prod.product_supplier_ID%></td><br><br>
            Product Bin ID: <td><%=prod.product_bin_ID%></td><br><br>
            Product Unit Measure: <td><%=prod.product_unit_measure%></td><br><br>
            Product isReceivedFromWarehouse: <td><%=prod.product_is_received_from_warehouse%></td><br><br>
            Product Status: <td><%=prod.product_status%></td><br><br>
            <input type="submit" value="View Again">
        </form> 
            <button onclick = "window.location.href = 'index.html';"> Back to Main Menu </button>
    </body>
</html>
