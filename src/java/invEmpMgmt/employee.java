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
    public ArrayList last_nameList = new ArrayList<>();
    public ArrayList first_nameList = new ArrayList<>();
    public ArrayList middle_nameList = new ArrayList<>();
    public ArrayList permanent_addressList = new ArrayList<>();
    public ArrayList current_addressList = new ArrayList<>();
    public ArrayList genderList = new ArrayList<>();
    public ArrayList email_addressList = new ArrayList<>();
    public ArrayList phone_numberList = new ArrayList<>();
    
    public ArrayList<Date> birthdayList = new ArrayList<>();
    public ArrayList<Date> employment_start_dateList = new ArrayList<>();
    public ArrayList<Date> employment_end_dateList = new ArrayList<>();
    
    // for search function
    public String last_name_holder;
    public String first_name_holder;
    public String middle_name_holder;
    public String permanent_address_holder;
    public String current_address_holder;
    public String gender_holder;
    public String phone_number_holder;
    
    public String birthday_temporary_holder;
    public Date birthday_holder = new Date();

    public String employment_start_date_temporary_holder;
    public String employment_end_date_temporary_holder;
    public Date employment_start_date_holder = new Date();
    public Date employment_end_date_holder = new Date();
    
    public int search_count = 0;
    
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
    
    public void convert_start_date(String start_temporary) {
        try{
            this.employment_start_date = date_format.parse(start_temporary); 
        } catch(Exception o){
            o.printStackTrace();
        }
    }
    
    public void convert_end_date(String end_temporary) {
        try{
            this.employment_end_date = date_format.parse(end_temporary); 
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
    
    public int search_employees(){
        
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT lastName,firstName,middleName,permanentAddress,currentAddress, gender, birthday, employmentStartDate, employmentEndDate"
            + "  FROM inventoryemployees \n" +
            "WHERE CASE \n" +
            "    WHEN ? != '0' THEN lastName = ?\n" +
            "    WHEN ? != '0' THEN firstName = ?\n" +
            "    WHEN ? != '0' THEN middleName = ?\n" +
            "    WHEN ? != '0' THEN permanentAddress LIKE CONCAT('%', ?, '%')\n" +
            "    WHEN ? != '0' THEN currentAddress LIKE CONCAT('%', ?, '%')\n" +
            "    WHEN ? != '0' THEN gender = ?\n" +
            "    WHEN ? != '0' THEN birthday = ?\n" +
            "    WHEN ? != '0' THEN employmentStartDate = ?\n" +
            "    WHEN ? != '0' THEN employmentEndDate = ?\n" +
            "END");
            
            if(last_name_holder == "")
                last_name = "0";
            else
                last_name = last_name_holder;
            
            pstmt.setString(1, last_name);
            pstmt.setString(2, last_name_holder);
            
            if(first_name_holder == "")
                first_name = "0";
            else
                first_name = first_name_holder;
            
            pstmt.setString(3, first_name);
            pstmt.setString(4, first_name_holder);
            
            if(middle_name_holder == "")
                middle_name = "0";
            else
                middle_name = middle_name_holder;
            
            pstmt.setString(5, middle_name);
            pstmt.setString(6, middle_name_holder);
            
            if(permanent_address_holder == "")
                permanent_address = "0";
            else
                permanent_address = permanent_address_holder;
            
            pstmt.setString(7, permanent_address);
            pstmt.setString(8, permanent_address_holder);
            
            if(current_address_holder == "")
                current_address = "0";
            else
                current_address = current_address_holder;
            
            pstmt.setString(9, current_address);
            pstmt.setString(10, current_address_holder);
            
            if(gender_holder == "")
                gender = "0";
            else
                gender = gender_holder;
            
            pstmt.setString(11, gender);
            pstmt.setString(12, gender_holder);
            
            convert_birthday_date(birthday_temporary);
            convert_start_date(employment_start_date_temporary);
            convert_end_date(employment_end_date_temporary);

            if(birthday_temporary == "")
                pstmt.setString(13, "0");
            else
                pstmt.setString(13, "1");
  
            pstmt.setDate(14, new java.sql.Date(birthday.getTime()));
            
            if(employment_start_date_temporary == "")
                pstmt.setString(15, "0");
            else
                pstmt.setString(15, "1");
            
                
            pstmt.setDate(16, new java.sql.Date(employment_start_date.getTime()));
            
            if(employment_end_date_temporary == "" || employment_end_date == null )
            {
                pstmt.setString(17, "0");
                pstmt.setDate(18, null);
            }   
            else
            {
                pstmt.setString(17, "1");
                pstmt.setDate(18, new java.sql.Date(employment_end_date.getTime()));
            }
                
            
            ResultSet rst= pstmt.executeQuery();
            
            search_count = 0;
            
            last_nameList.clear();
            first_nameList.clear();
            middle_nameList.clear();
            permanent_addressList.clear();
            current_addressList.clear();
            genderList.clear();
            birthdayList.clear();
            employment_start_dateList.clear();
            employment_end_dateList.clear();
            
            while (rst.next()) {
                last_name = rst.getString("lastName");
                first_name = rst.getString("firstName");
                middle_name = rst.getString("middleName");
                permanent_address = rst.getString("permanentAddress");
                current_address = rst.getString("currentAddress");
                gender = rst.getString("gender");
                birthday = rst.getDate("birthday");
                employment_start_date = rst.getDate("employmentStartDate");
                employment_end_date = rst.getDate("employmentEndDate");
                
                last_nameList.add(last_name);
                first_nameList.add(first_name);
                middle_nameList.add(middle_name);
                permanent_addressList.add(permanent_address);
                current_addressList.add(current_address);
                genderList.add(gender);
                birthdayList.add(birthday); 
                employment_start_dateList.add(employment_start_date);
                employment_end_dateList.add(employment_end_date);
                search_count++;
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
    public static void main(String args[]) {
  
    }
    
}
