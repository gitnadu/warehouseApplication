<%-- 
    Document   : productCheckingCompletion
    Created on : 11 22, 23, 3:54:12 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Product Line Processing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
            <jsp:useBean id="check" class="warehouseMgmt.inventory_physical_checking" scope="session" />
        <%
            int status2 = check.register_inventory_physical_checking();
            
            int status = check.add_stock_checked();
            
            
            if (status2 == 1) {
                %>

            <h1>Success! Registered New Inventory Checking!</h1>
            <hr><br>

            <table>
                <tr>
                    <td>New Inventory Check ID: </td>
                    <td><%=check.inventory_check_ID %> </td>
                </tr>
                
                <tr>
                    <td>Warehouse ID: </td>
                    <td><%=check.checking_warehouse_ID %> </td>
                </tr>
                
                <tr>
                    <td>Product Line ID: </td>
                    <td><%=check.product_line_ID %> </td>
                </tr>
                
                <tr>
                    <td>Employee In Charge ID: </td>
                    <td><%=check.employee_in_charge_ID %> </td>
                </tr>
                
                <tr>
                    <td> Products to checked:  </td>
                    <% for(int i=0;i<check.products_warehouse.size();i++) { %>
                    <td><%=check.products_warehouse.get(i) %>  </td>
                    <% } %>
                </tr>
                
                <tr>
                    <td> Products checked:  </td>
                    <td><%=check.quantity_checked %> </td>
                </tr>
                
                <tr>
                    <td> Products disposed:  </td>
                    <td><%=check.quantity_disposed %> </td>
                </tr>
                
                
            </table>
            
            <button onclick = "window.location.href = 'index.html';"> Back to Menu </button>
            <button onclick = "window.location.href = 'inventoryChecking.jsp';"> Register Another Inventory Checking </button>
                <% } else { %>
                
                <h1>Registering Product Line Failed </h1>
                <button onclick = "window.location.href = 'inventoryChecking.jsp';"> Retry </button>
            <% }
        %>
    </body>
</html>