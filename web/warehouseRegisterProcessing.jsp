<%-- 
    Document   : registerInventoryEmployee_processing
    Created on : 11 14, 23, 12:04:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, invEmpMgmt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Warehouse Processing</title>
    </head>
    <body>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <%
            ware.warehouse_city  = request.getParameter("warehouse_city");
            ware.warehouse_phonenumber = request.getParameter("warehouse_phonenumber");
            ware.warehouse_first_address = request.getParameter("warehouse_first_address");
            ware.warehouse_state = request.getParameter("warehouse_state");
            ware.warehouse_country = request.getParameter("warehouse_country");
            ware.warehouse_postalcode = request.getParameter("warehouse_postalcode");
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
                <h1>Registering Warehouse Successful </h1>
                New Warehouse ID: <%=ware.warehouse_ID %>  <br><br>
                New Warehouse City: <%=ware.warehouse_city %>  <br>
                New Warehouse Phone Number: <%=ware.warehouse_phonenumber %> <br>
                New Warehouse First Address: <%=ware.warehouse_first_address %>  <br>
                New Warehouse State: <%=ware.warehouse_state %> <br>
                New Warehouse Country:  <%=ware.warehouse_country %> <br>
                New Warehouse Postal Code: <%=ware.warehouse_postalcode %> <br>
                New Warehouse Max Row: <%=ware.warehouse_maxrow%> <br>
                New Warehouse Max Bay: <%=ware.warehouse_maxbay %>  <br>
                New Warehouse Max Level: <%=ware.warehouse_maxlevel %>  <br>
                New Warehouse Max Bin: <%=ware.warehouse_maxbinNumber %>  <br>
                <br>
                
                <button onclick = "window.location.href = 'warehouse.html';"> Back to Warehouse Menu </button>
                <button onclick = "window.location.href = 'warehouseRegister.html';"> Register Another Warehouse </button>
                <% 
            } else { 
                %>
                <h1>Registering Inventory Employee Unsuccessful </h1>
                <button onclick = "window.location.href = 'warehouseRegister.html';"> Retry </button>
            <% } 
        %>
    </body>
</html>
