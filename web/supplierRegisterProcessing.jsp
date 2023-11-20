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
    </head>
    <body>
            <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
            <% //Receive the values from registerSupplier.html
                supp.supplier_name = request.getParameter("supplier_name");
                supp.supplier_contact_number = request.getParameter("supplier_contact_number");
                supp.office_address = request.getParameter("office_address");
                supp.office_phone_number = request.getParameter("office_phone_number");
       
                int status = supp.register_supplier();
                if (status == 1) {
            %>
            
            <h1>Registering Supplier Successful</h1>
            New Employee Supplier ID: <%=supp.supplier_ID %>  <br><br>
            New Employee Supplier Name: <%=supp.supplier_name %>  <br>
            New Employee Supplier Contact Number: <%=supp.supplier_contact_number %> <br>
            New Employee Office Address: <%=supp.office_address %>  <br>
            New Employee Office Phone Number: <%=supp.office_phone_number %> <br>
            <button onclick = "window.location.href = 'supplier.html';"> Back to Supplier Menu </button>
            <button onclick = "window.location.href = 'supplierRegister.html';"> Register Another Supplier </button>
            <% } else {
            %>
            <h1>Registering Supplier Failed</h1>
            <button onclick = "window.location.href = 'supplierRegister.html';"> Retry </button>
            <% }
            %>
    </body>
</html>
