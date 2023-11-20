<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*"%>
<html>
    <head>
        <title> Register a new inventory employee </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <script>
            function updateBin() {
                var selectedWarehouse = document.getElementById("product_warehouseID").value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "get_bin.jsp?warehouse=" + selectedWarehouse, true);
                xmlhttp.send();
                
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("product_bin").innerHTML = xmlhttp.responseText;
                    }
                };
                
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
    <body>
        <h2> Register a Product </h2>
        <hr><br>

        <form action="productRegisterProcessing.jsp" onsubmit="return validateForm();" method="post" > 
            <jsp:useBean id="prod" class="productMgmt.product" scope="session" />

            Warehouse ID:
            <select id="product_warehouseID" name="product_warehouseID"  onchange="updateBin() required>
                <% prod.get_functional_warehouses();
                    for (int i=0;i< prod.product_warehouse_IDList.size();i++) { %>
                 <option value ="<%= prod.product_warehouse_IDList.get(i)%>"> <%=prod.product_warehouse_IDList.get(i)%> </option>
                  <% } %> 
             </select><br><br> 

            Product Line:
            <select id="product_warehouseID" name="product_warehouseID" required>
                <% prod.get_functional_warehouses();
                    for (int i=0;i< prod.product_warehouse_IDList.size();i++) { %>
                 <option value ="<%= prod.product_warehouse_IDList.get(i)%>"> <%=prod.product_warehouse_IDList.get(i)%> </option>
                  <% } %> 
             </select><br><br>

            Date Received:
            <input type="date" id ="product_date_received" name="product_date_received" required><br><br>

            <!-- Product Condition: -->
            <!-- product_product_condition -->

            <!-- There is no reason input because the need for product condition is not initially needed. -->

            Product Stock Price:
            <input type="number" id="product_stock_price" name="product_stock_price" required><br><br>

            <!-- Supplier -->
            <!-- product_supplier_ID -->

            Bin:
            <select id="product_bin" name="product_bin"">
            <option value=""> Select Bin </option>
            </select><br>

            <!-- Unit Measure -->
            <!-- product_unit_measure -->

            <!-- There is no received from warehouse boolean because registering must come from supplier. -->

            <!-- Product Status -->
            <!-- product_status -->
           
            <input type="submit" value="Proceed"><br><br>
        </form>
        <button onclick = "window.location.href = 'product.html';">Cancel</button>
    </body>
</html>

