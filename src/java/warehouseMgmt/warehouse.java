package warehouseMgmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class warehouse {
    
    public int warehouse_ID;
    public String warehouse_phonenumber;
    public String warehouse_address;
    public boolean isFunctional;
    public Integer warehouse_maxrow;
    public Integer warehouse_maxbay;
    public Integer warehouse_maxlevel;
    public Integer warehouse_maxbinNumber;
    
    
    // temporary variables to get html input
    public int warehouse_ID_temporary;
    public String warehouse_phonenumber_temporary;
    public String warehouse_address_temporary;
    public boolean isFunctional_temporary;
    
    public String warehouse_maxrow_temporary;
    public String warehouse_maxbay_temporary;
    public String warehouse_maxlevel_temporary;
    public String warehouse_maxbinNumber_temporary;
    

    public ArrayList warehouse_IDList = new ArrayList<>();
    public ArrayList warehouse_phonenumberList = new ArrayList<>();
    public ArrayList warehouse_addressList = new ArrayList<>();
    public ArrayList isFunctionalList = new ArrayList<>();
    public ArrayList warehouse_maxrowList = new ArrayList<>();
    public ArrayList warehouse_maxbayList = new ArrayList<>();
    public ArrayList warehouse_maxlevelList = new ArrayList<>();
    public ArrayList warehouse_maxbinNumberList = new ArrayList<>();
    
    public ArrayList temp_warehouse_IDList = new ArrayList<>();

    public int warehouse_ID_holder;
    public String warehouse_phonenumber_holder;
    public String warehouse_address_holder;
    public boolean isFunctional_holder;
    public int warehouse_maxrow_holder;
    public int warehouse_maxbay_holder;
    public int warehouse_maxlevel_holder;
    public int warehouse_maxbin_holder;

    int temp_container;
    public int search_count = 0;
    public ArrayList<String> temp_warehouseIDList = new ArrayList<>();
    
    public String convert_phonenumber(String number) {
        if (number.charAt(0) != '0') {
            String temp = "0";
            temp = temp.concat(number);
            return temp;
        }
        return number;
    }
    
    public void get_functional_warehouses(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID AS warehouseID FROM warehouse WHERE isFunctional= 1 ORDER BY warehouseID ASC");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            warehouse_IDList.clear();
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                warehouse_IDList.add(temp);
            }
            
            // Closing Statements
            pstmt.close();
            conn.close();
            
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
        public int delete_warehouse() {
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Delete the supplier.
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM warehouse WHERE warehouseID=?"); //Place DELETE statement.
            pstmt.setInt(1, warehouse_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    public void get_warehouses(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID AS warehouseID FROM warehouse ORDER BY warehouseID ASC");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            warehouse_IDList.clear();
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                warehouse_IDList.add(temp);
            }
            
            // Closing Statements
            pstmt.close();
            conn.close();
            
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    }
        
    
    
    
    public int get_warehouse_record() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Get warehouse record from the database.
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID,phoneNumber, address, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber FROM warehouse WHERE warehouseID=?"); //Place the SQL statement.
            pstmt.setInt(1, warehouse_ID);

            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                warehouse_phonenumber = rst.getString("phoneNumber");
                warehouse_address = rst.getString("address");
                isFunctional = rst.getBoolean("isFunctional");
                warehouse_maxrow = rst.getInt("maxRow");
                warehouse_maxbay = rst.getInt("maxBay");
                warehouse_maxlevel = rst.getInt("maxLevel");
                warehouse_maxbinNumber = rst.getInt("maxBinNumber");
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int register_warehouse() {
        try {
            
            // Instantiate Connection Variable and Connect to Database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            // MySQL INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(warehouseID) + 1 AS newID FROM warehouse");
            ResultSet rst= pstmt.executeQuery();
            
            // Autogenerated Employee ID
            while(rst.next()) {
                warehouse_ID = rst.getInt("newID");
            }

            // Assign Values
            pstmt = conn.prepareStatement("INSERT INTO warehouse (warehouseID, phoneNumber, address, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber) VALUES (?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, warehouse_ID);
            pstmt.setString(2, convert_phonenumber(warehouse_phonenumber));
            pstmt.setString(3, warehouse_address);
            isFunctional = true;
            pstmt.setBoolean(4, isFunctional);
            pstmt.setInt(5, warehouse_maxrow);
            pstmt.setInt(6, warehouse_maxbay);
            pstmt.setInt(7, warehouse_maxlevel);
            pstmt.setInt(8, warehouse_maxbinNumber);

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
    
    public int update_warehouse() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Update the warehouse.
            PreparedStatement pstmt = conn.prepareStatement("UPDATE warehouse "
            + "SET phoneNumber=?, address=?,isFunctional=?, "
            + "maxRow=?, maxBay=?, maxLevel=?, maxBinNumber=? WHERE warehouseID=?"); //Place UPDATE statement.
            pstmt.setString(2, warehouse_phonenumber_temporary);
            pstmt.setBoolean(3, isFunctional_temporary);
            pstmt.setInt(4, Integer.parseInt(warehouse_maxrow_temporary));
            pstmt.setInt(5, Integer.parseInt(warehouse_maxbay_temporary));
            pstmt.setInt(6, Integer.parseInt(warehouse_maxlevel_temporary));
            pstmt.setInt(7, Integer.parseInt(warehouse_maxbinNumber_temporary));
            pstmt.setInt(8, warehouse_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int search_employees(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            

            temp_warehouse_IDList.clear();
            

            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID FROM warehouse (CASE WHEN ? = 0 THEN lastName = ? ELSE lastName != '' END)");

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
