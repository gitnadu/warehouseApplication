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
    public String warehouse_name;
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
    public String isFunctional_temporary;
    
    public String warehouse_maxrow_temporary;
    public String warehouse_maxbay_temporary;
    public String warehouse_maxlevel_temporary;
    public String warehouse_maxbinNumber_temporary;
    public String warehouse_name_temporary;
    

    public ArrayList warehouse_IDList = new ArrayList<>();
    public ArrayList warehouse_nameList = new ArrayList<>();
    public ArrayList warehouse_phonenumberList = new ArrayList<>();
    public ArrayList warehouse_addressList = new ArrayList<>();
    public ArrayList isFunctionalList = new ArrayList<>();
    public ArrayList warehouse_maxrowList = new ArrayList<>();
    public ArrayList warehouse_maxbayList = new ArrayList<>();
    public ArrayList warehouse_maxlevelList = new ArrayList<>();
    public ArrayList warehouse_maxbinNumberList = new ArrayList<>();
    
    
    public ArrayList<String> temp_warehouse_IDList = new ArrayList<>();

    public int warehouse_ID_holder;
    public String warehouse_name_holder;
    public String warehouse_phonenumber_holder;
    public String warehouse_address_holder;
    public String isFunctional_holder;
    public int warehouse_maxrow_holder;
    public int warehouse_maxbay_holder;
    public int warehouse_maxlevel_holder;
    public int warehouse_maxbin_holder;

    public int temp_container;
    public int warehouse_search_count = 0;
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID, name,phoneNumber, address, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber FROM warehouse WHERE warehouseID=?"); //Place the SQL statement.
            pstmt.setInt(1, warehouse_ID);

            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                warehouse_phonenumber = rst.getString("phoneNumber");
                warehouse_name = rst.getString("name");
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
            pstmt = conn.prepareStatement("INSERT INTO warehouse (warehouseID, name, phoneNumber, address, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber) VALUES (?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, warehouse_ID);
            pstmt.setString(2, warehouse_name);
            pstmt.setString(3, convert_phonenumber(warehouse_phonenumber));
            pstmt.setString(4, warehouse_address);
            isFunctional = true;
            pstmt.setBoolean(5, isFunctional);
            pstmt.setInt(6, warehouse_maxrow);
            pstmt.setInt(7, warehouse_maxbay);
            pstmt.setInt(8, warehouse_maxlevel);
            pstmt.setInt(9, warehouse_maxbinNumber);

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
            + "SET phoneNumber=?, name=?, address=?, isFunctional=?, "
            + "maxRow=?, maxBay=?, maxLevel=?, maxBinNumber=? WHERE warehouseID=?"); //Place UPDATE statement.
            pstmt.setString(1, warehouse_phonenumber_temporary);
            pstmt.setString(2, warehouse_name_temporary);
            pstmt.setString(3, warehouse_address_temporary);
            
            if (isFunctional_temporary.equals("true"))
                pstmt.setBoolean(4, true);
            else
                pstmt.setBoolean(4, false);
            
            pstmt.setInt(5, Integer.parseInt(warehouse_maxrow_temporary));
            pstmt.setInt(6, Integer.parseInt(warehouse_maxbay_temporary));
            pstmt.setInt(7, Integer.parseInt(warehouse_maxlevel_temporary));
            pstmt.setInt(8, Integer.parseInt(warehouse_maxbinNumber_temporary));
            pstmt.setInt(9, warehouse_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int search_warehouse(){
        try{
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            

            temp_warehouse_IDList.clear();

            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID FROM warehouse WHERE (CASE WHEN ? = 0 THEN name LIKE CONCAT('%', ?, '%') ELSE name != '' END)");

            if(warehouse_name_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, warehouse_name_holder);
            }
                
            ResultSet rst = pstmt.executeQuery();

            containList(rst);
            
            // 2
            StringBuilder sql = new StringBuilder("SELECT warehouseID FROM warehouse WHERE (CASE WHEN ? = 0 THEN address LIKE CONCAT('%', ?, '%') ELSE address != '' END) AND warehouseID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(warehouse_address_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, warehouse_address_holder);
            }
            
            set_idList(pstmt);
            temp_warehouse_IDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);


             // 3
            sql = new StringBuilder("SELECT warehouseID FROM warehouse WHERE (CASE WHEN ? = 0 THEN isFunctional = ? ELSE isFunctional > -1 END) AND warehouseID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(isFunctional_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setInt(2, 0);   
            }
            else
            {
                pstmt.setInt(1, 0);
                if (isFunctional_holder.equals("true"))
                   pstmt.setInt(2, 1);
                else 
                   pstmt.setInt(2, 0);  
            }
            
            set_idList(pstmt);
            temp_warehouse_IDList.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);
            
            // final
            
            sql = new StringBuilder("SELECT phoneNumber, name, address, isFunctional, maxRow, maxBay, maxLevel, maxBinNumber FROM warehouse WHERE warehouseID IN (");

            addString(sql);
            
            sql.append(" ORDER BY name ASC");
           
            pstmt = conn.prepareStatement(sql.toString());
            
            for (int i = 0; i < temp_warehouse_IDList.size(); i++) 
                pstmt.setString(i+1,temp_warehouse_IDList.get(i));
            
            rst= pstmt.executeQuery();
            
            
            warehouse_search_count = 0;
            
            warehouse_nameList.clear();
            warehouse_phonenumberList.clear();
            warehouse_addressList.clear();
            isFunctionalList.clear();
            warehouse_maxrowList.clear();
            warehouse_maxbayList.clear();
            warehouse_maxlevelList.clear();
            warehouse_maxbinNumberList.clear();
            
            while (rst.next()) {
                warehouse_phonenumber = rst.getString("phoneNumber");
                warehouse_name = rst.getString("name");
                warehouse_address = rst.getString("address");
                isFunctional = rst.getBoolean("isFunctional");
                warehouse_maxrow = rst.getInt("maxRow");
                warehouse_maxbay = rst.getInt("maxBay");
                warehouse_maxlevel = rst.getInt("maxLevel");
                warehouse_maxbinNumber = rst.getInt("maxBinNumber");

                warehouse_phonenumberList.add(warehouse_phonenumber);
                warehouse_nameList.add(warehouse_name);
                warehouse_addressList.add(warehouse_address);
                isFunctionalList.add(isFunctional);
                warehouse_maxrowList.add(warehouse_maxrow);
                warehouse_maxbayList.add(warehouse_maxbay);
                warehouse_maxlevelList.add(warehouse_maxlevel);
                warehouse_maxbinNumberList.add(warehouse_maxbinNumber);
              
                warehouse_search_count++;
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
            temp_container = rst.getInt("warehouseID");
            temp_warehouse_IDList.add(Integer.toString(temp_container));
        }

    }
    
    public void addString(StringBuilder sql)
    {
        for (int i = 0; i < temp_warehouse_IDList.size(); i++) {
        sql.append("?");
            if (i < temp_warehouse_IDList.size() - 1) 
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
            for (int i = 0; i < temp_warehouse_IDList.size(); i++) 
            {
                pstmt.setString(i+3,temp_warehouse_IDList.get(i));
            } 
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
    }
    
}
