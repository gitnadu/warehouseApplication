package employeemgt;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.*;
public class inventoryEmployee {
    
    // fields of inventory employee
    public int employeeID;
    public String last_name;
    public String first_name;
    public String middle_name;
    public String perm_address;
    public String curr_address;
    public String gender;
    
    String temp_birthday;
    public Date birthday = new Date();
    DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    
    public String emailaddress;
    
    String temp_employement_startdate;
    String temp_employement_enddate;
    public Date employement_startdate = new Date();
    public Date employement_enddate = new Date();
    
    public String phonenumber;
    
    public inventoryEmployee(){}
    
    public int register_employee(){
        
        try {
            // 1. Instantiate a connection variable
            Connection conn;     
            // 2. Connect to your DB
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            // 3. Indicate a notice of successful connection
            System.out.println("Connection Successful");
            // 4. Prepare our INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(employeeID) + 1 AS newID FROM inventoryemployees");
            ResultSet rst= pstmt.executeQuery();
            // 5. Supply the statement with values
            while(rst.next())
            {
                employeeID = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO inventoryemployees (employeeID, lastName, firstName, middleName, permanentAddress, currentAddress, gender, birthday, emailAddress, employmentStartDate,employmentEndDate, phoneNumber VALUE (?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, employeeID);
            pstmt.setString(2, last_name);
            pstmt.setString(3, first_name);
            pstmt.setString(4, middle_name);
            pstmt.setString(5, perm_address);
            pstmt.setString(6, curr_address);
            pstmt.setString(7, gender);
            
            try{
      
                birthday = df.parse(temp_birthday);
                employement_startdate = df.parse(temp_employement_startdate);
                employement_enddate = df.parse(temp_employement_enddate);
            } catch(Exception e){
                e.printStackTrace();
            }
            
            pstmt.setDate(8, new java.sql.Date(birthday.getTime()));
            pstmt.setString(9, emailaddress);
            
            pstmt.setDate(10, new java.sql.Date(employement_startdate.getTime()));
            pstmt.setDate(11, new java.sql.Date(employement_enddate.getTime()));
            pstmt.setString(12, phonenumber);
            pstmt.executeUpdate();   
            
            pstmt.close();
            conn.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());  
            return 0;
        }         
        
        
            
        
        
    }
    public static void main( String argcs[])
    {
        
    }
}
