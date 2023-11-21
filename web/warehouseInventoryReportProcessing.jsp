<%-- 
    Document   : warehouseSearchProcessing
    Created on : 11 21, 23, 10:35:24 AM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, warehouseMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Warehouses</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Report Results:</h2>
        <hr><br>
        
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="warehouseSearch.html"> 
            <% 
                ware.warehouse_name_holder = request.getParameter("warehouse_nameR");
                ware.warehouse_address_holder = request.getParameter("warehouse_addressR");
                ware.isFunctional_holder = request.getParameter("isFunctionalR");
                
                int status = ware.search_warehouse_report();
                if (status == 1){
            %>
            
            <table style = "width:100%">
                <tr> 
                    <td>Number of Warehouses </td>
                    <td>Total Bins </td>
                    <td>Total products reported </td>
                    <td>Number of total worker </td>
                    <td>Number of total manager </td>
                    
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td> 
                </tr>
                    <td> <%=ware. warehouse_search_count %> </td> 
                    <td> <%=ware. countOfBin %> </td> 
                    <td> <%=ware. countOfproduct %> </td> 
                    <td> <%=ware. countOfworker %> </td> 
                    <td> <%=ware. countOfmanager %> </td> 
                 </tr>
            </table>
            
            
            <% } else { %>
            <h1>There is no record that matches your search query..</h1>
            <% } %>
            <br><input type="submit" value="Search Again"><br><br>
        </form>
        <button onclick = "window.location.href = 'warehouse.html';"> Back to Menu </button>
    </body>
</html>
