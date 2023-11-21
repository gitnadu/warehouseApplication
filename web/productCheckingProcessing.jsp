<%-- 
    Document   : productCheckingProcessing
    Created on : 11 22, 23, 3:24:57 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="check" class="warehouseMgmt.inventory_physical_checking" scope="session" />
        
        <form action="productCheckingValidation.jsp"> 
        <%
            String temp = request.getParameter("checking_productline");
            check.product_line_ID = Integer.valueOf(temp);
            check.get_products();
        %>
        
        Pick products to be checked: <br><br>
        <%  
            for(int i=0;i<check.products_warehouse.size();i++){
        %>
         <%=check.products_warehouse.get(i)%>
        <%
            
            if(check.products_status.get(i).equals("stored")) {
        %>
            <select name="item <%=i%>" id="item <%=i%>"> 
                <option value="<%=check.products_status.get(i) %>"> <%=check.products_status.get(i) %> </option>
                <option value="disposed"> disposed </option>
            </select> <br>
           <% } else { %>
            <select name="item <%=i%>" id="item <%=i%>">
                <option value="<%=check.products_status.get(i) %>"> <%=check.products_status.get(i) %> </option>
                <option value="stored"> stored </option>
            </select> <br>
        <% }} %>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
