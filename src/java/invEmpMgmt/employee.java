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
    public String job_title;
    public int employee_warehouse_ID;
    
    // used to get number input from html
    public String employee_warehouse_ID_temporary;
    
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
    public ArrayList employee_warehouse_IDList = new ArrayList<>();
    
    // for search function
    public String last_name_holder;
    public String first_name_holder;
    public String middle_name_holder;
    public String permanent_address_holder;
    public String current_address_holder;
    public String gender_holder;
    public String phone_number_holder;
    public String email_address_holder;
    
    public String birthday_temporary_holder;
    public Date birthday_holder = new Date();

    public String employment_start_date_temporary_holder;
    public String employment_end_date_temporary_holder;
    public Date employment_start_date_holder = new Date();
    public Date employment_end_date_holder = new Date();
    
    public ArrayList<String> temp_employeeIDList = new ArrayList<>();
    int temp_container;
    
    public int search_count = 0;
    
    public String convert_phonenumber(String number)
    {
        if (number.charAt(0) != '0')
        {
            String temp = "0";
            temp = temp.concat(number);
            return temp;
        }
        
        return number;
        
    }
    
    public void get_employees(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT employeeID AS employeeID FROM inventoryemployees WHERE employmentEndDate IS NULL ORDER BY employeeID ASC");
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
    
    public void get_abled_employees(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT employeeID AS employeeID FROM inventoryemployees WHERE employmentEndDate IS NULL ORDER BY employeeID ASC");
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
                phone_number = rst.getString("phoneNumber");
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
    
        public void get_functional_warehouses(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID AS warehouseID FROM warehouse WHERE isFunctional= 1 ORDER BY warehouseID ASC");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            employee_warehouse_IDList.clear();
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                employee_warehouse_IDList.add(temp);
            }
            
            // Closing Statements
            pstmt.close();
            conn.close();
            
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
    public int update_employee(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE inventoryemployees "
                    + "SET lastName=?,firstName=?,middleName=?,permanentAddress=?,currentAddress=?, gender=?,birthday=?, emailAddress=?, "
                    + "employmentStartDate=?,employmentEndDate=?,phoneNumber=? WHERE employeeID =?");
  
            pstmt.setString(1, last_name_holder);
            pstmt.setString(2, first_name_holder);
            pstmt.setString(3, middle_name_holder);
            pstmt.setString(4, permanent_address_holder);
            pstmt.setString(5, current_address_holder);
            pstmt.setString(6, gender_holder);
            
            // converts to actual birthday
            convert_birthday_date(birthday_temporary_holder);
            
            // converts to birthday holder
            try{
                this.birthday_holder = date_format.parse(birthday_temporary_holder); 
            } catch(Exception o){
                o.printStackTrace();
            }
            
            pstmt.setDate(7, new java.sql.Date(birthday.getTime()));
            pstmt.setString(8, email_address.toLowerCase());
            
            // converts to actual end date
            convert_end_date(employment_end_date_temporary_holder);
            
            // converts to end date holder
            try{
                this.employment_end_date_holder = date_format.parse(employment_end_date_temporary); 
            } catch(Exception o){
                o.printStackTrace();
            }
            
            pstmt.setDate(9, new java.sql.Date(employment_start_date.getTime()));
            
            pstmt.setDate(10, null);
            
            pstmt.setString(11, convert_phonenumber(phone_number_holder));
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
            employment_end_date = new Date();

            pstmt.setDate(8, new java.sql.Date(birthday.getTime()));
            pstmt.setString(9, email_address.toLowerCase());
            
            pstmt.setDate(10, new java.sql.Date(employment_start_date.getTime()));
            employment_end_date = null;
            pstmt.setDate(11, null);

            pstmt.setString(12, convert_phonenumber(phone_number));

            // Push Update to Database
            pstmt.executeUpdate();   
           
            employee_warehouse_ID = Integer.parseInt(employee_warehouse_ID_temporary);
            if(job_title.equals("Worker"))
            {   
                pstmt = conn.prepareStatement("INSERT INTO worker (employeeNumber, warehouseID) VALUES (?,?)");
                pstmt.setInt(1, employee_ID);
                pstmt.setInt(2, employee_warehouse_ID);
            }
            else
            {   
                pstmt = conn.prepareStatement("INSERT INTO manager (employeeID, warehouseID) VALUES (?,?)");
                pstmt.setInt(1, employee_ID);
                pstmt.setInt(2, employee_warehouse_ID);
            }
            
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
            

            temp_employeeIDList.clear();
            

            PreparedStatement pstmt = conn.prepareStatement("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN lastName = ? ELSE lastName != '' END)");

            if(last_name_holder == "")
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, last_name_holder);
            }
                
            ResultSet rst = pstmt.executeQuery();

            containList(rst);
            
            // 2
            StringBuilder sql = new StringBuilder("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN firstName = ? ELSE firstName != '' END) AND employeeID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(first_name_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, first_name_holder);
            }
            
            set_idList(pstmt);
            temp_employeeIDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);


             // 3
            sql = new StringBuilder("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN middleName = ? ELSE middleName != '' END) AND employeeID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(middle_name_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, middle_name_holder);
            }
            
            set_idList(pstmt);
            temp_employeeIDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);

            // 4
            sql = new StringBuilder("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN permanentAddress LIKE CONCAT('%', ?, '%') ELSE permanentAddress != '' END) AND employeeID in (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(permanent_address_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, permanent_address_holder);
            }
         
            set_idList(pstmt);
            temp_employeeIDList.clear();
            
            rst = pstmt.executeQuery();

            containList(rst);
            
            // 5
            sql = new StringBuilder("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN currentAddress LIKE CONCAT('%', ?, '%') ELSE currentAddress!= '' END) AND employeeID in (");
            
            addString(sql);
           
            pstmt = conn.prepareStatement(sql.toString());

            if(current_address_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, current_address_holder);
            }
            
            set_idList(pstmt);
            temp_employeeIDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);
            
            // 6 
            
            sql = new StringBuilder("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN gender = ? ELSE gender != '' END) AND employeeID in (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(gender_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
                
                for (int i = 0; i < temp_employeeIDList.size(); i++) 
                {
                    pstmt.setString(i+3,temp_employeeIDList.get(i));
                    
                } 
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, gender_holder);
                
            }
            
            set_idList(pstmt);
            temp_employeeIDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);
            
            //7
            sql = new StringBuilder("SELECT employeeID FROM inventoryemployees WHERE (CASE WHEN ? = 0 THEN birthday = ? ELSE birthday != '' END) AND employeeID in (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(birthday_temporary_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setDate(2, null);   
            }
            else
            {
                convert_birthday_date(birthday_temporary_holder);
                
                pstmt.setInt(1, 0);
                pstmt.setDate(2, new java.sql.Date(birthday.getTime()));
            }
            
            set_idList(pstmt);
            temp_employeeIDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);

            sql = new StringBuilder("SELECT lastName, firstName, middleName, permanentAddress, currentAddress, gender, birthday, employmentStartDate, employmentEndDate " +
                "FROM inventoryemployees " +
                "WHERE employeeID IN (");
            
            addString(sql);
           
            pstmt = conn.prepareStatement(sql.toString());
            
            for (int i = 0; i < temp_employeeIDList.size(); i++) 
                pstmt.setString(i+1,temp_employeeIDList.get(i));
                    
            
            rst= pstmt.executeQuery();
            
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
    public void containList(ResultSet rst) throws SQLException
    {
        while (rst.next())
        {
            temp_container = rst.getInt("employeeID");
            temp_employeeIDList.add(Integer.toString(temp_container));
        }

    }
    
    public void addString(StringBuilder sql)
    {
        for (int i = 0; i < temp_employeeIDList.size(); i++) {
        sql.append("?");
            if (i < temp_employeeIDList.size() - 1) 
            {
                sql.append(",");
            }
        }
        sql.append(")");
    }
    
    public void set_idList(PreparedStatement pstmt)
    {
        try
        {
            for (int i = 0; i < temp_employeeIDList.size(); i++) 
            {
                pstmt.setString(i+3,temp_employeeIDList.get(i));
            } 
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    
    public static void main(String args[]) {
  
    }
    
}
