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
        <title> Search Supplier Results</title>
    </head>
    <body>
        <jsp:useBean id="supp" class="supplierMgmt.supplier" scope="session" />
        <form action="supplierSearch.html"> 
     
            <% 
                supp.supplier_name_holder  = request.getParameter("supplier_nameS");
                supp.office_address_holder = request.getParameter("supplier_addressS");

                int status = supp.search_employees();
                if (status == 1){
            %>
            <h1> Search Supplier Results </h1>
            <table>
                <tr> 
                    <th> Supplier Name </th> &nbsp;
                    <th> Supplier Contact Number </th> &nbsp;
                    <th> Supplier Office Address </th> &nbsp;
                    <th> Supplier Office Phone Number </th> &nbsp;

                </tr>
                    <% 
                       for(int i=0;i<supp.supplier_search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=supp.supplier_name_list.get(i) %> </td> &nbsp;
                        <td><%=supp.contact_num_list.get(i) %> </td> &nbsp;
                        <td><%=supp.office_address_list.get(i) %></td>&nbsp;
                        <td><%=supp.office_tel_list.get(i) %> </td>&nbsp;
                       <tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>Search Failed </h1>
            <% } %>
           <input type="submit" value="Search Again">
        </form>
        <button onclick = "window.location.href = 'supplier.html';"> Back to Main Menu </button>
    </body>
</html>
