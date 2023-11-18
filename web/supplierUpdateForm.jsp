<%-- 
    Document   : supplierUpdateForm
    Created on : 11 18, 23, 9:28:34 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier Form</title>
    </head>
    <body>
        <h2> Update Supplier Form </h2>
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        
        <% 
            String temp = request.getParameter("supplier_idU");
            supp.supplier_ID = Integer.valueOf(temp); 
            int status = supp.get_supplier_record();
            if (status == 1){
        %>
        <% } else { %>
        <% } %>
        <form action="supplierUpdateCheck.jsp"> 
            Supplier Name: <input type="text" id="supplier_nameU" name="supplier_nameU" value="<%=supp.supplier_name%>"><br>
            Supplier Contact Number: <input type="text" id="supplier_contact_numberU" name="supplier_contact_numberU" value="<%=supp.supplier_contact_number%>"><br>
            Office Address: <input type="text" id="office_addressU" name="office_addressU" value="<%=supp.office_address%>"><br>
            Office Phone Number: <input type="text" id="office_phone_numberU" name="office_phone_numberU" value="<%=supp.office_phone_number%>"><br>
            <br> <input type="submit" value="Next">
        </form> 
        <br>
        <button onclick = "window.location.href = 'supplier.html';"> Cancel Update </button>
    </body>
</html>
