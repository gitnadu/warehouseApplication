<%-- 
    Document   : productUpdateProcessing
    Created on : 11 21, 23, 5:33:17 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, productMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h1>Update Product</h1>
        <hr><br>
        
       <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
        <form action="supplierUpdate.jsp"> 
            <%              
                int status = prod.update_product();
                if (status == 1){
            %>
            <h1>Success! You've updated an product! </h1>
            <% } else { %>
            <h1>Updating Product Unsuccessful </h1>
            <% } %>
            

            <input type="submit" value="Update a Record Again"><br><br>
        </form>
        
        <button onclick = "window.location.href = 'employee.html';"> Back to Menu </button>
    </body>
</html>

