<%-- 
    Document   : productTransferCompletion
    Created on : 11 22, 23, 1:47:23 AM
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
            <jsp:useBean id="transfer" class="productMgmt.transfer" scope="session" />
        <%
            
            transfer.transfer_warehouse_destination_ID = Integer.parseInt(request.getParameter("transfer_warehousedest"));
            int status2 = transfer.register_transfer();
            int status = transfer.add_stock_transfer();
            
            
            if (status == 1) {
                %>

            <h1>Success! Registered New Product Transfer!</h1>
            <hr><br>

            <table>
                <tr>
                    <td>New Transfer ID: </td>
                    <td><%=transfer.transfer_transfer_ID %> </td>
                </tr>
                
                <tr>
                    <td>Warehouse Origin: </td>
                    <td><%=transfer.transfer_warehouse_origin_ID %> </td>
                </tr>
                
                <tr>
                    <td>Warehouse Destination: </td>
                    <td><%=transfer.transfer_warehouse_destination_ID %> </td>
                </tr>
                
                <tr>
                    <td>Employee In Charge ID: </td>
                    <td><%=transfer.transfer_employee_in_charge_ID %> </td>
                </tr>
                
                <tr>
                    <td> Products to be transferred:  </td>
                    <% for(int i=0;i<transfer.transfer_selected_products.size();i++) { %>
                    <td><%=transfer.transfer_selected_products.get(i) %>  </td>
                    <% } %>
                </tr>
            </table>
            
            <button onclick = "window.location.href = 'productLine.html';"> Back to Menu </button>
            <button onclick = "window.location.href = 'productLineRegister.html';"> Register Another Product Line </button>
                <% } else { %>
                
                <h1>Registering Product Line Failed </h1>
                <button onclick = "window.location.href = 'productLineRegister.html';"> Retry </button>
            <% }
        %>
    </body>
</html>
