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
        <title>Update Warehouse Check</title>
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
            
            <table>
                <th> OLD RECORD
                <tr> 
                    <th> Warehouse ID: <%=ware.warehouse_ID %>  </td> &nbsp;
                    <th> Warehouse Phone Number: <%=ware.warehouse_phonenumber %> </td> &nbsp;
                    <th> Warehouse Name: <%=ware.warehouse_name %> </td> &nbsp;
                    <th> Warehouse Address: <%=ware.warehouse_address %>  </td> &nbsp;
                        <th> Warehouse Address: <%=ware.isFunctional %>  </td> &nbsp;
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
                    <th> Warehouse ID: <%=ware.warehouse_ID %>  </td> &nbsp;
                    <th> Warehouse Phone Number: <%=ware.warehouse_phonenumber_temporary %> </td> &nbsp;
                        <th> Warehouse Name: <%=ware.warehouse_name_temporary %> </td> &nbsp;
                    <th> Warehouse First Address: <%=ware.warehouse_address_temporary %>  </td> &nbsp;
                        <th> Warehouse Address: <%=ware.isFunctional_temporary %>  </td> &nbsp;
                    <th> Warehouse Max Row: <%=ware.warehouse_maxrow_temporary%> </td> &nbsp;
                    <th> Warehouse Max Bay: <%=ware.warehouse_maxbay_temporary %>  </td> &nbsp;
                    <th> Warehouse Max Level: <%=ware.warehouse_maxlevel_temporary %>  </td> &nbsp;
                    <th> Warehouse Max Bin: <%=ware.warehouse_maxbinNumber_temporary %>  </td> &nbsp;
                </tr>
            </table>
            <input type="submit" value="Save changes">
        </form>
        <button onclick = "window.location.href = 'warehouseUpdateForm.jsp';"> Return </button>
        
        
    </body>
</html>
