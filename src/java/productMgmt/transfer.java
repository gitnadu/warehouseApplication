package productMgmt;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.*;

public class transfer {
    
    public int      transfer_transfer_ID;
    public String   transfer_status;
    public Date     transfer_start_date = new Date();;
    public Date     transfer_end_date = new Date();;
    public String   transfer_reason;
    public int      transfer_warehouse_origin_ID;
    public int      transfer_warehouse_destination_ID;
    public int      transfer_employee_in_charge_ID;

    public String   transfer_transfer_ID_temporary;
    public String   transfer_status_temporary;
    public String   transfer_start_date_temporary;
    public String   transfer_end_date_temporary;
    public String   transfer_reason_temporary;
    public String   transfer_warehouse_origin_ID_temporary;
    public String   transfer_warehouse_destination_ID_temporary;
    public String   transfer_employee_in_charge_ID_temporary;

    public int      transfer_transfer_ID_holder;
    public String   transfer_status_holder;
    public Date     transfer_start_date_holder = new Date();;
    public Date     transfer_end_date_holder = new Date();;
    public String   transfer_reason_holder;
    public int      transfer_warehouse_origin_ID_holder;
    public int      transfer_warehouse_destination_ID_holder;
    public int      transfer_employee_in_charge_ID_holder;

    public ArrayList    transfer_transfer_ID_list = new ArrayList<>();
    public ArrayList    transfer_status_list = new ArrayList<>();
    public ArrayList    transfer_start_date_list = new ArrayList<>();
    public ArrayList    transfer_end_date_list = new ArrayList<>();
    public ArrayList    transfer_reason_list = new ArrayList<>();
    public ArrayList    transfer_warehouse_origin_ID_list = new ArrayList<>();
    public ArrayList    transfer_warehouse_destination_ID_list = new ArrayList<>();
    public ArrayList    transfer_employee_in_charge_ID_list = new ArrayList<>();

    public int          transfer_product_ID;
    public ArrayList    transfer_products_from_warehouse = new ArrayList<>();

    public ArrayList<Integer>    transfer_selected_products = new ArrayList<>();
    public ArrayList    transfer_warehouse_ID_list = new ArrayList<>();
    public ArrayList    transfer_warehouse_ID_list_excluded = new ArrayList<>();

            
            
    public String date_temporary;
    public Date date = new Date();
    DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");

    int transfer_temp_container;
    public int transfer_search_count = 0;
    public ArrayList<String> temp_transfer_ID_list = new ArrayList<>();

    public void convert_date(String date) {
        try{
            // DEBUG ME!
            this.transfer_start_date = date_format.parse(date); 
            this.transfer_end_date = date_format.parse(date); 
        } catch(Exception o){
            o.printStackTrace();
        }
    }

