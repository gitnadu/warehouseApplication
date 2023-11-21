<%-- 
    Document   : productSearch
    Created on : 11 21, 23, 6:38:59 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*"%>
<html>
    <head>
        <title> Register a new inventory employee </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <script>
            function isDateFuture() {
                let dateReceived = new Date(document.getElementById("product_date_received").value);
                let currentDate = new Date();
                let itemAge = currentDate.getFullYear() - birthDate.getFullYear();

                if (currentDate.getMonth() < dateReceived.getMonth() ||
                (currentDate.getMonth() === dateReceived.getMonth() && 
                    currentDate.getDate() < dateReceived.getDate())) {
                    return true;
                }

                return false;
            }

            function validateForm() {
                if(isDateFuture()) {
                    alert("The item can't be registered for the future.");
                    return false;
                }
                return true;
            }
        </script>
    </head>    
    <body><center>
        <h2>Search Product</h2>
        <hr><br>
        
        <form action="productSearchProcessing.jsp" onsubmit="return validateForm();" method="post" > 
            <jsp:useBean id="prod" class="productMgmt.product" scope="session" />

            <table>
                <tr>
                    <td>Warehouse ID:</td>
                    <td>
                        <select id="product_warehouseIDS" name="product_warehouseIDS">
                            <option value =""></option>
                            <% prod.get_functional_warehouses();
                                for (int i=0;i< prod.product_warehouse_IDList.size();i++) { %>
                             <option value ="<%= prod.product_warehouse_IDList.get(i)%>"> <%=prod.product_warehouse_IDList.get(i)%> </option>
                              <% } %>
                         </select>
                    </td>
                </tr>
                <tr>
                    <td>Product Line:</td>
                    <td>
                        <select id="product_productlineIDS" name="product_productlineIDS">
                            <option value =""></option>
                            <% prod.get_productline_warehouses();
                                for (int i=0;i< prod.product_product_line_IDList.size();i++) { %>
                             <option value ="<%= prod.product_product_line_IDList.get(i)%>"> <%=prod.product_product_line_IDList.get(i)%> </option>
                              <% } %>
                         </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Product Condition:</td>
                    <td>
                        <select id="product_conditionS" name="product_conditionS">
                            <option value =""> </option>
                            <option value ="Good"> Good </option>
                            <option value ="Bad"> Bad </option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Product Stock Price:</td>
                    <td><input type="number" id="product_stock_priceS" name="product_stock_priceS" step="0.01"></td>
                </tr>
                
                <tr>
                    <td>Supplier:</td>
                    <td>
                        <select id="product_supplierIDS" name="product_supplierIDS">
                            <option value =""></option>
                            <% prod.get_suppliers_products();
                                for (int i=0;i< prod.product_supplier_IDList.size();i++) { %>
                             <option value ="<%= prod.product_supplier_IDList.get(i)%>"> <%=prod.product_supplier_IDList.get(i)%> </option>
                              <% } %>
                         </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Unit Measure:</td>
                    <td>
                        <select id="product_unitmeasureS" name="product_unitmeasureS" >
                            <option value =""> </option>
                            <option value ="Each"> Each </option>
                            <option value ="Group"> Group </option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Date Received:</td>
                    <td><input type="date" id ="product_date_receivedS" name="product_date_receivedS" ></td>
                </tr>
            </table><br>

            <input type="submit" value="Proceed"><br><br>
        </form>
        <button onclick = "window.location.href = 'product.html';">Cancel</button>
    </body>
</html>
