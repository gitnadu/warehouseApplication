<%-- 
    Document   : productLineUpdateProcessing
    Created on : 11 21, 23, 6:53:14 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Line</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
        <form action="supplierUpdate.jsp"> 
            <%              
                int status = prol.update_productline();
                if (status == 1){
            %>
            <h2>Record Successfully Updated!</h2>
            <% } else { %>
            <h2>Record Unsuccessfully Updated..</h2>
            <% } %>
            <hr><br><br>
            <input type="submit" value="Update a Record Again"><br><br>
        </form>
        
        <button onclick = "window.location.href = 'productLine.html';"> Back to Main Menu </button>
    </center></body>
</html>

