<%-- 
    Document   : productTransferUpdate
    Created on : 11 22, 23, 1:01:55 AM
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
        <form action="productTransferUpdateForm.jsp"> 
            <jsp:useBean id="transfer" class="productMgmt.product_line" scope="session" />
            
             <% 
                String temp = request.getParameter("transfer_inventoryID");
                transfer.transfer_status = Integer.valueOf(temp);
                transfer.get_transfer_IDs();
             %>
            
            Inventory Transfer ID <select id="transfer_inventoryID" name="transfer_inventoryID"> 
                <option value=""> </option>
            <%  
                for(int i=0;i<transfer.transfer_transfer_ID_list.size();i++){
            %>
                <option value="<%=transfer.transfer_transfer_ID_list.get(i) %>" > <%=transfer_transfer_ID_list.get(i) %> </option>
            <% } %>
            
            </select> <br> 
        <input type="submit" value="Submit">
        
        
    </body>
</html>
