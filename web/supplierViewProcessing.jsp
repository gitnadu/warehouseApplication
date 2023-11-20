<%-- 
    Document   : supplierViewProcessing
    Created on : 11 18, 23, 8:04:20 PM
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
        <h2>Success! Viewing Supplier Record..</h2>
        <hr><br>
        
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        
        <% 
            String temp = request.getParameter("supplier_idV");
            supp.supplier_ID = Integer.valueOf(temp); 
            int status = supp.get_supplier_record();
            if (status == 1){
        %>
        <h2></h2>
        <% } else { %>
        <h2></h2>
        <% } %>
        <form action="supplierView.jsp"> 
            <table>
                <tr>
                    <td>Supplier Name:</td>
                    <td><%=supp.supplier_name%></td>
                </tr>
                <tr>
                    <td>Supplier Contact Number:</td>
                    <td><%=supp.supplier_contact_number%></td>
                </tr>
                <tr>
                    <td>Office Address:</td>
                    <td><%=supp.office_address %></td>
                </tr>
                <tr>
                    <td>Office Phone Number:</td>
                    <td><%=supp.office_phone_number%></td>
                </tr>
            </table><br>
            <input type="submit" value="View Again"><br><br>
        </form> 
            <button onclick = "window.location.href = 'supplier.html';"> Back to Menu </button>
    </body>
</html>
