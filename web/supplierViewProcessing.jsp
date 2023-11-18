<%-- 
    Document   : supplierViewProcessing
    Created on : 11 18, 23, 8:04:20 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viewing Inventory Employee Record</title>
    </head>
    <body>
        <h2> Viewing Inventory Employee Record </h2>
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        
        <% 
            String temp = request.getParameter("supplier_idV");
            supp.supplier_ID = Integer.valueOf(temp); 
            int status = supp.get_supplier_record();
            if (status == 1){
        %>
        <h2> Success </h2>
        <% } else { %>
        <h2> Nope </h2>
        <% } %>
        <form action="supplierView.jsp"> 
            Supplier Name: <td> <%=supp.supplier_name%> </td> <br>
            Supplier Contact Number: <td><%=supp.supplier_contact_number%> </td> <br>
            Supplier Office Address: <td><%=supp.office_address %> </td> <br>
            Supplier Office Phone Number <td><%=supp.office_phone_number%> </td> <br>
            <input type="submit" value="View again">
        </form> 
            <button onclick = "window.location.href = 'index.html';"> Back to Main Menu </button>
    </body>
</html>
