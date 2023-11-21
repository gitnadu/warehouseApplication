<%-- 
    Document   : warehouseInventoryReport
    Created on : 11 21, 23, 11:32:18 PM
    Author     : ccslearner
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Suppliers</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body><center>
        <h2>Search Suppliers</h2>
        <hr><br>
        
        <form action="supplierSearchProcessing.jsp"> 
            <table>
                <tr>
                    <td>Source of Product: </td>
                    <td><select id="inventoryreport_isFunctional" name="inventoryreport_isFunctional">
                        <option value =""> </option>
                        <option value ="true"> True </option>
                        <option value ="false"> False </option>
                    </select></td>
                </tr>
                <tr>
                    <td>Employee in Charge : </td>
                    <td><input type="text" id ="inventoryreport_employee" name="inventoryreport_employee"></td>
                </tr>
                <tr>
                    <td>Product Category: </td>
                    <td><input type="text" id ="inventoryreport_addressS" name="inventoryreport_addressS"></td>
                </tr>
            </table><br><br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';">Go Back</button>
    </center></body>
</html>
