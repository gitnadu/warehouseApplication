<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title> Register a new inventory employee </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">

        <script type="text/javascript"> 
              function getCurrentDate() {
                const today = new Date();
                const year = today.getFullYear();
                const month = String(today.getMonth()).padStart(2, '0');
                const day = String(today.getDate()).padStart(2, '0');
                return '${year}-${month}-${day}';
              }

              function getEmail(){
                  let text = document.getElementById('employee_emailadd').value;
                  const array = text.split(".");

                  if (array[array.length - 1].localeCompare("com") == 0 || array[array.length - 1].localeCompare("org") == 0 || array[array.length - 1].length == 2)
                      return true;
                  
                  alert("Invalid email address");
                  return false;
              }
              
             function getPhoneNumber()
             {
                 let number = document.getElementById("employee_phonenumber").value;
                 
                 if((number.length == 11 && number[0] == 0)|| (number.length == 10 && number[0] != 0))
                 {
                    for(let i=0 ;i < number.length;i++)
                        if (isNaN(number[i]))
                        {
                            alert("Invalid phone number");
                            return false;
                        }
                           
                    
                    return true;
                 }
                 
                 alert("Invalid phone number");
                 return false;
             }
              
              
              function validateForm(){
                  
                if(!getEmail())
                    return false;
                  
                if(!getPhoneNumber())
                    return false;
                
                if(!isAbove18())
                {
                    alert("Person is not above 18 years old");
                    return false;
                }
                    
                  return true;
              }
              
              function isAbove18() {
                // Parse the entered birthday string into a Date object
                birthday =  document.getElementById("employee_birthday").value;
                let birthDate = new Date(birthday);

                let currentDate = new Date();

                let age = currentDate.getFullYear() - birthDate.getFullYear();

                if (
                  currentDate.getMonth() < birthDate.getMonth() ||
                  (currentDate.getMonth() === birthDate.getMonth() &&
                    currentDate.getDate() < birthDate.getDate())
                ) {
                  // If birthday hasn't occurred yet, subtract 1 from the age
                  return age - 1 >= 18 && age - 1 < 65;
                } else {
                  // If birthday has occurred, check if the age is 18 or older
                  return age >= 18 && age < 65;
                }
}
              
              

        </script>
    </head>    
    <body>
        <h2> Register a New Inventory Employee </h2>
        <hr><br>
        
        <form action="employeeRegisterProcessing.jsp" onsubmit="return validateForm();" method="post" > 
            <jsp:useBean id="emp" class="warehouseMgmt.warehouse" scope="session" />

            Employee First Name: 
            <input type="text" id ="employee_firstname" name="employee_firstname" required><br><br>
            
            Employee Last Name: 
            <input type="text" id ="employee_lastname" name="employee_lastname" required><br><br>
            
            Employee Middle Name: 
            <input type="text" id ="employee_middlename" name="employee_middlename" required><br><br>
            
            Employee Permanent Address: 
            <input type="text" id ="employee_permaddress" name="employee_permaddress" required><br><br>
            
            Employee Current Address:  
            <input type="text" id ="employee_currddress" name="employee_currddress" required><br><br>
            
            Employee Gender: 
            <select id="employee_gender" name="employee_gender" required>
                <option value =""></option>
                <option value ="M">M</option>
                <option value ="F">F</option>
            </select><br><br>
            
            Employee Birthday:
            <input type="date" id ="employee_birthday" name="employee_birthday" required><br><br>
            
            Employee Email Address:
            <input type="text" id ="employee_emailadd" name="employee_emailadd" required><br><br>
            
            Employee Phone Number:
            <input type="text" id ="employee_phonenumber" name="employee_phonenumber" required><br><br>
            
            Employee Job Title: 
            <select id="employee_jobtitle" name="employee_jobtitle" required>
                <option value =""></option>
                <option value ="Worker">Worker</option>
                <option value ="Manager">Manager</option>
            </select><br><br>
            
            Warehouse:
            <select id="employee_warehouseID" name="employee_warehouseID" required>
               <%emp.get_functional_warehouses(); %>
               <% for (int i=0;i< emp.warehouse_IDList.size();i++) { %>
                <option value ="<%= emp.warehouse_IDList.get(i)%>"> <%=emp.warehouse_IDList.get(i)%> </option>
                 <% } %>
            </select><br><br>
           
            <input type="submit" value="Proceed"><br><br>
        </form>
        <button onclick = "window.location.href = 'employee.html';">Cancel</button>
    </body>
</html>
