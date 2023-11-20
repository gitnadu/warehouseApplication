<%-- 
    Document   : registerInventoryEmployee_processing
    Created on : 11 14, 23, 12:04:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register Product Line Processing </title>
    </head>
    <body>
        <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
        <%
            prol.product_line_name = request.getParameter("product_line_name");
            prol.brand = request.getParameter("brand");
            prol.isActive = true;
            prol.category = request.getParameter("category");
            prol.product_line_description = request.getParameter("product_line_description");

            int status = prol.register_product_line();
            if (status == 1) {
                %>
   
             <h1>Registering Product Line Successful</h1>
            New Product Line ID: <%=prol.product_line_ID %>  <br><br>
            New Product Line Name: <%=prol.product_line_name %>  <br>
            New Brand: <%=prol.brand %> <br>
            New Category: <%=prol.category %>  <br>
            New Product Line Description: <%=prol.product_line_description %> <br>
            <button onclick = "window.location.href = 'productLine.html';"> Back to Supplier Menu </button>
            <button onclick = "window.location.href = 'productLineRegister.html';"> Register Another Supplier </button>
                <% 
            } else { 
                %>
                <h1>Registering Product Line Unsuccessful </h1>
                <button onclick = "window.location.href = 'productLineRegister.html';"> Retry </button>
            <% }
        %>
    </body>
</html>
