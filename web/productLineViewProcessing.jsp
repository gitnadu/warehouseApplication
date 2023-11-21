<%-- 
    Document   : supplierViewProcessing
    Created on : 11 18, 23, 8:04:20 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product Line Record</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Success! Viewing Product Line Record..</h2>
        <hr><br>
        
         <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
        
        <% 
            String temp = request.getParameter("product_line_IDV");
            prol.product_line_ID = Integer.parseInt(temp); 
            int status = prol.get_product_line_record();
            if (status == 1){
        %>
        <form action="productLineView.jsp"> 
            <table>
                <tr>
                    <td>Product Line Name: </td>
                    <td><%=prol.product_line_name%></td>
                </tr>
                
                <tr>
                    <td>Product Line Brand: </td>
                    <td><%=prol.brand%></td>
                </tr>
                
                <tr>
                    <td>Product Line isActive: </td>
                    <td><%=prol.isActive%></td>
                </tr>
                
                <tr>
                    <td>Product Line Category: </td>
                    <td><%=prol.category%></td>
                </tr>
                
                <tr>
                    <td>Product Line Description: </td>
                    <td><%=prol.product_line_description%></td>
                </tr>
            </table>
            <input type="submit" value="View Again">
        </form>
        <% } else { %>
        <h2> Unsuccessful </h2>
        <% } %>
        
         
            <button onclick = "window.location.href = 'productLine.html';"> Back to Menu </button>
    </body>
</html>
