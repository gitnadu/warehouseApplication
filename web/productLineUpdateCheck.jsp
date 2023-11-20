<%-- 
    Document   : productLineUpdateCheck
    Created on : 11 21, 23, 6:43:15 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
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
        <h2>Double Check Changes</h2>
        <hr><br>
        
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        <form action="productLineUpdateProcessing.jsp"> 
            <%  supp.supplier_name_temporary  = request.getParameter("product_line_nameU");
                supp.supplier_contact_number_temporary = request.getParameter("supplier_contact_numberU");
                supp.office_address_temporary = request.getParameter("office_addressU");
                supp.office_phone_number_temporary = request.getParameter("office_phone_numberU");
                int status = supp.get_supplier_record();
            %>
            
            <table style = "width: 100%">
                <h2>Original Details: </h2>
                <tr>
                    <td>Supplier Name:</td>
                    <td>Contact Number:</td>
                    <td>Office Address:</td>
                    <td>Office Phone Number:</td>
                </tr>
                <tr>
                    <td> <%=supp.supplier_name%> </td>
                    <td><%=supp.supplier_contact_number%> </td>
                    <td><%=supp.office_address %> </td>
                    <td><%=supp.office_phone_number%> </td>
                </tr>
            </table>
                
            <hr class="short">
            
            <table style = "width: 100%">
                <h2>New Details: </h2>
                <tr>
                    <td>Supplier Name:</td>
                    <td>Contact Number:</td>
                    <td>Office Address:</td>
                    <td>Office Phone Number:</td>
                </tr>
                <tr>
                    <td> <%=supp.supplier_name_temporary%> </td>
                    <td><%=supp.supplier_contact_number_temporary%> </td>
                    <td><%=supp.office_address_temporary %> </td>
                    <td><%=supp.office_phone_number_temporary%> </td>
                </tr>
            </table><br>
            <input type="submit" value="Save Changes!"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplierUpdate.jsp';"> Cancel Update </button>
    </center></body>
</html>
