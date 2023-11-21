<%-- 
    Document   : productCheckingValidation
    Created on : 11 22, 23, 3:51:11 AM
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
        
        <form action="productCheckingCompletion.jsp"> 
 
        <%
            // check.update_stocktransfer();
            check.products_disposed.clear();
            check.products_checked.clear();
        for (int i = 0; i < check.products_warehouse.size()-1; i++) {
            String itemName = "item ".concat(Integer.toString(i+1));
            String itemValue = request.getParameter(itemName);
        %>
        
        <%
            if (itemValue.equals(new String("disposed")))
                check.products_disposed.add(check.products_warehouse.get(i)); 
            
            check.products_checked.add(check.products_warehouse.get(i));
        %>
        <% } 
        %>
        
        <input type="submit" value="Submit">
        </form>
            
            
        
  
    </body>
</html>