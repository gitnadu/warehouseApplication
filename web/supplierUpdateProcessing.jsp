<%-- 
    Document   : employeeUpdateProcessing
    Created on : 11 15, 23, 8:11:11 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating Supplier Record</title>
    </head>
    <body>
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        <form action="supplierUpdate.jsp"> 
            <%              
                int status = supp.update_supplier();
                if (status == 1){
            %>
            <h1>Updating Supplier Successful </h1>
            <% } else { %>
            <h1>Updating Supplier Unsuccessful </h1>
            <% } %>
            

            <input type="submit" value="Update a record again">
        </form>
        
        <button onclick = "window.location.href = 'supplier.html';"> Back to Main Menu </button>
    </body>
</html>
