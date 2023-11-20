<%-- 
    Document   : inventorychecking
    Created on : 11 20, 23, 12:05:08 PM
    Author     : ccslearner
--%>

<html>
    <head>
        <title>Register New Warehouse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <script type="text/javascript"> 
        function getPhoneNumber() {
            let number = document.getElementById("warehouse_phonenumber").value;
            
            if((number.length == 11 && number[0] == 0)|| (number.length == 10 && number[0] != 0)) {
                for(let i=0 ;i < number.length;i++)
                    if (isNaN(number[i])) {
                    alert("Invalid phone number");
                    return false;
                    }
                return true;
            }

            alert("Invalid phone number");
            return false;
        }
            
            
        function validateForm() {
            if(!getPhoneNumber()) return false;
            return true;
        }
        </script>
    </head>
    <body>
        <h2>Register a New Warehouse</h2>
        <hr><br>
        
        <form action="warehouseRegisterProcessing.jsp" onsubmit="return validateForm();" method="post" > 
        <jsp:useBean id="check" class="warehouseMgmt.inventory_physical_checking" scope="session" />
            Warehouse:
             <select id="check_warehouseID" name="check_warehouseID" required>
               <%check.get_functional_warehouses(); %>
               <% for (int i=0;i< check.checking_warehouse_IDList.size();i++) { %>
                <option value ="<%= check.checking_warehouse_IDList.get(i)%>"> <%=check.checking_warehouse_IDList.get(i)%> </option>
                 <% } %>
            </select><br><br>

            Product Line:
             <select id="check_productlineID" name="check_productlineID" required>
               <%check.get_active_product_lines(); %>
               <% for (int i=0;i< check.checking_product_lineIDlist.size();i++) { %>
                <option value ="<%= check.checking_product_lineIDlist.get(i)%>"> <%=check.checking_product_lineIDlist.get(i)%> </option>
                 <% } %>
            </select><br><br>

            Date Checked:
            <input type="date" id="warehouse_maxrow" name="warehouse_maxrow" required min="0" max="9" ><br><br>

            Employee In Charge:
<!--            <select id="check_employeeinchargeID" name="check_productlineID" required>
               <%//check.get_active_product_lines(); %>
               <% //for (int i=0;i< check.checking_product_lineIDlist.size();i++) { %>
                <option value ="<%= //check.checking_product_lineIDlist.get(i)%>"> <%=//check.checking_product_lineIDlist.get(i)%> </option>
                 <% } %>
            </select><br><br>-->

            Quantity Checked:
            <input type="number" id="check_quantitychecked" name="check_quantitychecked" required min="0" max="9" ><br><br>

            Quantity Disposed:
            <input type="number" id="check_quantitydisposed" name="warehouse_maxbin" required min="0" max="9"><br><br>
           
            <input type="submit" value="Proceed"><br><br>
        </form>
        <button onclick = "window.location.href = 'warehouse.html';"> Cancel </button>
    </body>
</html>
