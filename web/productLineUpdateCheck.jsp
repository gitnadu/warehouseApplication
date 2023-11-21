<%-- 
    Document   : productLineUpdateCheck
    Created on : 11 21, 23, 6:43:15 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, productMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Double Check Changes</h2>
        <hr><br>
        
        <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
        <form action="productLineUpdateProcessing.jsp"> 
            <%  prol.product_line_name_temporary  = request.getParameter("product_line_nameU");
                prol.brand_temporary = request.getParameter("brandU");
                prol.category_temporary = request.getParameter("categoryU");
                prol.product_line_description_temporary = request.getParameter("product_line_descriptionU");
                
                String temp = request.getParameter("isActiveU");
                if (temp.equals("true"))
                    prol.isActive_temporary = true;
                else
                    prol.isActive_temporary = false;
            %>
            
            <table style = "width: 100%">
                <h2>Original Details: </h2>
                <tr>
                    <td>Product Line Name:</td>
                    <td>Brand:</td>
                    <td>isActive:</td>
                    <td>Category:</td>
                    <td>Product Line Description:</td>
                </tr>
                <tr>
                    <td> <%=prol.product_line_name%> </td>
                    <td><%=prol.brand%> </td>
                    <td><%=prol.isActive%> </td>
                    <td><%=prol.category %> </td>
                    <td><%=prol.product_line_description%> </td>
                </tr>
            </table>
                
            <hr class="short">
            
            <table style = "width: 100%">
                <h2>New Details: </h2>
                <tr>
                    <td>Product Line Name:</td>
                    <td>Brand:</td>
                    <td>isActive:</td>
                    <td>Category:</td>
                    <td>Product Line Description:</td>
                </tr>
                <tr>
                    <td> <%=prol.product_line_name_temporary%> </td>
                    <td><%=prol.brand_temporary%> </td>
                    <td><%=prol.isActive_temporary%> </td>
                    <td><%=prol.category_temporary %> </td>
                    <td><%=prol.product_line_description_temporary%> </td>
                </tr>
            </table><br>
            <input type="submit" value="Save Changes!"><br><br>
        </form>
        <button onclick = "window.location.href = 'productLineUpdate.jsp';"> Cancel Update </button>
    </center></body>
</html>
