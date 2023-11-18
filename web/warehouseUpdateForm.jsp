<%-- 
    Document   : warehouseUpdateForm
    Created on : 11 18, 23, 10:25:25 PM
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
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        
        <% 
            String temp = request.getParameter("warehouse_idU");
            ware.warehouse_ID = Integer.valueOf(temp); 
            ware.get_warehouse_record();
        %>
        <form action="warehouseUpdateCheck.jsp"> 
            Warehouse ID: <%=ware.warehouse_ID %> <br>
            City: <input type="text" id="city" name="city" value="<%=ware.warehouse_city %>"> <br>
            Phone Number: <input type="text" id="phone_number" name="phone_number" value="<%=ware.warehouse_phonenumber %>"> <br>
            First Address:<input type="text" id="first_address" name="first_address" value="<%=ware.warehouse_first_address %>"><br>
            State: <input type="text" id="state" name="state" value="<%=ware.warehouse_state %>"> <br>
            Country:<input type="text" id="country" name="country" value="<%=ware.warehouse_country %>"> <br>
            Postal Code:<input type="text" id="postal_code" name="postal_code" value="<%=ware.warehouse_postalcode %>"> <br>

            Is it functional?: <input type="checkbox" id="is_functional" name="is_functional" checked="1">

            Max Row:<input type="number" id="max_row" name="max_row" value="<%=ware.warehouse_maxrow %>"> <br>
            Max Bay:<input type="number" id="max_bay" name="max_bay" value="<%=ware.warehouse_maxbay %>"> <br>
            Max Level:<input type="number" id="max_level" name="max_level" value="<%=ware.warehouse_maxlevel %>"> <br>
            Max Bin Number:<input type="number" id="max_bin_number" name="max_bin_number" value="<%=ware.warehouse_maxbinNumber %>"> <br>
            <br> <input type="submit" value="Next">
        </form> 
        <br>
        <button onclick = "window.location.href = 'warehouse.html';"> Cancel Update </button>
    </body>
</html>
