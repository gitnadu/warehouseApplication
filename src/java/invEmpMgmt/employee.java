package invEmpMgmt;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.*;

public class employee {
    
    // Inventory Employee Fields
    public int employee_ID;
    public String last_name;
    public String first_name;
    public String middle_name;
    public String permanent_address;
    public String current_address;
    public String gender;
    public String email_address;
    public String phone_number;
    
    // Inventory Employee Field: Birthday
    public String birthday_temporary;
    public Date birthday = new Date();
    DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");

    // Inventory Employee Field: Start & End Dates
    public String employment_start_date_temporary;
    public String employment_end_date_temporary;
    public Date employment_start_date = new Date();
    public Date employment_end_date = new Date();
    
    public ArrayList employee_IDList = new ArrayList<>();
    
    public void get_employees(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT employeeID AS employeeID FROM inventoryemployees");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            employee_IDList.clear();
            while (rst.next()){
                temp = rst.getInt("employeeID");
                employee_IDList.add(temp);
            }
            
            // Closing Statements
            pstmt.close();
            conn.close();
            
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
    public int get_employee_record(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT lastName,firstName,middleName,permanentAddress,currentAddress, gender,birthday, emailAddress, employmentStartDate,employmentEndDate,phoneNumber FROM inventoryemployees WHERE employeeID =?");
            pstmt.setInt(1, employee_ID);
            
            ResultSet rst= pstmt.executeQuery();
            
            while (rst.next()) {
                last_name = rst.getString("lastName");
                first_name = rst.getString("firstName");
                middle_name = rst.getString("middleName");
                permanent_address = rst.getString("permanentAddress");
                current_address = rst.getString("currentAddress");
                gender = rst.getString("gender");
                birthday = rst.getDate("birthday");
                email_address = rst.getString("emailAddress");
                employment_start_date = rst.getDate("employmentStartDate");
                employment_end_date = rst.getDate("employmentEndDate");
                phone_number = rst.getString("employeeRecord");
            }

            // Closing Statements
            pstmt.close();
            conn.close();
            
            return 1;
            
        } catch(SQLException e){
            e.printStackTrace();
            return 0;
        }
        
    }
    
    public int update_employee(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE inventoryemployees "
                    + "SET lastName=?,firstName=?,middleName=?,permanentAddress=?,currentAddress=?, gender=?,birthday=?, emailAddress=?, "
                    + "employmentStartDate=?,employmentEndDate=?,phoneNumber=? WHERE employeeID =?");
  
            pstmt.setString(1, last_name);
            pstmt.setString(2, first_name);
            pstmt.setString(3, middle_name);
            pstmt.setString(4, permanent_address);
            pstmt.setString(5, current_address);
            pstmt.setString(6, gender);
            
            convert_birthday_date(birthday_temporary);
            
            pstmt.setDate(7, new java.sql.Date(birthday.getTime()));
            pstmt.setString(8, email_address);
            
            pstmt.setDate(9, new java.sql.Date(employment_start_date.getTime()));
            pstmt.setDate(10, new java.sql.Date(employment_start_date.getTime()));
            pstmt.setString(11, phone_number);
            pstmt.setInt(12, employee_ID);
            
            pstmt.executeUpdate();   
   
            // Closing Statements
            pstmt.close();
            conn.close();
            
            return 1;
        } catch(SQLException e){
            e.printStackTrace();
            return 0;
        }
    }
    
    public int delete_employee(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM inventoryemployees WHERE employeeID = ?");
            pstmt.setInt(1, employee_ID);
            
            pstmt.executeUpdate();   
   
            // Closing Statements
            pstmt.close();
            conn.close();
            return 1;
        } catch(SQLException e){
            e.printStackTrace();
            return 0;
        }
    }
    
    // Method: Converting Birthdays String to Date
    public void convert_birthday_date(String birthday_temporary) {
        try{
            this.birthday = date_format.parse(birthday_temporary); 
        } catch(Exception o){
            o.printStackTrace();
        }
    }
    
    // Method: Registration
    public int register_employee() {
        try {
            
            // Instantiate Connection Variable and Connect to Database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            // MySQL INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(employeeID) + 1 AS newID FROM inventoryemployees");
            ResultSet rst= pstmt.executeQuery();
            
            // Autogenerated Employee ID
            while(rst.next()) {
                employee_ID = rst.getInt("newID");
            }
            
            // Assign Values
            pstmt = conn.prepareStatement("INSERT INTO inventoryemployees (employeeID, lastName, firstName, middleName, permanentAddress, currentAddress, gender, birthday, emailAddress, employmentStartDate,employmentEndDate, phoneNumber) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, employee_ID);
            pstmt.setString(2, last_name);
            pstmt.setString(3, first_name);
            pstmt.setString(4, middle_name);
            pstmt.setString(5, permanent_address);
            pstmt.setString(6, current_address);
            pstmt.setString(7, gender);
            
            convert_birthday_date(birthday_temporary);
            
            employment_start_date = new Date();
            employment_end_date = null;
            
            pstmt.setDate(8, new java.sql.Date(birthday.getTime()));
            pstmt.setString(9, email_address);
            
            pstmt.setDate(10, new java.sql.Date(employment_start_date.getTime()));
            pstmt.setDate(11, null);
            pstmt.setString(12, phone_number);

            // Push Update to Database
            pstmt.executeUpdate();   
   
            // Closing Statements
            pstmt.close();
            conn.close();
            
            return 1;
       
        } catch (SQLException e) {
            return 0;
        }         
    }
    
    public static void main(String args[]) {

    }
    
}
