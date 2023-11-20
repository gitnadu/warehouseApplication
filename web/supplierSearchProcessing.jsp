<%-- 
    Document   : supplierSearchProcessing
    Created on : 11 20, 23, 9:38:47 PM
    Author     : ccslearner
--%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, supplierMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Suppliers</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Search Results:</h2>
        <hr><br>
        
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        <form action="supplierSearch.html"> 
     
            <% 
                supp.supplier_name_holder  = request.getParameter("supplier_nameS");
                supp.office_address_holder = request.getParameter("supplier_addressS");

                int status = supp.search_employees();
                if (status == 1){
            %>
            
            <table style = "width:100%">
                <tr> 
                    <td> Supplier Name </td>
                    <td> Supplier Contact Number </td>
                    <td> Supplier Office Address </td>
                    <td> Supplier Office Phone Number </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                    <% 
                       for(int i=0;i<supp.supplier_search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=supp.supplier_name_list.get(i) %> </td> 
                        <td><%=supp.contact_num_list.get(i) %> </td> 
                        <td><%=supp.office_address_list.get(i) %></td>
                        <td><%=supp.office_tel_list.get(i) %> </td>
                       <tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>There is no record that matches your search query..</h1>
            <% } %>
            <br><input type="submit" value="Search Again"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';"> Back to Menu </button>
    </body>
</html>
