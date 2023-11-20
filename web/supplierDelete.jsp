<%-- 
    Document   : supplierDelete
    Created on : 11 18, 23, 8:12:47 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Delete Supplier</title>
    </head>
    <body>
        <h2> Delete Supplier </h2>
        <form action="supplierDeleteForm.jsp"> 
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            Employee ID: <select id="supplier_idD" name="supplier_idD"> 
            <%  supp.get_supplier_IDs();
                for(int i=0;i<supp.supplier_ID_list.size();i++){
            %>
            <option value="<%=supp.supplier_ID_list.get(i) %>" > <%=supp.supplier_ID_list.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
