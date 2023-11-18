<%-- 
    Document   : warehouseUpdateCheck
    Created on : 11 18, 23, 10:33:12 PM
    Author     : ccslearner
--%>

<%@page import="java.text.ParseException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.lang.*, invEmpMgmt.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Supplier Check</title>
    </head>
    <body>
        <h2> Updating Supplier Check </h2>
        <jsp:useBean id="ware" class="warehouseMgmt.warehouse" scope="session" />
        <form action="warehouseUpdateProcessing.jsp"> 
            <%  ware.warehouse_city_temporary = request.getParameter("city");
                ware.warehouse_phonenumber_temporary = request.getParameter("phone_number");
                ware.warehouse_first_address_temporary = request.getParameter("first_address");
                ware.warehouse_state_temporary = request.getParameter("state");
                ware.warehouse_country_temporary = request.getParameter("country");
                ware.warehouse_postalcode_temporary = request.getParameter("postal_code");
                ware.isFunctional_temporary= (request.getParameter("is_functional").equals("1")) ? true : false;
                ware.warehouse_maxrow_temporary = request.getParameter("max_row");
                ware.warehouse_maxbay_temporary= request.getParameter("max_bay");
                ware.warehouse_maxlevel_temporary = request.getParameter("max_level");
                ware.warehouse_maxbinNumber_temporary = request.getParameter("max_bin_number");
                ware.get_warehouse_record();
            %>
            
            <table>
                <th> OLD RECORD
                <tr> 
                    <th> Warehouse ID: <%=ware.warehouse_ID %>  </td> &nbsp;
                    <th> Warehouse City: <%=ware.warehouse_city %>  </td> &nbsp;
                    <th> Warehouse Phone Number: <%=ware.warehouse_phonenumber %> </td> &nbsp;
                    <th> Warehouse First Address: <%=ware.warehouse_first_address %>  </td> &nbsp;
                    <th> Warehouse State: <%=ware.warehouse_state %> </td> &nbsp;
                    <th> Warehouse Country:  <%=ware.warehouse_country %> </td> &nbsp;
                    <th> Warehouse Postal Code: <%=ware.warehouse_postalcode %> </td> &nbsp;
                    <th> Warehouse Max Row: <%=ware.warehouse_maxrow%> </td> &nbsp;
                    <th> Warehouse Max Bay: <%=ware.warehouse_maxbay %>  </td> &nbsp;
                    <th> Warehouse Max Level: <%=ware.warehouse_maxlevel %>  </td> &nbsp;
                    <th> Warehouse Max Bin: <%=ware.warehouse_maxbinNumber %>  </td> &nbsp;
                </tr>
            </table>
                    
                    <br>
            <table>
                <th> NEW RECORD </th>
                <tr> 
                    <th> Warehouse ID: <%=ware.warehouse_ID_temporary %>  </td> &nbsp;
                    <th> Warehouse City: <%=ware.warehouse_city_temporary %>  </td> &nbsp;
                    <th> Warehouse Phone Number: <%=ware.warehouse_phonenumber_temporary %> </td> &nbsp;
                    <th> Warehouse First Address: <%=ware.warehouse_first_address_temporary %>  </td> &nbsp;
                    <th> Warehouse State: <%=ware.warehouse_state_temporary %> </td> &nbsp;
                    <th> Warehouse Country:  <%=ware.warehouse_country_temporary %> </td> &nbsp;
                    <th> Warehouse Postal Code: <%=ware.warehouse_postalcode_temporary %> </td> &nbsp;
                    <th> Warehouse Max Row: <%=ware.warehouse_maxrow_temporary%> </td> &nbsp;
                    <th> Warehouse Max Bay: <%=ware.warehouse_maxbay_temporary %>  </td> &nbsp;
                    <th> Warehouse Max Level: <%=ware.warehouse_maxlevel_temporary %>  </td> &nbsp;
                    <th> Warehouse Max Bin: <%=ware.warehouse_maxbinNumber_temporary %>  </td> &nbsp;
                </tr>
            </table>
            <input type="submit" value="Save changes">
        </form>
        <button onclick = "window.location.href = 'warehouseUpdate.jsp';"> Return </button>
        
        
    </body>
</html>
