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
        <jsp:useBean id="obj" class="warehouseMgmt.warehouse" scope="session" />
        <%
            obj.warehouse_city  = request.getParameter("warehouse_city");
            obj.warehouse_phonenumber = request.getParameter("warehouse_phonenumber");
            obj.warehouse_first_address = request.getParameter("warehouse_first_address");
            obj.warehouse_state = request.getParameter("warehouse_state");
            obj.warehouse_country = request.getParameter("warehouse_country");
            obj.warehouse_postalcode = request.getParameter("warehouse_postalcode");
            obj.warehouse_maxrow_temporary = request.getParameter("warehouse_maxrow");
            obj.warehouse_maxbay_temporary = request.getParameter("warehouse_maxbay");
            obj.warehouse_maxlevel_temporary = request.getParameter("warehouse_maxlevel");
            obj.warehouse_maxbin_temporary = request.getParameter("warehouse_maxbin");
            
            obj.warehouse_maxrow = Integer.parseInt(obj.warehouse_maxrow_temporary);
            obj.warehouse_maxbay = Integer.parseInt(obj.warehouse_maxbay_temporary);
            obj.warehouse_maxlevel = Integer.parseInt(obj.warehouse_maxlevel_temporary);
            obj.warehouse_maxbin = Integer.parseInt(obj.warehouse_maxbin_temporary);
            
            int status = obj.register_warehouse();
            if (status==1) {
                %>
                <h1>Registering Warehouse Successful </h1>
                New Warehouse ID: <%=obj.warehouse_ID %>  <br><br>
                New Warehouse City: <%=obj.warehouse_city %>  <br>
                New Warehouse Phone Number: <%=obj.warehouse_phonenumber %> <br>
                New Warehouse First Address: <%=obj.warehouse_first_address %>  <br>
                New Warehouse State: <%=obj.warehouse_state %> <br>
                New Warehouse Country:  <%=obj.warehouse_country %> <br>
                New Warehouse Postal Code: <%=obj.warehouse_postalcode %> <br>
                New Warehouse Max Row: <%=obj.warehouse_maxrow%> <br>
                New Warehouse Max Bay: <%=obj.warehouse_maxbay %>  <br>
                New Warehouse Max Level: <%=obj.warehouse_maxlevel %>  <br>
                New Warehouse Max Bin: <%=obj.warehouse_maxbin %>  <br>
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
