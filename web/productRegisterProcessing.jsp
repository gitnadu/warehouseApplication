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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register Product Processing </title>
    </head>
    <body>
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
   
             <h1>Registering Product Line Successful</h1>
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
            <button onclick = "window.location.href = 'productLine.html';"> Back to Supplier Menu </button>
            <button onclick = "window.location.href = 'productLineRegister.html';"> Register Another Supplier </button>
                <% 
            } else { 
                %>
                <h1>Registering Product Line Unsuccessful </h1>
                <button onclick = "window.location.href = 'productLineRegister.html';"> Retry </button>
            <% }
        %>
    </body>
</html>
