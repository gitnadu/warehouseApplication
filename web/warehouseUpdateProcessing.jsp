<%-- 
    Document   : warehouseUpdateProcessing
    Created on : 11 18, 23, 10:47:54 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, warehouseMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="warehouseUpdate.jsp"> 
            <%              
                int status = ware.update_warehouse();
                if (status == 1){
            %>
            <h1>Record Successfully Updated!</h1>
            <% } else { %>
            <h1>Record Unsuccessfully Updated..</h1>
            <% } %>
            <hr><br><br>
            <input type="submit" value="Update a Record Again"><br><br>
        </form>
        
        <button onclick = "window.location.href = 'warehouse.html';"> Back to Main Menu </button>
    </body>
</html>
