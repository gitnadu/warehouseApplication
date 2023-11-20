<%-- 
    Document   : productlineUpdate
    Created on : 11 20, 23, 6:24:49 PM
    Author     : ccslearner
--%>

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
        <h2>Update a Product Line</h2>
        <hr><br>
        
       <form action="productLineUpdateForm.jsp"> 
            <jsp:useBean id="prol" class="productMgmt.product_line" scope="session" />
            <table>
                <tr>
                    <td> Product Line </td>
                    <td><select id="productline_idU" name="productline_idU"> 
            <%  prol.get_product_lines();
                for(int i=0;i<prol.product_line_IDList.size();i++){
            %>
            <option value="<%=prol.product_line_IDList.get(i) %>" > <%=prol.product_line_IDList.get(i) %>: <%=prol.product_line_nameList.get(i) %> </option>
            <% } %>
            </select> </td>
                </tr>
            </table><br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';">Cancel</button>
    </center></body>
</html>
