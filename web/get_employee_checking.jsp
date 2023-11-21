<%-- 
    Document   : get_employee_checking
    Created on : 11 22, 23, 3:11:23 AM
    Author     : ccslearner
--%>

<%@ page contentType="application/json;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<jsp:useBean id="check" class="warehouseMgmt.inventory_physical_checking" scope="session" />

<%
    // Simulate fetching bins from a data sources
    check.checking_warehouse_ID = Integer.parseInt(request.getParameter("warehouse"));
    check.get_workers_for_warehouse();
    
    List<Integer> employees = check.employeeInCharge_IDList;
    
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
