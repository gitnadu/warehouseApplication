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
        <title>Register Product Line Processing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
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
   
            <h1>Success! Registered New Product Line!</h1>
            <hr><br>

            <table>
                <tr>
                    <td>New Product Line ID: </td>
                    <td><%=prol.product_line_ID %> </td>
                </tr>
                
                <tr>
                    <td>New Product Line Name: </td>
                    <td><%=prol.product_line_name %> </td>
                </tr>
                
                <tr>
                    <td>New Brand: </td>
                    <td><%=prol.brand %> </td>
                </tr>
                
                <tr>
                    <td>New Category: </td>
                    <td><%=prol.category %>  </td>
                </tr>
                
                <tr>
                    <td>New Product Line Description: </td>
                    <td><%=prol.product_line_description %> </td>
                </tr>
            </table>
            
            <button onclick = "window.location.href = 'productLine.html';"> Back to Menu </button>
            <button onclick = "window.location.href = 'productLineRegister.html';"> Register Another Product Line </button>
                <% 
            } else { 
                %>
                <h1>Registering Product Line Failed </h1>
                <button onclick = "window.location.href = 'productLineRegister.html';"> Retry </button>
            <% }
        %>
    </body>
</html>
