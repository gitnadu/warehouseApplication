<%-- 
    Document   : productUpdateForm
    Created on : 11 21, 23, 1:46:53 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <script>
            function updateBin() {
                var selectedWarehouse = document.getElementById("product_warehouseIDU").value;
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        console.log(JSON.parse(xmlhttp.responseText));
                        var binsData = JSON.parse(xmlhttp.responseText);
                        populateDropdown(binsData);
                    }
                };

                xmlhttp.open("GET", "get_bin_exclude.jsp?warehouse=" + selectedWarehouse, true);
                xmlhttp.send();
                
            }
            
            function populateDropdown(binsData) {
                var selectElement = document.getElementById("product_binU");

                // Clear existing options
                selectElement.innerHTML = "";

                // Add new options based on the data received
                for (var i = 0; i < binsData.length; i++) {
                    var option = document.createElement("option");
                    option.value = binsData[i]; // Set the appropriate property based on your JSON structure
                    option.text = binsData[i]; // Set the appropriate property based on your JSON structure
                    selectElement.appendChild(option);
                }
            }
        
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
        <h2>Update a Product Form</h2>
        <hr>

        <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
        
        <% 
            String temp = request.getParameter("product_idU");
            prod.product_product_ID = Integer.valueOf(temp); 
            int status = prod.get_product_record();
            if (status == 1){
        %>
        <% } else { %>
        <% } %>
        
        <form action="productUpdateCheck.jsp">
            
            <table>
                <tr>
                    <td>Product ID:</td>
                    <td><%=prod.product_product_ID%> </td>
                </tr>
                
                <tr>
                    <td>Warehouse ID:</td>
                    <td>
                        <select id="product_warehouseIDU" name="product_warehouseIDU" onchange="updateBin();" required>
                            <option value ="<%=prod.product_warehouse_ID%>"> <%=prod.product_warehouse_ID%> </option>
                            <% prod.get_functional_warehouses_exclude();
                                for (int i=0;i< prod.product_warehouse_IDList_exclude.size();i++) { %>
                             <option value ="<%= prod.product_warehouse_IDList_exclude.get(i)%>"> <%=prod.product_warehouse_IDList_exclude.get(i)%> </option>
                              <% } %>
                         </select>
                    </td>
                </tr>
                <tr>
                    <td>Product Line:</td>
                    <td>
                        <select id="product_productlineIDU" name="product_productlineIDU" required>
                            <option value="<%=prod.product_product_line_ID%>"> <%=prod.product_product_line_ID%> </option>
                            <% prod.get_productline_warehouses_exclude();
                                for (int i=0;i< prod.product_product_line_IDList_exclude.size();i++) { %>
                             <option value ="<%= prod.product_product_line_IDList_exclude.get(i)%>"> <%=prod.product_product_line_IDList_exclude.get(i)%> </option>
                              <% } %>
                         </select>
                    </td>
                </tr>
                <tr>
                    <td>Date Received:</td>
                    <td><input type="date" id ="product_date_receivedU" name="product_date_receivedU" value="<%= prod.product_date_received%>" required></td>
                </tr>
                
                
                <tr>
                    <td>Reason:</td>
                    <td><input type="text" id="product_reasonU" name="product_reasonU" value="<% if (prod.product_reason == null) { %> <% } else { %> <%= prod.product_reason %> <% } %>" required></td>
                </tr>
                <tr>
                    <td>Product Condition:</td>
                    <td>
                        <select id="product_conditionU" name="product_conditionU" required>
                            <% if (prod. product_product_condition.equals("Good")) { %>
                            <option value ="<%= prod. product_product_condition%>"><%= prod. product_product_condition%> </option>
                            <option value ="Bad"> Bad </option>
                            <% } else { %>
                            <option value ="<%= prod. product_product_condition%>"><%= prod. product_product_condition%> </option>
                            <option value ="Good"> Good </option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Product Stock Price:</td>
                    <td><input type="number" id="product_stock_priceU" name="product_stock_priceU" step="0.01" value="<%= prod.product_stock_price%>" required></td>
                </tr>
                <tr>
                    <td>Supplier:</td>
                    <td>
                        <select id="product_supplierIDU" name="product_supplierIDU" required>
                            <option value ="<%= prod.product_supplier_ID%>"> <%= prod.product_supplier_ID%> </option>
                            <% prod.get_suppliers_products();
                                for (int i=0;i< prod.product_supplier_IDList.size();i++) { %>
                             <option value ="<%= prod.product_supplier_IDList.get(i)%>"> <%=prod.product_supplier_IDList.get(i)%> </option>
                              <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Bin:</td>
                    <td>
                        <select id="product_binU" name="product_binU" value="<%= prod.product_bin_ID%>" required>
                        <option value="<%= prod.product_bin_ID%>"> <%= prod.product_bin_ID%> </option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Unit Measure:</td>
                    <td>
                        <select id="product_unitmeasureU" name="product_unitmeasureU" required>
                            <% if (prod.product_unit_measure.equals("Each")) { %>
                            <option value ="<%= prod.product_unit_measure%>"><%= prod.product_unit_measure%> </option>
                            <option value ="Group"> Group </option>
                            <% } else { %>
                            <option value ="<%= prod.product_unit_measure%>"><%= prod.product_unit_measure%> </option>
                            <option value ="Each"> Each </option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Status:</td>
                    <td>
                        <select id="product_statusU" name="product_statusU" required>
                            <% if (prod.product_status.equals("stored")) { %>
                            <option value ="<%= prod.product_status%>"><%= prod.product_status%> </option>
                            <option value ="disposed"> disposed </option>
                            <% } else { %>
                            <option value ="<%= prod.product_status%>"><%= prod.product_status%> </option>
                            <option value ="stored"> sotred </option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Was this received from a warehouse?:</td>
                    <td>
                        <select id="product_isFromWarehouseU" name="product_isFromWarehouseU" required>
                            <% if (prod.product_is_received_from_warehouse) { %>
                            <option value ="<%= prod.product_is_received_from_warehouse%>"><%= prod.product_is_received_from_warehouse%> </option>
                            <option value ="false"> False </option>
                            <% } else { %>
                            <option value ="<%= prod.product_is_received_from_warehouse%>"><%= prod.product_is_received_from_warehouse%> </option>
                            <option value ="true"> True </option>
                            <% } %>
                        </select>
                    </td>
                </tr>
            </table><br>
            
            <input type="submit" value="Next">
        </form>
        <button onclick = "window.location.href = 'productUpdate.jsp';"> Go Back </button>
        <button onclick = "window.location.href = 'product.html';"> Cancel Update </button>
    </center></body>
</html>
