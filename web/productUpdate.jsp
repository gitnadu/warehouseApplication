<%-- 
    Document   : productUpdate
    Created on : 11 21, 23, 1:14:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update a Product</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Update a Product</h2>
        <hr><br>
        
       <form action="supplierUpdateForm.jsp"> 
            <jsp:useBean id="prod" class="productMgmt.product" scope="session" />
            <table>
                <tr>
                    <td>Supplier ID: </td>
                    <td><select id="supplier_idU" name="supplier_idU"> 
            <%  prod.get_product_IDs();
                for(int i=0;i<prod.product_product_IDList.size();i++){
            %>
            <option value="<%=prod.product_product_IDList.get(i) %>" > <%=prod.product_product_IDList.get(i) %> </option>
            <% } %>
            </select> </td>
                </tr>
            </table><br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'product.html';">Cancel</button>
    </center></body>
</html>
