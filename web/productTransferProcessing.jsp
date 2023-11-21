<%-- 
    Document   : productTransferrProcessing
    Created on : 11 22, 23, 12:21:03 AM
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
        <jsp:useBean id="transfer" class="productMgmt.transfer" scope="session" />
        
        <form action="productTransferCompletion.jsp"> 
            
        Warehouse Destination ID <select id="transfer_warehousedest" name="transfer_warehousedest"> 
                <option value=""> </option>
        <%  transfer.get_warehouses_destination();
            for(int i=0;i<transfer.transfer_warehouse_ID_list_excluded.size();i++){
        %>
        <option value="<%=transfer.transfer_warehouse_ID_list_excluded.get(i) %>"> <%=transfer.transfer_warehouse_ID_list_excluded.get(i) %> </option>
        <% } %>
        
        <%
            
        for (int i = 1; i <= transfer.transfer_products_from_warehouse.size(); i++) {
            String itemName = "item ".concat(Integer.toString(i));
            String itemValue = request.getParameter(itemName);
        %>
        <script>
               console.log(<%=itemValue%>);
        </script>
        
        <%
            if (itemValue != null) 
                transfer.transfer_selected_products.add(Integer.parseInt(itemValue)); %>
          <%=transfer.transfer_selected_products.size()%>
        <% } 
        %>
            
            <input type="submit" value="Submit">
        </form>
            
            
        
  
    </body>
</html>
