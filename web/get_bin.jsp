
<%@ page contentType="application/json;charset=UTF-8" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<jsp:useBean id="prod" class="productMgmt.product" scope="session" />
<%
    // Simulate fetching cities based on the selected country
    prod.product_warehouse_locator = request.getParameter("warehouse");
    
    String bins = getBins();

    response.setContentType("application/json;charset=UTF-8");
    response.getWriter().write(bins);
%>

<%! 
    private String getBins() {
        // Simulate fetching bins from a database or other data source
        // Replace this with your actual logic to retrieve bins for the given warehouse

        // For demonstration purposes, we'll use a simple mapping
        prod.get_binfrom_warehouses();

        ObjectMapper objectMapper = new ObjectMapper();
        String temp = objectMapper.writeValueAsString(prod.product_warehouse_locatorList);

        return temp;
    }
%>
