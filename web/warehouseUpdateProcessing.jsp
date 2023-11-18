<%-- 
    Document   : warehouseUpdateProcessing
    Created on : 11 18, 23, 10:47:54 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating Warehouse Record</title>
    </head>
    <body>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="supplierUpdate.jsp"> 
            <%              
                int status = ware.update_warehouse();
                if (status == 1){
            %>
            <h1>Updating Warehouse Successful </h1>
            <% } else { %>
            <h1>Updating Warehouse Unsuccessful </h1>
            <% } %>
            

            <input type="submit" value="Update a record again">
        </form>
        
        <button onclick = "window.location.href = 'warehouse.html';"> Back to Main Menu </button>
    </body>
</html>