    public int register_transfer() {
        try {
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(transferID) + 1 AS newID FROM stocktransfer");
            ResultSet rst= pstmt.executeQuery();
            
            // Autogenerated Employee ID
            while(rst.next()) {
                transfer_transfer_ID = rst.getInt("newID");
            }

            // Assign Values
            pstmt = conn.prepareStatement("INSERT INTO stocktransfer (transferID, status, startDate, endDate, reason, warehouseOriginID, warehouseDestinationID, employeeInChargeID) VALUES (?,?,?,?,?,?,?,?)");
            pstmt.setInt(1, transfer_transfer_ID);
            pstmt.setString(2, "Scheduled");

            convert_date(date_temporary);

            pstmt.setDate(3, new java.sql.Date(transfer_start_date.getTime()));
            pstmt.setDate(4, null);
            pstmt.setString(5, "");
            pstmt.setInt(6, transfer_warehouse_origin_ID);
            pstmt.setInt(7, transfer_warehouse_destination_ID);
            pstmt.setInt(8, transfer_employee_in_charge_ID);
            
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
    
    public int add_stock_transfer() {
        try {
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        
            PreparedStatement pstmt;
            // Assign Values
            for (int i=0;i < transfer_selected_products.size();i++)
            {
                pstmt = conn.prepareStatement("INSERT INTO stockfortransfer (productID, warehouseID, transferID) VALUES (?,?,?)");
                pstmt.setInt(1, transfer_selected_products.get(i));
                pstmt.setInt(2, transfer_warehouse_origin_ID); 
                pstmt.setInt(3, transfer_transfer_ID); 
                pstmt.executeUpdate();
                pstmt.close();
                
            }
            conn.close();
            return 1;

        } catch (SQLException e) {
            return 0;
        }         
    }
    
    
    
    

    public int update_transfer() {
        try {
           
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE stockTransfer SET status=?, startDate=?,"
                    + "endDate=?, reason= ?, warehouseOriginID=?, warehouseDestinationID=?, employeeInChargeID=?"
                    + "WHERE transferID=?"); //Place UPDATE statement.
            
            pstmt.setString(1, transfer_status_temporary);
            pstmt.setDate(2, new java.sql.Date(transfer_start_date.getTime()));
            pstmt.setDate(3, new java.sql.Date(transfer_end_date.getTime()));
            pstmt.setString(4, transfer_reason_temporary);
            pstmt.setInt(5, Integer.parseInt(transfer_warehouse_origin_ID_temporary));
            pstmt.setInt(6, Integer.parseInt(transfer_warehouse_destination_ID_temporary));
            pstmt.setInt(7, Integer.parseInt(transfer_employee_in_charge_ID_temporary));
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return 1;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
   

    public int get_workers_from_warehouse() {
        try {

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            transfer_employee_in_charge_ID_list.clear();

            PreparedStatement pstmt = conn.prepareStatement("SELECT employeeNumber FROM worker WHERE warehouseID = ? ORDER BY employeeNumber ASC"); //Place the SQL statement.
            pstmt.setInt(1, Integer.parseInt(transfer_warehouse_origin_ID_temporary));

            ResultSet rst = pstmt.executeQuery();
            
            while (rst.next()) {
                transfer_employee_in_charge_ID = rst.getInt("employeeNumber");
                transfer_employee_in_charge_ID_list.add(transfer_employee_in_charge_ID);              
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public void get_warehouses() {
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID FROM warehouse WHERE isFunctional= 1 ORDER BY warehouseID ASC");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            transfer_warehouse_origin_ID_list.clear();
            
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                transfer_warehouse_origin_ID_list.add(temp);
            }
            
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void get_warehouses_destination(){
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID AS warehouseID FROM warehouse WHERE isFunctional= 1 AND warehouseID != ? ORDER BY warehouseID ASC");
            pstmt.setInt(1, transfer_warehouse_destination_ID);
            
            int temp;
            ResultSet rst= pstmt.executeQuery();
            transfer_warehouse_ID_list_excluded.clear();
            
            while (rst.next()){
                temp = rst.getInt("warehouseID");
                transfer_warehouse_ID_list_excluded.add(temp);
            }
            
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void get_transfer_IDs() {
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT transferID AS transferID FROM stockTransfer ORDER BY transferID ASC");
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            transfer_transfer_ID_list.clear();
            
            while (rst.next()){
                temp = rst.getInt("transferID");
                transfer_transfer_ID_list.add(temp);
            }
            
            pstmt.close();
            conn.close();   
        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public int get_product_record() {
        try {
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
    
            PreparedStatement pstmt = conn.prepareStatement("SELECT transferID, status, startDate, endDate, reason, warehouseOriginID, warehouseDestinationID, employeeInChargeID FROM stockTransfer WHERE transferID=?"); //Place the SQL statement.
            pstmt.setInt(1, transfer_transfer_ID);
    
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                transfer_transfer_ID = rst.getInt("transferID");
                transfer_status = rst.getString("status");
                transfer_start_date = rst.getDate("startDate");
                transfer_end_date = rst.getDate("endDate");
                transfer_reason = rst.getString("reason");
                transfer_warehouse_origin_ID = rst.getInt("warehouseOriginID");
                transfer_warehouse_destination_ID = rst.getInt("warehouseDestinationID");
                transfer_employee_in_charge_ID = rst.getInt("employeeInChargeID");
            }
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int get_products() {
        try {
            transfer_products_from_warehouse.clear();
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
    
            PreparedStatement pstmt = conn.prepareStatement("SELECT productID FROM product WHERE warehouseID = ?"); //Place the SQL statement.
            pstmt.setInt(1, transfer_warehouse_origin_ID);
    
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                int temp = rst.getInt("productID");
                transfer_products_from_warehouse.add(temp);
            }
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    

}