<%-- 
    Document   : warehouseUpdateForm
    Created on : 11 18, 23, 10:25:25 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, warehouseMgmt.*, java.text.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Warehouse</title>
    </head>
    <body><center>
        <h2>Update a Warehouse Form</h2>
        <hr><br>

        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        
        <% 
            String temp = request.getParameter("warehouse_idU");
            ware.warehouse_ID = Integer.valueOf(temp); 
            ware.get_warehouse_record();
        %>
        <form action="warehouseUpdateCheck.jsp">
            
            <table>
                <tr>
                    <td>Warehouse ID:</td>
                    <td><%=ware.warehouse_ID %></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" id="phone_number" name="phone_number" value="<%=ware.warehouse_phonenumber %>"></td>
                </tr>
                
                <tr>
                    <td>Name:</td>
                    <td><input type="text" id="name" name="name" value="<%=ware.warehouse_name %>"></td>
                </tr>
                
                <tr>
                    <td>First Address:</td>
                    <td><input type="text" id="address" name="address" value="<%=ware.warehouse_address %>"></td>
                </tr>
                <tr>
                    <td>Is it functional?:</td>
                    <td>
                        <select id="isFunctionalU" name="isFunctionalU">
                            <% if (ware.isFunctional){ %>
                                <option value ="<%=ware.isFunctional%>"> True </option>
                                <option value ="false"> False </option>
                            <% } else { %>
                                <option value ="<%=ware.isFunctional%>"> False </option>
                                <option value ="true"> True </option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Max Row:</td>
                    <td><input type="number" id="max_row" name="max_row" value="<%=ware.warehouse_maxrow %>"></td>
                </tr>
                
                <tr>
                    <td>Max Bay:</td>
                    <td><input type="number" id="max_bay" name="max_bay" value="<%=ware.warehouse_maxbay %>"></td>
                </tr>
                
                <tr>
                    <td>Max Level:</td>
                    <td><input type="number" id="max_level" name="max_level" value="<%=ware.warehouse_maxlevel %>"></td>
                </tr>
                
                <tr>
                    <td>Max Bin Number:</td>
                    <td><input type="number" id="max_bin_number" name="max_bin_number" value="<%=ware.warehouse_maxbinNumber %>"></td>
                </tr>
            </table><br>
            
            <input type="submit" value="Next"><br><br>
        </form> 
        <br>
        <button onclick = "window.location.href = 'warehouseUpdate.jsp';"> Go Back </button>
        <button onclick = "window.location.href = 'warehouse.html';"> Cancel Update </button>
    </body>
</html>
