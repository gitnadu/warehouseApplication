<%-- 
    Document   : productlineUpdateForm
    Created on : 11 21, 23, 6:31:15 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Line</title>
    </head>
    <body><center>
        <h2>Update a Product Line Form</h2>
        <hr><br>

        <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
        
        <% 
            String temp = request.getParameter("productline_idU");
            prol.product_line_ID = Integer.valueOf(temp); 
            int status = prol.get_product_line_record();
            if (status == 1){
        %>
        
        <form action="productLineUpdateCheck.jsp">
            <table>
                <tr>
                    <td>Product Line Name:</td>
                    <td><input type="text" id="product_line_nameU" name="product_line_nameU" value="<%=prol.product_line_name%>"required><br><br> </td>
                </tr>
                <tr>
                    <td>Brand:</td>
                    <td><input type="text" id="brandU" name="brandU" value="<%=prol.brand%>"required><br><br></td>
                </tr>
                <tr>
                    <td>Category:</td>
                    <td><input type="text" id="categoryU" name="categoryU" value="<%=prol.category%>" required><br><br> </td>
                </tr>
                <tr>
                    <td>Product Line Description:</td>
                    <td><input type="text" id="product_line_descriptionU" name="product_line_descriptionU" value="<%=prol.product_line_description%>"required><br><br></td>
                </tr>
            </table><br>
            <input type="submit" value="Next"><br><br>
        </form>
        
        <% } else { %>
        <% } %>
        
        <button onclick = "window.location.href = 'supplierUpdate.jsp';"> Go Back </button>
        <button onclick = "window.location.href = 'supplier.html';"> Cancel Update </button>
    </center></body>
</html>
