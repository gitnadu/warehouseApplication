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
        <h2>Search Results:</h2>
        <hr><br>
        
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="warehouseSearch.html"> 
            
            
     
            <% 
                ware.warehouse_name_holder = request.getParameter("warehouse_nameS");
                ware.warehouse_address_holder = request.getParameter("warehouse_addressS");
                ware.isFunctional_holder = request.getParameter("isFunctionalS");
                
                int status = ware.search_warehouse();
                if (status == 1){
            %>
            
            <table style = "width:100%">
                <tr> 
                    <td>Warehouse Name: </td>
                    <td>Warehouse Phone Number: </td>
                    <td>Warehouse Address: </td>
                    <td>Warehouse Max Row:</td>
                    <td>Warehouse Max Bay: </td>
                    <td>Warehouse Max Level: </td>
                    <td>Warehouse Max Bin: </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                    <% 
                       for(int i=0;i<ware.warehouse_search_count;i++)
                       { %>
                       <tr> 
                        <td> <%=ware. warehouse_nameList.get(i) %> </td> 
                        <td><%=ware.warehouse_phonenumberList.get(i) %> </td> 
                        <td><%=ware.warehouse_addressList.get(i) %></td>
                        <td><%=ware.warehouse_maxrowList.get(i) %> </td>
                        <td><%=ware.warehouse_maxbayList.get(i) %> </td> 
                        <td><%=ware.warehouse_maxlevelList.get(i) %></td>
                        <td><%=ware.warehouse_maxbinNumberList.get(i) %> </td>
                       </tr>
                    <% } %> 
            </table>
            
            
            <% } else { %>
            <h1>There is no record that matches your search query..</h1>
            <% } %>
            <br><input type="submit" value="Search Again"><br><br>
        </form>
        <button onclick = "window.location.href = 'warehouse.html';"> Back to Menu </button>
    </body>
</html>
