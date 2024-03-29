<%-- 
    Document   : supplierView
    Created on : 11 18, 23, 8:02:12 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Supplier</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>View a Supplier</h2>
        <hr><br>
        
        <form action="supplierViewProcessing.jsp"> 
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            Supplier ID: <select id="supplier_idV" name="supplier_idV"> 
            <%  supp.get_supplier_IDs();
                for(int i=0;i<supp.supplier_ID_list.size();i++){
            %>
            <option value="<%=supp.supplier_ID_list.get(i) %>" > <%=supp.supplier_ID_list.get(i) %> </option>
            <% } %>
            </select> <br><br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';">Cancel</button>
    </center></body>
</html>

