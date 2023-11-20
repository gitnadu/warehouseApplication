<%-- 
    Document   : supplierUpdateForm
    Created on : 11 18, 23, 9:28:34 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier</title>
    </head>
    <body><center>
        <h2>Update a Supplier Form</h2>
        <hr><br>

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
            <table>
                <tr>
                    <td>Supplier Name:</td>
                    <td><input type="text" id="supplier_nameU" name="supplier_nameU" value="<%=supp.supplier_name%>"></td>
                </tr>
                <tr>
                    <td>Supplier Contact Number:</td>
                    <td><input type="text" id="supplier_contact_numberU" name="supplier_contact_numberU" value="<%=supp.supplier_contact_number%>"></td>
                </tr>
                <tr>
                    <td>Office Address:</td>
                    <td><input type="text" id="office_addressU" name="office_addressU" value="<%=supp.office_address%>"></td>
                </tr>
                <tr>
                    <td>Office Phone Number:</td>
                    <td><input type="text" id="office_phone_numberU" name="office_phone_numberU" value="<%=supp.office_phone_number%>"></td>
                </tr>
            </table><br>
            <input type="submit" value="Next"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplierUpdate.jsp';"> Go Back </button>
        <button onclick = "window.location.href = 'supplier.html';"> Cancel Update </button>
    </center></body>
</html>
