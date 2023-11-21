<%-- 
    Document   : productCheckingForm
    Created on : 11 22, 23, 3:17:30 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
        
    </head>
    <body>
        <jsp:useBean id="check" class="warehouseMgmt.inventory_physical_checking" scope="session" />
        <form action="productCheckingProcessing.jsp"> 
            
            <% 
                String temp = request.getParameter("checking_warehouse");
                check.checking_warehouse_ID = Integer.valueOf(temp); 
                check.employee_in_charge_ID = Integer.valueOf(request.getParameter("checking_employee"));
                
            %>
            
            Pick product line:
            
            <select id="checking_productline" name="checking_productline"> 
            <%  check.get_productline_fromwarehouse();
                for(int i=0;i<check.productLine_warehouse.size();i++){
            %>
            <option value="<%=check.productLine_warehouse.get(i) %>" > <%=check.productLine_warehouse.get(i) %> </option>
            <% } %>
            </select> <br>
                 
            <input type="submit" value="Submit">
        </form>
        
    
        
    
    </body>
</html>
