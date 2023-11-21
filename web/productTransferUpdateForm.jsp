<%-- 
    Document   : productTransferUpdateProcessing
    Created on : 11 22, 23, 1:06:21 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        
        <jsp:useBean id="transfer" class="productMgmt.product_line" scope="session" />
        
        <form action="productTransferUpdateForm.jsp"> 
            
            Reason:
            <input type="text" id="transfer_reason" name="transfer_reason" value="<% transfer.transfer_reason %>"required>

            Status:
            <input type="text" id="transfer_status" name="transfer_status" value="<% transfer.transfer_status %>"required>

            End Date: 
            <input type="date" id="transfer_enddate" name="transfer_enddate" value="<% transfer.transfer_end_date %>" required>
            
        <input type="submit" value="Submit">
 
    </body>
</html>