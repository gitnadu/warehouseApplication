<%-- 
    Document   : get_employee
    Created on : 11 22, 23, 12:38:52 AM
    Author     : ccslearner
--%>
<%@ page contentType="application/json;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<jsp:useBean id="transfer" class="productMgmt.transfer" scope="session" />

<%
    // Simulate fetching bins from a data source
    transfer.transfer_warehouse_origin_ID_temporary = request.getParameter("warehouse");
    transfer.get_workers_from_warehouse();
    
    List<Integer> employees = transfer.transfer_employee_in_charge_ID_list;
    
    String temp = "[";
    for (int i = 0; i < employees.size(); i++) {
        temp += employees.get(i);
        if (i < employees.size() - 1) {
            temp += ",";
        }
    }
    temp += "]";

    response.getWriter().write(temp);
%>
