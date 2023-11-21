<%-- 
    Document   : productUpdate
    Created on : 11 21, 23, 1:14:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Update a Supplier</h2>
        <hr><br>
        
       <form action="supplierUpdateForm.jsp"> 
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            <table>
                <tr>
                    <td>Supplier ID: </td>
                    <td><select id="supplier_idU" name="supplier_idU"> 
            <%  supp.get_suppliers();
                for(int i=0;i<supp.supplier_ID_list.size();i++){
            %>
            <option value="<%=supp.supplier_ID_list.get(i) %>" > <%=supp.supplier_ID_list.get(i) %>: <%=supp.supplier_name_list.get(i) %> </option>
            <% } %>
            </select> </td>
                </tr>
            </table><br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';">Cancel</button>
    </center></body>
</html>
