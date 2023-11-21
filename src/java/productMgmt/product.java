package productMgmt;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.*;

public class product {
    
    
    public String product_warehouse_locator;
    public ArrayList<Integer> product_warehouse_locatorList = new ArrayList<>();
    public ArrayList<Integer> product_warehouse_locatorList_exclude = new ArrayList<>();
    
    public int product_product_ID;
    public int product_warehouse_ID;
    public Date product_date_received;
    public int product_product_line_ID;
    public String product_product_condition;
    public String product_reason;
    public float product_stock_price;
    public int product_supplier_ID;
    public int product_bin_ID;
    // WHAT IS PRODUCT UNIT MEASURE
    public String product_unit_measure;
    public boolean product_is_received_from_warehouse;
    public String product_status;
    
    // Temporary Values to Get HTML Inputs
    public String product_product_ID_temporary;
    public String product_warehouse_ID_temporary;
    public String product_date_received_temporary;
    public String product_product_line_ID_temporary;
    public String product_product_condition_temporary;
    public String product_reason_temporary;
    public String product_stock_price_temporary;
    public String product_supplier_ID_temporary;
    public String product_bin_ID_temporary;
    public String product_unit_measure_temporary;
    public String product_is_received_from_warehouse_temporary;
    public String product_status_temporary;

    public ArrayList product_product_IDList = new ArrayList<>();
    
    public ArrayList product_warehouse_IDList = new ArrayList<>();
    public ArrayList product_warehouse_IDList_exclude = new ArrayList<>();
    
    public ArrayList product_date_receivedList= new ArrayList<>();
    
    public ArrayList product_product_line_IDList= new ArrayList<>();
    public ArrayList product_product_line_IDList_exclude= new ArrayList<>();
    
    public ArrayList product_product_conditionList= new ArrayList<>();
    public ArrayList product_reasonList= new ArrayList<>();
    public ArrayList product_stock_priceList= new ArrayList<>();
    
    public ArrayList product_supplier_IDList= new ArrayList<>();
    public ArrayList product_supplier_IDList_exclude= new ArrayList<>();
    
    public ArrayList product_bin_IDList= new ArrayList<>();
    public ArrayList product_unit_measureList= new ArrayList<>();
    public ArrayList product_is_received_from_warehouseList= new ArrayList<>();
    public ArrayList product_statusList= new ArrayList<>();

    public int product_product_ID_holder;
    public int product_warehouse_ID_holder;
    public Date product_date_received_holder;
    public int product_product_line_ID_holder;
    public String product_product_condition_holder;
    public String product_reason_holder;
    public float product_stock_price_holder;
    public int product_supplier_ID_holder;
    public int product_bin_ID_holder;
    public String product_unit_measure_holder;
    public boolean product_is_received_from_warehouse_holder;
    public String product_status_holder;

    public String date_temporary;
    public Date date = new Date();
    DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");

    int temp_container;
    public int search_count = 0;
    public ArrayList<String> temp_productIDList = new ArrayList<>();

