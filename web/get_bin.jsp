<%@ page contentType="application/json;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<jsp:useBean id="prod" class="productMgmt.product" scope="session" />

<%
    // Simulate fetching bins from a data source
    prod.product_warehouse_locator = request.getParameter("warehouse");
    prod.get_binfrom_warehouses();
    List<Integer> bins = prod.product_warehouse_locatorList;
    
    String binsJson = "[";
    for (int i = 0; i < bins.size(); i++) {
        binsJson += bins.get(i);
        if (i < bins.size() - 1) {
            binsJson += ",";
        }
    }
    binsJson += "]";

    response.getWriter().write(binsJson);
%>

