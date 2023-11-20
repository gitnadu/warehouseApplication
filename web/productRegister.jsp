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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <script>
            function updateBin() {
                var selectedWarehouse = document.getElementById("product_warehouseID").value;
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        console.log(JSON.parse(xmlhttp.responseText));
                        var binsData = JSON.parse(xmlhttp.responseText);
                        populateDropdown(binsData);
                    }
                };

                xmlhttp.open("GET", "get_bin.jsp?warehouse=" + selectedWarehouse, true);
                xmlhttp.send();
                
            }
            
            function populateDropdown(binsData) {
                var selectElement = document.getElementById("product_bin");

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
    <body>
        <h2> Register a Product </h2>
        <hr><br>

        <form action="productRegisterProcessing.jsp" onsubmit="return validateForm();" method="post" > 
            <jsp:useBean id="prod" class="productMgmt.product" scope="session" />

            Warehouse ID:
            <select id="product_warehouseID" name="product_warehouseID"  onchange="updateBin();" required>
                <option value =""></option>
                <% prod.get_functional_warehouses();
                    for (int i=0;i< prod.product_warehouse_IDList.size();i++) { %>
                 <option value ="<%= prod.product_warehouse_IDList.get(i)%>"> <%=prod.product_warehouse_IDList.get(i)%> </option>
                  <% } %> 
             </select><br><br> 

            Product Line:
            <select id="product_productlineID" name="product_productlineID" required>
                <option value =""></option>
                <% prod.get_productline_warehouses();
                    for (int i=0;i< prod.product_product_line_IDList.size();i++) { %>
                 <option value ="<%= prod.product_product_line_IDList.get(i)%>"> <%=prod.product_product_line_IDList.get(i)%> </option>
                  <% } %> 
             </select><br><br>

            Date Received:
            <input type="date" id ="product_date_received" name="product_date_received" required><br><br>

            Product Condition:
            <select id="product_condition" name="product_condition" required>
                <option value =""> </option>
                <option value ="Good"> Good </option>
                <option value ="Bad"> Bad </option>
            </select>

            Product Stock Price:
            <input type="number" id="product_stock_price" name="product_stock_price" step="0.01" required><br><br>

            Supplier:
            <select id="product_supplierID" name="product_supplierID" required>
                <option value =""></option>
                <% prod.get_suppliers_products();
                    for (int i=0;i< prod.product_supplier_IDList.size();i++) { %>
                 <option value ="<%= prod.product_supplier_IDList.get(i)%>"> <%=prod.product_supplier_IDList.get(i)%> </option>
                  <% } %> 
             </select><br><br>

            Bin:
            <select id="product_bin" name="product_bin" required></select>


            Unit Measure:
            <select id="product_unitmeasure" name="product_unitmeasure" required>
                <option value =""> </option>
                <option value ="Each"> Each </option>
                <option value ="Group"> Group </option>
            </select>
           
            <input type="submit" value="Proceed"><br><br>
        </form>
        <button onclick = "window.location.href = 'product.html';">Cancel</button>
    </body>
</html>

