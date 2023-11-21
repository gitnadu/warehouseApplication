<%-- 
    Document   : productChecking
    Created on : 11 22, 23, 3:03:27 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register New Transfer </title>
        <script>
            function updateEmployee() {
                var selectedWarehouse = document.getElementById("checking_warehouse").value;
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        console.log(JSON.parse(xmlhttp.responseText));
                        var employeesData = JSON.parse(xmlhttp.responseText);
                        console.log(employeesData);
                        populateDropdown(employeesData);
                    }
                };

                xmlhttp.open("GET", "get_employee_checking.jsp?warehouse=" + selectedWarehouse, true);
                xmlhttp.send();
                
            }
            
            function populateDropdown(employeesData) {
                var selectElement = document.getElementById("checking_employee");

                // Clear existing options
                selectElement.innerHTML = "";

                // Add new options based on the data received
                for (var i = 0; i < employeesData.length; i++) {
                    var option = document.createElement("option");
                    option.value = employeesData[i]; // Set the appropriate property based on your JSON structure
                    option.text = employeesData[i]; // Set the appropriate property based on your JSON structure
                    selectElement.appendChild(option);
                }
            }
        </script>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2> Register New Inventory Physical Checking Record </h2>
        <hr><br>
        
        <form action="productCheckingForm.jsp"> 
            <jsp:useBean id="check" class="warehouseMgmt.inventory_physical_checking" scope="session" />
            
            Warehouse ID <select id="checking_warehouse" name="checking_warehouse" onchange="updateEmployee();"> <br><br>
                <option value=""> </option>
            <%  check.get_functional_warehouses();
                for(int i=0;i<check.checking_warehouse_IDList.size();i++){
            %>
            <option value="<%=check.checking_warehouse_IDList.get(i) %>" > <%=check.checking_warehouse_IDList.get(i) %> </option>
            <% } %>
            
            </select> <br>
            
            Employee In Charge:
            <select id="checking_employee" name="checking_employee"></select>
            
            <input type="submit" value="Submit">
        </form>
        <button onclick = "window.location.href = 'stockTransfer.html';">Cancel</button>
    </body>
</html>  
