<%-- 
    Document   : supplierRegisterProcessing
    Created on : 11 18, 23, 2:56:59 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Supplier Processing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
            <jsp:useBean id="obj" class="supplierMgmt.supplier" scope="session" />
            <% //Receive the values from registerSupplier.html
                obj.supplier_name = request.getParameter("supplier_name");
                obj.supplier_contact_number = request.getParameter("supplier_contact_number");
                obj.office_address = request.getParameter("office_address");
                obj.office_phone_number = request.getParameter("office_phone_number");
       
                int status = obj.register_supplier();
                if (status == 1) {
            %>
            
            <h1>Registering Supplier Successful</h1>
            New Employee Supplier ID: <%=obj.supplier_ID %>  <br><br>
            New Employee Supplier Name: <%=obj.supplier_name %>  <br>
            New Employee Supplier Contact Number: <%=obj.supplier_contact_number %> <br>
            New Employee Office Address: <%=obj.office_address %>  <br>
            New Employee Office Phone Number: <%=obj.office_phone_number %> <br>
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
