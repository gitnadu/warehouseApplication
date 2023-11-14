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
        <title> Register Product Line Processing </title>
    </head>
    <body>
        <jsp:useBean id="obj" class="productMgmt.Products" scope="session" />
        <%
            obj.product_line_name = request.getParameter("product_line_name");
            obj.brand = request.getParameter("brand");
            obj.isActive = 1;
            obj.category = request.getParameter("category");
            obj.product_line_description = request.getParameter("product_line_description");

            int status = obj.register_product_line();
            if (status == 1) {
                %>
                <h1>Registering Product Line Successful</h1>
                <% 
            } else { 
                %>
                <h1>Registering Product Line Unsuccessful </h1>
            <% }
        %>
    </body>
</html>
