<%-- 
    Document   : productTransferProcessing
    Created on : 11 22, 23, 12:09:40 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
        
    </head>
    <body>
        <jsp:useBean id="transfer" class="productMgmt.transfer" scope="session" />
        <form action="productTransferProcessing.jsp"> 
            
            <% 
            String temp = request.getParameter("transfer_warehouse");
            transfer.transfer_warehouse_origin_ID = Integer.valueOf(temp); 
            transfer.transfer_employee_in_charge_ID = Integer.valueOf(request.getParameter("transfer_employee"));
            transfer.get_products();
            %>
            Warehouse Origin ID: <%=transfer.transfer_warehouse_origin_ID%> <br>

            Pick products to be transferred:<br><br>
            <% 
                for (int i = 1; i <= transfer.transfer_products_from_warehouse.size(); i++) {
            %>
            <label><input type="checkbox" name="item <%=i%>" id="item <%=i%>"value = "<%=transfer.transfer_products_from_warehouse.get(i-1)%>"> Product ID: <%= transfer.transfer_products_from_warehouse.get(i-1) %></label><br>
            
            <%
                }
            %>
            
            <input type="submit" value="Submit">
        </form>
        
    
        
    
    </body>
</html>