    public void get_functional_warehouses(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID AS warehouseID FROM warehouse WHERE isFunctional= 1 ORDER BY warehouseID ASC");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_warehouse_IDList.clear();
            
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                product_warehouse_IDList.add(temp);
            }
            
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_functional_warehouses_exclude(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID AS warehouseID FROM warehouse WHERE isFunctional= 1 AND warehouseID != ? ORDER BY warehouseID ASC");
            pstmt.setInt(1, product_warehouse_ID);
            
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_warehouse_IDList_exclude.clear();
            
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                product_warehouse_IDList_exclude.add(temp);
            }
            
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_suppliers_products(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierID FROM supplier");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_supplier_IDList.clear();
            
            while (rst.next()){
                temp = rst.getInt("supplierID");
                product_supplier_IDList.add(temp);
            }
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_suppliers_products_exclude(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierID FROM supplier WHERE supplierID != ?");
            pstmt.setInt(1, product_supplier_ID);
            
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_supplier_IDList_exclude.clear();
            
            while (rst.next()){
                temp = rst.getInt("supplierID");
                product_supplier_IDList_exclude.add(temp);
            }
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_binfrom_warehouses(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT binID FROM bin WHERE warehouseID = ? AND isAvailable = 1");
            pstmt.setInt(1, Integer.valueOf(product_warehouse_locator));
            
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_warehouse_locatorList.clear();
            
            while (rst.next()){
                temp = rst.getInt("binID");
                product_warehouse_locatorList.add(temp);
            }
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_binfrom_warehouses_exclude(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT binID FROM bin WHERE warehouseID = ? AND isAvailable = 1");
            pstmt.setInt(1, Integer.valueOf(product_warehouse_locator));
            //pstmt.setInt(2, product_warehouse_ID);
            
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_warehouse_locatorList_exclude.clear();
            
            while (rst.next()){
                temp = rst.getInt("binID");
                product_warehouse_locatorList_exclude.add(temp);
            }
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_productline_warehouses(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT productLineID FROM productline WHERE isActive = 1");
            
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_product_line_IDList.clear();
            
            while (rst.next()){
                temp = rst.getInt("productLineID");
                product_product_line_IDList.add(temp);
            }
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void get_productline_warehouses_exclude(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT productLineID FROM productline WHERE productLineID != ? AND isActive = 1");
            pstmt.setInt(1, this.product_product_line_ID);
            
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            product_product_line_IDList_exclude.clear();
            
            while (rst.next()){
                temp = rst.getInt("productLineID");
                product_product_line_IDList_exclude.add(temp);
            }
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void convert_date(String date) {
        try{
            this.product_date_received = date_format.parse(date); 
        } catch(Exception o){
            o.printStackTrace();
        }
    }
    
    public int get_product_IDs() {
        //It works.
        try {
            //1. Connect to database.
     
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            //Clear field arraylist.
            product_product_IDList.clear();

            //2. Get products from the database and put them in arraylists.
            PreparedStatement pstmt = conn.prepareStatement("SELECT productID FROM product ORDER BY productID ASC"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                product_product_ID = rst.getInt("productID");
                product_product_IDList.add(product_product_ID);              
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    

        public int get_product_record() {
        //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");


            //2. Get warehouses from the database and put them in arraylists.
            PreparedStatement pstmt = conn.prepareStatement("SELECT productID, warehouseID, productLineID, productCondition, reason, stockPrice, supplierID, binID, unitMeasure, isReceivedFromWarehouse, status, dateReceived FROM product WHERE productID=?"); //Place the SQL statement.
            pstmt.setInt(1, product_product_ID);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                product_warehouse_ID = rst.getInt("warehouseID");
                product_product_line_ID = rst.getInt("productLineID");
                product_product_condition = rst.getString("productCondition");
                product_reason = rst.getString("reason");
                product_stock_price = rst.getFloat("stockPrice");
                product_supplier_ID = rst.getInt("supplierID");
                product_bin_ID = rst.getInt("binID");
                product_unit_measure = rst.getString("unitMeasure");
                product_is_received_from_warehouse = rst.getBoolean("isReceivedFromWarehouse");
                product_status = rst.getString("status");
                product_date_received = rst.getDate("dateReceived");
            }
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;

        }
    }

    public int register_product() {
        try {
            
            // Instantiate Connection Variable and Connect to Database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            // MySQL INSERT Statement
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(productID) + 1 AS newID FROM product");
            ResultSet rst= pstmt.executeQuery();
            
            // Autogenerated Employee ID
            while(rst.next()) {
                product_product_ID = rst.getInt("newID");
            }

            // Assign Values
            pstmt = conn.prepareStatement("INSERT INTO product (productID, warehouseID, dateReceived, productLineID, productCondition, reason, stockPrice, supplierID, binID, unitMeasure, isReceivedFromWarehouse, status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, product_product_ID);
            pstmt.setInt(2, product_warehouse_ID);

            convert_date(date_temporary);

            pstmt.setDate(3, new java.sql.Date(product_date_received.getTime()));
            pstmt.setInt(4, product_product_line_ID);
            pstmt.setString(5, product_product_condition);
            pstmt.setString(6, product_reason);
            pstmt.setFloat(7, product_stock_price);
            pstmt.setInt(8, product_supplier_ID);
            pstmt.setInt(9, product_bin_ID);
            pstmt.setString(10, product_unit_measure);
            product_is_received_from_warehouse = false;
            pstmt.setBoolean(11, product_is_received_from_warehouse);
            
            // What do we put here?
            pstmt.setString(12, product_status);

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

}
