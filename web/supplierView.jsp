<%-- 
    Document   : supplierView
    Created on : 11 18, 23, 8:02:12 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Employee</title>
    </head>
    <body>
        <h2> View Supplier </h2>
        <form action="supplierViewProcessing.jsp"> 
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            Employee ID: <select id="supplier_idV" name="supplier_idV"> 
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

