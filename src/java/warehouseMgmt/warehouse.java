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
    public String warehouse_city;
    public String warehouse_phonenumber;
    public String warehouse_first_address;
    public String warehouse_state;
    public String warehouse_country;
    public String warehouse_postalcode;
    public boolean isFunctional;
    public Integer warehouse_maxrow;
    public Integer warehouse_maxbay;
    public Integer warehouse_maxlevel;
    public Integer warehouse_maxbinNumber;
    
    
    // temporary variables to get html input
    public int warehouse_ID_temporary;
    public String warehouse_city_temporary;
    public String warehouse_phonenumber_temporary;
    public String warehouse_first_address_temporary;
    public String warehouse_state_temporary;
    public String warehouse_country_temporary;
    public String warehouse_postalcode_temporary;
    public boolean isFunctional_temporary;
    
    public String warehouse_maxrow_temporary;
    public String warehouse_maxbay_temporary;
    public String warehouse_maxlevel_temporary;
    public String warehouse_maxbinNumber_temporary;
    

    public ArrayList warehouse_IDList = new ArrayList<>();
    public ArrayList warehouse_cityList = new ArrayList<>();
    public ArrayList warehouse_phonenumberList = new ArrayList<>();
    public ArrayList warehouse_first_addressList = new ArrayList<>();
    public ArrayList permanent_addressList = new ArrayList<>();
    public ArrayList warehouse_stateList = new ArrayList<>();
    public ArrayList warehouse_countryList = new ArrayList<>();
    public ArrayList warehouse_postalcodeList = new ArrayList<>();
    public ArrayList isFunctionalList = new ArrayList<>();
    public ArrayList warehouse_maxrowList = new ArrayList<>();
    public ArrayList warehouse_maxbayList = new ArrayList<>();
    public ArrayList warehouse_maxlevelList = new ArrayList<>();
    public ArrayList warehouse_maxbinNumberList = new ArrayList<>();

    public int warehouse_ID_holder;
    public String warehouse_city_holder;
    public String warehouse_phonenumber_holder;
    public String warehouse_first_address_holder;
    public String warehouse_state_holder;
    public String warehouse_country_holder;
    public String warehouse_postalcode_holder;
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID, city, phoneNumber, firstAddress, state, country, postalCode, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber FROM warehouse WHERE warehouseID=?"); //Place the SQL statement.
            pstmt.setInt(1, warehouse_ID);

            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                warehouse_city = rst.getString("city");
                warehouse_phonenumber = rst.getString("phoneNumber");
                warehouse_first_address = rst.getString("firstAddress");
                warehouse_state = rst.getString("state");
                warehouse_country = rst.getString("country");
                warehouse_postalcode = rst.getString("postalCode");
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
            pstmt = conn.prepareStatement("INSERT INTO warehouse (warehouseID, city, phoneNumber, firstAddress, state, country, postalCode, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, warehouse_ID);
            pstmt.setString(2, warehouse_city);
            pstmt.setString(3, convert_phonenumber(warehouse_phonenumber));
            pstmt.setString(4, warehouse_first_address);
            pstmt.setString(5, warehouse_state);
            pstmt.setString(6, warehouse_country);
            pstmt.setString(7, warehouse_postalcode);
            isFunctional = true;
            pstmt.setBoolean(8, isFunctional);
            pstmt.setInt(9, warehouse_maxrow);
            pstmt.setInt(10, warehouse_maxbay);
            pstmt.setInt(11, warehouse_maxlevel);
            pstmt.setInt(12, warehouse_maxbinNumber);

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
            + "SET city=?, phoneNumber=?, firstAddress=?, state=?, country=?, postalCode=?, isFunctional=?, "
            + "maxRow=?, maxBay=?, maxLevel=?, maxBinNumber=? WHERE warehouseID=?"); //Place UPDATE statement.
            pstmt.setString(1, warehouse_city_temporary);
            pstmt.setString(2, warehouse_phonenumber_temporary);
            pstmt.setString(3, warehouse_first_address_temporary);
            pstmt.setString(4, warehouse_state_temporary);
            pstmt.setString(5, warehouse_country_temporary);
            pstmt.setString(6, warehouse_postalcode_temporary);
            pstmt.setBoolean(7, isFunctional_temporary);
            pstmt.setInt(8, Integer.parseInt(warehouse_maxrow_temporary));
            pstmt.setInt(9, Integer.parseInt(warehouse_maxbay_temporary));
            pstmt.setInt(10, Integer.parseInt(warehouse_maxlevel_temporary));
            pstmt.setInt(11, Integer.parseInt(warehouse_maxbinNumber_temporary));
            pstmt.setInt(12, warehouse_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public static void main(String args[]) {
    }
    
}
