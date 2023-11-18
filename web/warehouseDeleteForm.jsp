<%-- 
    Document   : warehouseDeleteForm
    Created on : 11 18, 23, 11:45:22 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Supplier Record</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h2> Delete Supplier Record </h2>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <% 
            
            String temp = request.getParameter("warehouse_idD");
            ware.warehouse_ID = Integer.valueOf(temp); 
            int status = ware.get_warehouse_record();
            if (status == 1){
        %>
        <% } %>
        <form action="warehouseDeleteProcessing.jsp"> 
            Warehouse ID: <%=ware.warehouse_ID %>  <br><br>
            Warehouse City: <%=ware.warehouse_city %>  <br>
            Warehouse Phone Number: <%=ware.warehouse_phonenumber %> <br>
            Warehouse First Address: <%=ware.warehouse_first_address %>  <br>
            Warehouse State: <%=ware.warehouse_state %> <br>
            Warehouse Country:  <%=ware.warehouse_country %> <br>
            Warehouse Postal Code: <%=ware.warehouse_postalcode %> <br>
            Warehouse Max Row: <%=ware.warehouse_maxrow%> <br>
            Warehouse Max Bay: <%=ware.warehouse_maxbay %>  <br>
            Warehouse Max Level: <%=ware.warehouse_maxlevel %>  <br>
            Warehouse Max Bin: <%=ware.warehouse_maxbinNumber %>  <br>
            <input type="submit" value="Proceed">
        </form> 
            <button onclick = "window.location.href = 'index.html';"> Back to Main Menu </button>
    </body>
</html>
