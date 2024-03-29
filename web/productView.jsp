<%-- 
    Document   : supplierView
    Created on : 11 18, 23, 8:02:12 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>View a Product</h2>
        <hr><br>
        
        <form action="productViewProcessing.jsp"> 
            <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
            
            Product ID: <select id="product_idV" name="product_idV"> 
            <%  prod.get_product_IDs();
                for(int i=0;i<prod.product_product_IDList.size();i++){
            %>
            <option value="<%=prod.product_product_IDList.get(i) %>" > <%=prod.product_product_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit"><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';">Cancel</button>
    </body>
</html>

