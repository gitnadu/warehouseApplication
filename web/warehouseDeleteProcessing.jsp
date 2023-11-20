<%-- 
    Document   : warehouseDeleteProcessing
    Created on : 11 18, 23, 11:48:13 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="warehouseDelete.jsp"> 
            
            <% 
                int status = ware.delete_warehouse();
                if (status == 1){
            %>
            <h1>Record is Deleted </h1>
            <% } else { %>
            <h1>Record is unsuccessfully Deleted </h1>
            <% } %>
            <input type="submit" value="Delete again">
        </form>
        <button onclick = "window.location.href = 'index.html';"> Back to Main Menu </button>
        
    </body>
</html>
