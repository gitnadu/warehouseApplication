<%-- 
    Document   : supplierDeleteForm
    Created on : 11 18, 23, 8:32:44 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Supplier Record</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h2> Delete Supplier Record </h2>
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        <% 
            
            String temp = request.getParameter("supplier_idD");
            supp.supplier_ID = Integer.valueOf(temp); 
            int status = supp.get_supplier_record();
            if (status == 1){
        %>
        <% } %>
        <form action="supplierDeleteProcessing.jsp"> 
            Supplier Name: <td> <%=supp.supplier_name%> </td> <br>
            Supplier Contact Number: <td><%=supp.supplier_contact_number%> </td> <br>
            Supplier Office Address: <td><%=supp.office_address %> </td> <br>
            Supplier Office Phone Number <td><%=supp.office_phone_number%> </td> <br>
            <input type="submit" value="Proceed">
        </form> 
            <button onclick = "window.location.href = 'index.html';"> Back to Main Menu </button>
    </body>
</html>
