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

    public String product_product_ID_holder;
    public String product_warehouse_ID_holder;
    public String product_date_received_holder;
    public String product_product_line_ID_holder;
    public String product_product_condition_holder;
    public String product_reason_holder;
    public String product_stock_price_holder;
    public String product_supplier_ID_holder;
    public String product_bin_ID_holder;
    public String product_unit_measure_holder;
    public String product_is_received_from_warehouse_holder;
    public String product_status_holder;

    public String date_temporary;
    public Date date = new Date();
    DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");

    int product_temp_container;
    public int product_search_count = 0;
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
    public int update_product() { //It works.
        try {
            //1. Connect to database.
           
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            //2. Update the supplier.
            PreparedStatement pstmt = conn.prepareStatement("UPDATE product SET warehouseID=?, productLineID=?, productCondition=?, "
                    + "stockPrice=?, supplierID= ?, binID =?, unitMeasure=?, isReceivedFromWarehouse=?, status=?, dateReceived=?"
                    + "WHERE productID=?"); //Place UPDATE statement.
            
            pstmt.setInt(1, Integer.parseInt(product_warehouse_ID_temporary));
            pstmt.setInt(2, Integer.parseInt(product_product_line_ID_temporary));
            pstmt.setString(3, product_product_condition_temporary);
            pstmt.setFloat(4, Float.parseFloat(product_stock_price_temporary));
            pstmt.setInt(5, Integer.parseInt(product_supplier_ID_temporary));
            pstmt.setInt(6, Integer.parseInt(product_bin_ID_temporary));
            pstmt.setString(7, product_unit_measure_temporary);
            
            if (product_is_received_from_warehouse_temporary.equals("true"))
                pstmt.setBoolean(8, true);
            else
                pstmt.setBoolean(8, false);
            
            pstmt.setString(9, product_status_temporary);
            this.convert_date(product_date_received_temporary);
            
            pstmt.setDate(10, new java.sql.Date(product_date_received.getTime()));
            
            pstmt.setInt(11, product_product_ID);
            
            pstmt.executeUpdate();

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

   

    public int search_products(){
        
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            temp_productIDList.clear();
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN warehouseID = ? ELSE warehouseID != '' END)");

            if(product_warehouse_ID_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, product_warehouse_ID_holder);
            }

                
            ResultSet rst = pstmt.executeQuery();

            containList(rst);
            
            //2
            StringBuilder sql = new StringBuilder("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN dateReceived = ? ELSE dateReceived != '' END) AND productID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());
 
            if(product_date_received_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                this.convert_date(product_date_received_holder);
                pstmt.setDate(2, new java.sql.Date(product_date_received.getTime()));
            }
                
            set_idList(pstmt);
            
            temp_productIDList.clear();
            
            rst = pstmt.executeQuery();

            containList(rst);
            
            // 3
            

            sql = new StringBuilder("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN productLineID = ? ELSE productLineID != '' END) AND productID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());
 
            if(product_product_line_ID_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setInt(2, Integer.parseInt(product_product_line_ID_holder));
            }
                
            set_idList(pstmt);
            
            temp_productIDList.clear();
            
            
            rst = pstmt.executeQuery();

            containList(rst);
            


            // 4
            
            sql = new StringBuilder("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN productCondition = ? ELSE productCondition != '' END) AND productID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());
 
            if(product_product_condition_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, product_product_condition_holder);
            }
            
            set_idList(pstmt);
            
            temp_productIDList.clear();
                
            rst = pstmt.executeQuery();

            containList(rst);
            
            // 5

            sql = new StringBuilder("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN stockPrice = ? ELSE stockPrice != '' END) AND productID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());
 
            if(product_stock_price_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setInt(2, Integer.parseInt(product_stock_price_holder));
            }
            
            set_idList(pstmt);
            
            temp_productIDList.clear();
                
            rst = pstmt.executeQuery();

            containList(rst);
            
            //6
            sql = new StringBuilder("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN supplierID = ? ELSE supplierID != '' END) AND productID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());
 
            if(product_supplier_ID_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setInt(2, Integer.parseInt(product_supplier_ID_holder));
            }
            
            set_idList(pstmt);
            
            temp_productIDList.clear();
                
            rst = pstmt.executeQuery();

            containList(rst);
//            

            // 7
            sql = new StringBuilder("SELECT productID FROM product WHERE (CASE WHEN ? = 0 THEN unitMeasure = ? ELSE unitMeasure != '' END) AND productID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());
 
            if(product_unit_measure_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, product_unit_measure_holder);
            }
            
            set_idList(pstmt);
            
            temp_productIDList.clear();
                
            rst = pstmt.executeQuery();

            containList(rst);
            
            // printer
            
            sql = new StringBuilder("SELECT warehouseID, productLineID, productCondition, reason, stockPrice, supplierID, binID, "
                    + "unitMeasure, dateReceived, isReceivedFromWarehouse, status FROM product WHERE productID IN (");
            
            addString(sql);
            
            sql.append(" ORDER BY productID ASC");
           
            pstmt = conn.prepareStatement(sql.toString());
            
            for (int i = 0; i < temp_productIDList.size(); i++) 
                pstmt.setString(i+1,temp_productIDList.get(i));
                    
            
            rst= pstmt.executeQuery();
            
            product_search_count = 0;
            
 
            product_warehouse_IDList.clear();
            product_date_receivedList.clear();
            product_product_line_IDList.clear();
            product_product_conditionList.clear();
            product_reasonList.clear();
            product_stock_priceList.clear();
            product_supplier_IDList.clear();
            product_bin_IDList.clear();
            product_unit_measureList.clear();
            product_is_received_from_warehouseList.clear();
            product_statusList.clear();
            
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
                
                product_warehouse_IDList.add(product_warehouse_ID);
                product_date_receivedList.add(product_date_received);
                product_product_line_IDList.add(product_product_line_ID);
                product_product_conditionList.add(product_product_condition);
                product_reasonList.add(product_reason);
                product_stock_priceList.add(product_stock_price);
                product_supplier_IDList.add(product_supplier_ID);
                product_bin_IDList.add(product_bin_ID);
                product_unit_measureList.add(product_unit_measure);
                product_is_received_from_warehouseList.add(product_is_received_from_warehouse);
                product_statusList.add(product_status);
                
                product_search_count++;
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
            product_temp_container = rst.getInt("productID");
            temp_productIDList.add(Integer.toString(product_temp_container));
        }

    }
    
    public void addString(StringBuilder sql)
    {
        for (int i = 0; i < temp_productIDList.size(); i++) {
        sql.append("?");
            if (i < temp_productIDList.size() - 1) 
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
            for (int i = 0; i < temp_productIDList.size(); i++) 
            {
                pstmt.setString(i+3,temp_productIDList.get(i));
            } 
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

}
