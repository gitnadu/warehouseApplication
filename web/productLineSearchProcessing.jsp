<%-- 
    Document   : productLineSearchProcessing
    Created on : 11 21, 23, 7:13:29 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, productMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Suppliers</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Search Results:</h2>
        <hr><br>
        
        <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
        <form action="productLineSearch.html"> 
     
            <% 
                prol.product_line_name_holder = request.getParameter("product_linenameS");
                prol.brand_holder = request.getParameter("brandS");
                prol.category_holder = request.getParameter("categoryS");

                int status = prol.search_productline();
                if (status == 1){
            %>
            
            <table style = "width:100%">
                <tr> 
                    <td> Product Line Name:</td>
                    <td> Brand:</td>
                    <td> isActive:</td>
                    <td> Category:</td>
                    <td> Product Line Description:</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                    <% 
                       for(int i=0;i<prol.productline_search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=prol.product_line_nameList.get(i) %> </td> 
                        <td><%=prol.brandList.get(i) %> </td> 
                        <td><%=prol.isActiveList.get(i) %></td>
                        <td><%=prol.categoryList.get(i) %> </td>
                        <td><%=prol.product_line_descriptionList.get(i) %> </td>
                       <tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>There is no record that matches your search query..</h1>
            <% } %>
            <br><input type="submit" value="Search Again"><br><br>
        </form>
        <button onclick = "window.location.href = 'productLine.html';"> Back to Menu </button>
    </body>
</html>
