<%-- 
    Document   : productUpdateCheck
    Created on : 11 21, 23, 3:08:15 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Double Check Changes</h2>
        <hr><br>
        
        <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
        <form action="productUpdateProcessing.jsp"> 
            <%  
                prod.product_warehouse_ID_temporary = request.getParameter("product_warehouseIDU");
                
                prod.product_date_received_temporary = request.getParameter("product_date_receivedU");
                prod.product_product_line_ID_temporary = request.getParameter("product_productlineID");
                prod.product_product_condition_temporary = request.getParameter("product_conditionU");

                prod.product_stock_price_temporary = request.getParameter("product_stock_priceU");
                prod.product_supplier_ID_temporary = request.getParameter("product_supplierIDU");
                prod.product_bin_ID_temporary = request.getParameter("product_binU");
                prod.product_unit_measure_temporary = request.getParameter("product_unitmeasureU");
                prod.product_is_received_from_warehouse_temporary = request.getParameter("product_isFromWarehouseU");
                prod.product_status_temporary = request.getParameter("product_statusU");
                int status = prod.get_product_record();
            %>
            
            <table style = "width: 100%">
                <h2>Original Details: </h2>
                <tr>
                    <td>Product Warehouse ID:</td>
                    <td>Product Date Received:</td>
                    <td>Product Line ID:</td>
                    <td>Product Condition:</td>
                    <td>Product Reason:</td>
                    <td>Product Stock Price:</td>
                    <td>Product Supplier ID:</td>
                    <td>Product Bin ID:</td>
                    <td>Product Unit Measure:</td>
                    <td>Product isReceivedFromWarehouse:</td>
                    <td>Product Status:</td>
                </tr>
                <tr>
                    <td><%=prod.product_warehouse_ID%> </td>
                    <td><%=prod.product_date_received%></td>
                    <td><%=prod.product_product_line_ID%></td>
                    <td><%=prod.product_product_condition%></td>
                    <td><%=prod.product_reason%></td>
                    <td><%=prod.product_stock_price%></td>
                    <td><%=prod.product_supplier_ID%></td>
                    <td><%=prod.product_bin_ID%></td>
                    <td><%=prod.product_unit_measure%></td>
                    <td><%=prod.product_is_received_from_warehouse%></td>
                    <td><%=prod.product_status%></td>
                </tr>
            </table>
                
            <hr class="short">
            
            <table style = "width: 100%">
                <h2>New Details: </h2>
                <tr>
                    <td>Product Warehouse ID:</td>
                    <td>Product Date Received:</td>
                    <td>Product Line ID:</td>
                    <td>Product Condition:</td>
                    <td>Product Reason:</td>
                    <td>Product Stock Price:</td>
                    <td>Product Supplier ID:</td>
                    <td>Product Bin ID:</td>
                    <td>Product Unit Measure:</td>
                    <td>Product isReceivedFromWarehouse:</td>
                    <td>Product Status:</td>
                </tr>
                <tr>
                    <td><%=prod.product_warehouse_ID_temporary%> </td>
                    <td><%=prod.product_date_received_temporary%></td>
                    <td><%=prod.product_product_line_ID_temporary%></td>
                    <td><%=prod.product_product_condition_temporary%></td>
                    <td><%=prod.product_reason_temporary%></td>
                    <td><%=prod.product_stock_price_temporary%></td>
                    <td><%=prod.product_supplier_ID_temporary%></td>
                    <td><%=prod.product_bin_ID_temporary%></td>
                    <td><%=prod.product_unit_measure_temporary%></td>
                    <td><%=prod.product_is_received_from_warehouse_temporary%></td>
                    <td><%=prod.product_status_temporary%></td>
                </tr>
            </table><br>
            <input type="submit" value="Save Changes!"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplierUpdate.jsp';"> Cancel Update </button>
    </center></body>
</html>
