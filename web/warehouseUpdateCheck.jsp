<%-- 
    Document   : warehouseUpdateCheck
    Created on : 11 18, 23, 10:33:12 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
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
        
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="warehouseUpdateProcessing.jsp"> 
            <%  
                ware.warehouse_phonenumber_temporary = request.getParameter("phone_number");
                ware.warehouse_name_temporary = request.getParameter("name");
                ware.warehouse_address_temporary = request.getParameter("address");
                ware.warehouse_maxrow_temporary = request.getParameter("max_row");
                ware.warehouse_maxbay_temporary= request.getParameter("max_bay");
                ware.warehouse_maxlevel_temporary = request.getParameter("max_level");
                ware.warehouse_maxbinNumber_temporary = request.getParameter("max_bin_number"); 
                ware.isFunctional_temporary = request.getParameter("isFunctionalU");
                ware.get_warehouse_record();
            %>
            
            <table style = "width: 100%">
                <h2>Original Details: </h2>
                <tr> 
                    <td> Warehouse ID:</td>
                    <td> Warehouse Phone Number:</td>
                    <td> Warehouse Name: </td>
                    <td> Warehouse Address: </td>
                    <td> Warehouse Address: </td>
                    <td> Warehouse Max Row: </td>
                    <td> Warehouse Max Bay: </td>
                    <td> Warehouse Max Level: </td>
                    <td> Warehouse Max Bin: </td>
                </tr>
                <tr>
                    <td><%=ware.warehouse_ID %></td>
                    <td><%=ware.warehouse_phonenumber %></td>
                    <td><%=ware.warehouse_name %></td>
                    <td><%=ware.warehouse_address %></td>
                    <td><%=ware.isFunctional %></td>
                    <td><%=ware.warehouse_maxrow%></td>
                    <td><%=ware.warehouse_maxbay %></td>
                    <td><%=ware.warehouse_maxlevel %></td>
                    <td><%=ware.warehouse_maxbinNumber %></td>
                </tr>
            </table>
            
            <hr class="short">

            <table style = "width: 100%">
                <h2>New Details: </h2>
                <tr> 
                    <td> Warehouse ID:</td>
                    <td> Warehouse Phone Number:</td>
                    <td> Warehouse Name: </td>
                    <td> Warehouse Address: </td>
                    <td> Warehouse Address: </td>
                    <td> Warehouse Max Row: </td>
                    <td> Warehouse Max Bay: </td>
                    <td> Warehouse Max Level: </td>
                    <td> Warehouse Max Bin: </td>
                </tr>
                <tr>
                    <td><%=ware.warehouse_ID %>  </td>
                    <td><%=ware.warehouse_phonenumber_temporary %> </td>
                    <td><%=ware.warehouse_name_temporary %> </td>
                    <td><%=ware.warehouse_address_temporary %>  </td>
                    <td><%=ware.isFunctional_temporary %>  </td>
                    <td><%=ware.warehouse_maxrow_temporary%> </td>
                    <td><%=ware.warehouse_maxbay_temporary %>  </td>
                    <td><%=ware.warehouse_maxlevel_temporary %>  </td>
                    <td><%=ware.warehouse_maxbinNumber_temporary %>  </td>
                </tr>
            </table>
            <input type="submit" value="Save Changes!">
        </form>
        <button onclick = "window.location.href = 'warehouseUpdate.jsp';"> Cancel Update </button>
    </body>
</html>
