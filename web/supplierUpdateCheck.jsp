<%-- 
    Document   : supplierUpdateCheck
    Created on : 11 18, 23, 9:29:11 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, supplierMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier Check</title>
    </head>
    <body>
        <h2> Updating Supplier Check </h2>
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        <form action="supplierUpdateProcessing.jsp"> 
     public int supplier_ID;
    public String supplier_name;
    public String supplier_contact_number;
    public String office_address;
    public String office_phone_number;
            <%  supp.supplier_name_temporary  = request.getParameter("supplier_nameU");
                supp.supplier_contact_number_temporary = request.getParameter("supplier_contact_numberU");
                supp.office_address_temporary = request.getParameter("office_addressU");
                supp.office_phone_number_temporary = request.getParameter("office_phone_numberU");
                int status = supp.get_supplier_record();
            %>
            
            <table>
                <th> OLD RECORD
                <tr> 
                    <th> Supplier Name </th> &nbsp;
                    <th> Supplier Contact Number </th> &nbsp;
                    <th> Supplier Office Address </th> &nbsp;
                    <th> Supplier Office Phone Number </th> &nbsp;
                </tr>
                    <tr> 
                     
                     <td> <%=supp.supplier_name%> </td> &nbsp;
                     <td><%=supp.supplier_contact_number%> </td> &nbsp;
                     <td><%=supp.office_address %> </td>&nbsp;
                     <td><%=supp.office_phone_number%> </td>&nbsp;
                    
                    <tr>
            </table>
                    
                    <br>
            <table>
                <th> NEW RECORD </th>
                <tr> 
                    <th> Supplier Name </th> &nbsp;
                    <th> Supplier Contact Number </th> &nbsp;
                    <th> Supplier Office Address </th> &nbsp;
                    <th> Supplier Office Phone Number </th> &nbsp;
                </tr>
                    <tr> 
                     
                    <td> <%=supp.supplier_name_temporary%> </td> &nbsp;
                    <td><%=supp.supplier_contact_number_temporary%> </td> &nbsp;
                    <td><%=supp.office_address_temporary %> </td>&nbsp;
                    <td><%=supp.office_phone_number_temporary%> </td>&nbsp;
                    <tr>
            </table>
            <input type="submit" value="Save changes">
        </form>
        <button onclick = "window.location.href = 'employeeUpdate.jsp';"> Return </button>
        
        
    </body>
</html>