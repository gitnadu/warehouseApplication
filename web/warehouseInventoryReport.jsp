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
        <h2>Inventory Report</h2>
        <hr><br>
        
        <form action="warehouseInventoryReportProcessing.jsp"> 
            <table>
                <tr>
                    <td>Warehouse Name: </td>
                    <td><input type="text" id ="warehouse_nameR" name="warehouse_nameR"></td>
                </tr>
                <tr>
                    <td>Warehouse Address: </td>
                    <td><input type="text" id ="warehouse_addrssR" name="warehouse_addressR"></td>
                </tr>
                <tr>
                    <td>Is it functional? </td>
                    <td><select id="isFunctionalR" name="isFunctionalR">
                        <option value =""> </option>
                        <option value ="true"> True </option>
                        <option value ="false"> False </option>
                </select></td>
                </tr>
            </table><br><br>
            <input type="submit" value="Submit"><br><br>
        </form>
        <button onclick = "window.location.href = 'supplier.html';">Go Back</button>
    </center></body>
</html>
