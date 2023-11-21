<%-- 
    Document   : productRegisterProcessing
    Created on : 11 21, 23, 2:41:43 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*,java.text.DateFormat,java.text.SimpleDateFormat"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Register Product Processing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
            <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
        <%
            DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
            
            String temp = request.getParameter("product_warehouseID");
            
            prod.product_warehouse_ID = Integer.parseInt(temp);
            
            String temp2 = request.getParameter("product_date_received");
            
            prod.product_date_received = date_format.parse(temp2);
            
            String temp3 = request.getParameter("product_productlineID");
            prod.product_product_line_ID = Integer.parseInt(temp3);
            
            
            prod.product_product_condition = request.getParameter("product_condition");
            prod.product_reason = null;
            
            String temp4 = request.getParameter("product_bin");
            prod.product_bin_ID = Integer.parseInt(temp4);
            
            String temp5 = request.getParameter("product_stock_price");
            prod.product_stock_price = Float.parseFloat(temp5);
            
            String temp6 = request.getParameter("product_supplierID");
            prod.product_supplier_ID = Integer.parseInt(temp6);
            

            // WHAT IS PRODUCT UNIT MEASURE
            prod.product_unit_measure = request.getParameter("product_unitmeasure");
            prod.product_is_received_from_warehouse = false;
            
            prod.product_status = "stored";

            int status = prod.register_product();
            if (status == 1) {
                %>
   
             <h1>Success! Registered New Warehouse!</h1>
                <hr><br>
            
            <table>
                <tr>
                    <td>Product Warehouse ID: </td>
                    <td><%=prod.product_warehouse_ID%></td>
                </tr>
                
                <tr>
                    <td>Product Date Received: </td>
                    <td><%=prod.product_date_received%></td>
                </tr>
                
                <tr>
                    <td>Product Line ID: </td>
                    <td><%=prod.product_product_line_ID%></td>
                </tr>
                
                <tr>
                    <td>Product Condition: </td>
                    <td><%=prod.product_product_condition%></td>
                </tr>
                
                <tr>
                    <td>Product Reason: </td>
                    <td><%=prod.product_reason%></td>
                </tr>
                
                <tr>
                    <td>Product Stock Price: </td>
                    <td><%=prod.product_stock_price%></td>
                </tr>
                
                <tr>
                    <td>Product Supplier ID: </td>
                    <td><%=prod.product_supplier_ID%></td>
                </tr>
                
                <tr>
                    <td>Product Bin ID: </td>
                    <td><%=prod.product_bin_ID%></td>
                </tr>
                
                <tr>
                    <td>Product Unit Measure: </td>
                    <td><%=prod.product_unit_measure%></td>
                </tr>
                
                <tr>
                    <td>Product isReceivedFromWarehouse: </td>
                    <td><%=prod.product_is_received_from_warehouse%></td>
                </tr>
                
                <tr>
                    <td>Product Status: </td>
                    <td><%=prod.product_status%></td>
                </tr>
            </table><br>


            <button onclick = "window.location.href = 'product.html';"> Back to Supplier Menu </button>
            <button onclick = "window.location.href = 'productRegister.html';"> Register Another Supplier </button>
                <% 
            } else { 
                %>
                <h1>Registering Product Line Unsuccessful </h1>
                <button onclick = "window.location.href = 'productRegister.html';"> Retry </button>
            <% }
        %>
    </body>
</html>
