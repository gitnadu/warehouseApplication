<%-- 
    Document   : registerInventoryEmployee_processing
    Created on : 11 14, 23, 12:04:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Warehouse Processing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
            <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <%
            ware.warehouse_phonenumber = request.getParameter("warehouse_phonenumber");
            ware.warehouse_name = request.getParameter("warehouse_name");
            ware.warehouse_address = request.getParameter("warehouse_address");
            ware.warehouse_maxrow_temporary = request.getParameter("warehouse_maxrow");
            ware.warehouse_maxbay_temporary = request.getParameter("warehouse_maxbay");
            ware.warehouse_maxlevel_temporary = request.getParameter("warehouse_maxlevel");
            ware.warehouse_maxbinNumber_temporary = request.getParameter("warehouse_maxbin");
            
            ware.warehouse_maxrow = Integer.parseInt(ware.warehouse_maxrow_temporary);
            ware.warehouse_maxbay = Integer.parseInt(ware.warehouse_maxbay_temporary);
            ware.warehouse_maxlevel = Integer.parseInt(ware.warehouse_maxlevel_temporary);
            ware.warehouse_maxbinNumber = Integer.parseInt(ware.warehouse_maxbinNumber_temporary);
            
            int status = ware.register_warehouse();
            if (status==1) {
                %>
                <h1>Success! Registered New Warehouse!</h1>
                <hr><br>
            
                <table>
                    <tr>
                        <td>New Warehouse ID: </td>
                        <td><%=ware.warehouse_ID %></td>
                    </tr>
                    <tr>
                        <td>New Warehouse Phone Number: </td>
                        <td><%=ware.warehouse_phonenumber %></td>
                    </tr>
                    <tr>
                        <td>New Warehouse Name:</td>
                        <td><%=ware.warehouse_name %></td>
                    </tr>
                    <tr>
                        <td>New Warehouse First Address:</td>
                        <td><%=ware.warehouse_address %></td>
                    </tr>
                    <tr>
                        <td>New Warehouse Max Row: </td>
                        <td><%=ware.warehouse_maxrow%></td>
                    </tr>
                    <tr>
                        <td>New Warehouse Max Bay: </td>
                        <td><%=ware.warehouse_maxbay %> </td>
                    </tr>
                    <tr>
                        <td>New Warehouse Max Level: </td>
                        <td><%=ware.warehouse_maxlevel %> </td>
                    </tr>
                    <tr>
                        <td>New Warehouse Max Bin: </td>
                        <td><%=ware.warehouse_maxbinNumber %> </td>
                    </tr>
                </table><br>
                <button onclick = "window.location.href = 'warehouse.html';"> Back to Warehouse Menu </button>
                <button onclick = "window.location.href = 'warehouseRegister.html';"> Register Another Warehouse </button>
                <% 
            } else { 
                %>
                <h1>Registering Warehouse Failed</h1>
                <button onclick = "window.location.href = 'warehouseRegister.html';"> Retry </button>
            <% } 
        %>
    </body>
</html>
