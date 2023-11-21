<%-- 
    Document   : productSearchProcessing
    Created on : 11 21, 23, 6:55:45 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, warehouseMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Products</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Search Results:</h2>
        <hr><br>
        
        <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
        <form action="warehouseSearch.html"> 
            <% 
                prod.product_warehouse_ID_holder= request.getParameter("product_warehouseIDS");
                prod.product_date_received_holder= request.getParameter("product_date_receivedS");
                prod.product_product_line_ID_holder= request.getParameter("product_productlineIDS");
                prod.product_product_condition_holder= request.getParameter("product_conditionS");
                prod.product_stock_price_holder= request.getParameter("product_stock_priceS");
                prod.product_supplier_ID_holder= request.getParameter("product_supplierIDS");
                prod.product_bin_ID_holder= request.getParameter("product_binS");
                prod.product_unit_measure_holder= request.getParameter("product_unitmeasureS");
                
                int status = prod.search_products();
                
                if (status == 1){
            %>
            
            <table style = "width:100%">
                <tr> 
                    <td>Product Warehouse ID: </td>
                    <td>Product Date Received: </td>
                    <td>Product ProductLine ID: </td>
                    <td>Product Condition:</td>
                    <td>Product Stock Price: </td>
                    <td>Product Supplier ID: </td>
                    <td>Product Bin ID: </td>
                    <td>Product Unit Measure: </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                    <%
                       for(int i=0;i<prod.product_search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=prod.product_warehouse_IDList.get(i) %> </td> 
                        <td><%=prod.product_date_receivedList.get(i) %> </td> 
                        <td><%=prod.product_product_line_IDList.get(i) %></td>
                        <td><%=prod.product_product_conditionList.get(i) %> </td>
                        <td><%=prod.product_stock_priceList.get(i) %> </td> 
                        <td><%=prod.product_supplier_IDList.get(i) %></td>
                        <td><%=prod.product_bin_IDList.get(i) %> </td>
                        <td><%=prod.product_unit_measureList.get(i) %> </td>
                       </tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>There is no record that matches your search query..</h1>
            <% } %>
            <br><input type="submit" value="Search Again"><br><br>
        </form>
        <button onclick = "window.location.href = 'product.html';"> Back to Menu </button>
    </body>
</html>
