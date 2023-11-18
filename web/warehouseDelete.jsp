<%-- 
    Document   : warehouseDelete
    Created on : 11 18, 23, 11:42:56 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Delete Supplier</title>
    </head>
    <body>
        <h2> Delete Supplier </h2>
        <form action="warehouseDeleteForm.jsp"> 
            <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
            Employee ID: <select id="warehouse_idD" name="warehouse_idD"> 
            <%  ware.get_warehouses();
                for(int i=0;i<ware.warehouse_IDList.size();i++){
            %>
            <option value="<%=ware.warehouse_IDList.get(i) %>" > <%=ware.warehouse_IDList.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>