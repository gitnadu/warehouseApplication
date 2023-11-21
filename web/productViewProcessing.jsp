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
        <title>View Product</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Success! Viewing Product Record..</h2>
        <hr><br>
        
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
    
            <table>
                <tr><td>Product Warehouse ID: </td>
                <td><%=prod.product_warehouse_ID%></td></tr>
                
                <tr><td>Product Date Received: </td>
                <td><%=prod.product_date_received%></td></tr>
                
                <tr><td>Product Line ID: </td>
                <td><%=prod.product_product_line_ID%></td></tr>
                
                <tr><td>Product Condition: </td>
                <td><%=prod.product_product_condition%></td></tr>
                
                <tr><td>Product Reason: </td>
                <td><%=prod.product_reason%></td></tr>
                
                <tr><td>Product Stock Price: </td>
                <td><%=prod.product_stock_price%></td></tr>
                
                <tr><td>Product Supplier ID: </td>
                <td><%=prod.product_supplier_ID%></td></tr>
                
                <tr><td>Product Bin ID: </td>
                <td><%=prod.product_bin_ID%></td></tr>
                
                <tr><td>Product Unit Measure: </td>
                <td><%=prod.product_unit_measure%></td></tr>
                
                <tr><td>Product isReceivedFromWarehouse: </td>
                <td><%=prod.product_is_received_from_warehouse%></td></tr>
                
                <tr><td>Product Status:</td>
                <td><%=prod.product_status%></td></tr>
            </table><br>
            
            <input type="submit" value="View Again"><br><br>
        </form> 
            <button onclick = "window.location.href = 'product.html';"> Back to Menu </button>
    </body>
</html>
