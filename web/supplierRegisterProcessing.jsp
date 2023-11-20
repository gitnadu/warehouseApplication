<%-- 
    Document   : supplierRegisterProcessing
    Created on : 11 18, 23, 2:56:59 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Supplier Processing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            <% //Receive the values from registerSupplier.html
                supp.supplier_name = request.getParameter("supplier_name");
                supp.supplier_contact_number = request.getParameter("supplier_contact_number");
                supp.office_address = request.getParameter("office_address");
                supp.office_phone_number = request.getParameter("office_phone_number");
       
                int status = supp.register_supplier();
                if (status == 1) {
            %>
            
            <h1>Success! Registered New Supplier!</h1>
            <hr><br>
            
            <table>
                <tr>
                    <td>New Employee Supplier ID:</td>
                    <td><%=supp.supplier_ID %></td>
                </tr>
                <tr>
                    <td>New Employee Supplier Name:</td>
                    <td><%=supp.supplier_name %></td>
                </tr>
                <tr>
                    <td>New Employee Supplier Contact Number:</td>
                    <td><%=supp.supplier_contact_number %></td>
                </tr>
                <tr>
                    <td>New Employee Office Address</td>
                    <td><%=supp.office_address %></td>
                </tr>
                <tr>
                    <td>New Employee Office Phone Number:</td>
                    <td><%=supp.office_phone_number %></td>
                </tr>
            </table><br>
            <button onclick = "window.location.href = 'supplier.html';"> Back to Supplier Menu </button>
            <button onclick = "window.location.href = 'supplierRegister.html';"> Register Another Supplier </button>
            <% } else {
            %>
            <h1>Registering Supplier Failed</h1>
            <button onclick = "window.location.href = 'supplierRegister.html';"> Retry </button>
            <% }
            %>
    </center></body>
</html>
