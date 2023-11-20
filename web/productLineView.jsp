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
        <title>Viewing Product Line</title>
    </head>
    <body>
        <h2>View Product Line</h2>
        <form action="productLineViewProcessing.jsp"> 
            <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
            Product Line ID: <select id="product_line_IDV" name="product_line_IDV"> 
                <option value=""> </option>
            <%  prol.get_product_line_IDs();
                for(int i=0;i<prol.product_line_IDList.size();i++){
            %>
            <option value="<%=prol.product_line_IDList.get(i) %>" > <%=prol.product_line_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>  

