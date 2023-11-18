<%-- 
    Document   : supplierUpdate
    Created on : 11 18, 23, 9:23:51 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
    </head>
    <body>
        <h2> Update Employee </h2>
        <form action="supplierUpdateForm.jsp"> 
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            Supplier ID: <select id="supplier_idU" name="supplier_idU"> 
            <%  supp.get_suppliers();
                for(int i=0;i<supp.supplier_ID_list.size();i++){
            %>
            <option value="<%=supp.supplier_ID_list.get(i) %>" > <%=supp.supplier_ID_list.get(i) %>: <%=supp.supplier_name_list.get(i) %> </option>
            <% } %>
            </select> <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>

