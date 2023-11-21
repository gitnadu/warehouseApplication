package warehouseMgmt;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.*;

public class inventory_physical_checking {
    public int inventory_check_ID;
    public int checking_warehouse_ID;
    public int product_line_ID;
    public Date date_checked = new Date();
    public int employee_in_charge_ID;
    public int quantity_checked;
    public int quantity_disposed;
    
    public ArrayList<Integer> inventory_checkIDList = new ArrayList<>();
    public ArrayList<Integer> checking_warehouse_IDList = new ArrayList<>();;
    public ArrayList<Integer> checking_product_lineIDlist = new ArrayList<>();;
    public ArrayList<Date>    date_checkedList = new ArrayList<>();;
    public ArrayList<Integer> employeeInCharge_IDList = new ArrayList<>();
    public ArrayList<Integer> quantity_checkedList = new ArrayList<>();
    public ArrayList<Integer> quantity_disposedList = new ArrayList<>();
    
    public ArrayList<Integer> products_warehouse = new ArrayList<>();
    public ArrayList<String> products_status = new ArrayList<>();
    
    public ArrayList<Integer> productLine_warehouse = new ArrayList<>();
    
    public ArrayList<Integer> products_checked = new ArrayList<>();
    public ArrayList<Integer> products_disposed = new ArrayList<>();
    
    
    public String date_checked_str;
    private DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
    public Exception err;
    
    
    
    public inventory_physical_checking() {}

    public void convert_date_checked() {
        try {
            this.date_checked = this.date_format.parse(date_checked_str);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public int get_products() {
        try {
            
            products_warehouse.clear();
            products_status.clear();
            
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
    
            PreparedStatement pstmt = conn.prepareStatement("SELECT productID, status FROM product WHERE warehouseID = ? AND productLineID = ?"); //Place the SQL statement.
            pstmt.setInt(1, checking_warehouse_ID);
            pstmt.setInt(2, product_line_ID);
            
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                
                int temp = rst.getInt("productID");
                String tempo = rst.getString("status");
                products_warehouse.add(temp);
                products_status.add(tempo);
                
            }
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int get_productline_fromwarehouse() {
        try {
            
            productLine_warehouse.clear();
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
    
            PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT p.productLineID AS productLineID FROM warehouse w LEFT JOIN product p ON p.warehouseID = w.warehouseID WHERE p.warehouseID = ?");
            pstmt.setInt(1, checking_warehouse_ID);
    
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                int temp = rst.getInt("productLineID");
                productLine_warehouse.add(temp);
            }
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    

    public int get_workers() {
        try {
            //1. Connect to database.

            // incorrect
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //Clear field arraylists.
            employeeInCharge_IDList.clear(); //Used as a worker arraylist.
            checking_warehouse_IDList.clear();

            //Arraylists for other fields are cleared in case.
            inventory_checkIDList.clear();
            checking_product_lineIDlist.clear();
            date_checkedList.clear();
            quantity_checkedList.clear();
            quantity_disposedList.clear();

            //2. Get employeeNumber and warehouseID from the database and put them in an arraylist.
            PreparedStatement pstmt = conn.prepareStatement("SELECT wo.employeeNumber, wo.warehouseID FROM worker wo JOIN warehouse wa ON wo.warehouseID = wa.warehouseID ORDER BY wo.employeeNumber"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                employee_in_charge_ID = rst.getInt("wo.employeeNumber"); //Used as a employeeNumber
                checking_warehouse_ID = rst.getInt("wo.warehouseID");
                
                employeeInCharge_IDList.add(employee_in_charge_ID);
                checking_warehouse_IDList.add(checking_warehouse_ID);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int get_workers_for_warehouse() {
        try {
            
            employeeInCharge_IDList.clear();
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Get warehouseID from the database and put them in an arraylist.
            PreparedStatement pstmt = conn.prepareStatement("SELECT wo.employeeNumber FROM warehouse wa JOIN worker wo ON wa.warehouseID = wo.warehouseID WHERE wa.warehouseID = ? AND wa.isFunctional = TRUE"); //Place the SQL statement.
            pstmt.setInt(1, checking_warehouse_ID); //employee_in_charge_ID is used as a worker employeeNumber.
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                employee_in_charge_ID = rst.getInt("wo.employeeNumber");
                
                employeeInCharge_IDList.add(employee_in_charge_ID);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int get_functional_warehouses() {
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //Clear field arraylists.
            checking_warehouse_IDList.clear();

            //Arraylists for other fields are cleared in case.
            inventory_checkIDList.clear();
            checking_product_lineIDlist.clear();
            date_checkedList.clear();
            employeeInCharge_IDList.clear();
            quantity_checkedList.clear();
            quantity_disposedList.clear();

            //2. Get warehouseID from the database and put them in an arraylist.
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID FROM warehouse WHERE isFunctional = TRUE"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                checking_warehouse_ID = rst.getInt("warehouseID");
                
                checking_warehouse_IDList.add(checking_warehouse_ID);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int get_active_product_lines() {
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //Clear field arraylists.
            checking_product_lineIDlist.clear();
            
            //Arraylists for other fields are cleared in case.
            inventory_checkIDList.clear();
            checking_warehouse_IDList.clear();
            date_checkedList.clear();
            employeeInCharge_IDList.clear();
            quantity_checkedList.clear();
            quantity_disposedList.clear();

            //2. Get employeeNumber and warehouseID from the database and put them in an arraylist.
            PreparedStatement pstmt = conn.prepareStatement("SELECT productLineID FROM productLine WHERE isActive = TRUE;"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                product_line_ID = rst.getInt("productLineID");
                
                checking_product_lineIDlist.add(product_line_ID);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int register_inventory_physical_checking() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. To get the next physical_checking_inventory_ID.
            //2.1 Get the next physical_checking_inventory_ID.
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(inventoryCheckID) + 1 AS newID FROM inventoryphysicalchecking"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                inventory_check_ID = rst.getInt("newID");
            }

            //2.2 Save the new warehouse.
            pstmt = conn.prepareStatement("INSERT INTO inventoryphysicalchecking (inventoryCheckID, warehouseID, productLineID, dateChecked, employeeInChargeID, quantityChecked, quantityDisposed) VALUES (?,?,?,?,?,?,?)"); //Place INSERT INTO statement.
            pstmt.setInt(1, inventory_check_ID);
            pstmt.setInt(2, checking_warehouse_ID);
            pstmt.setInt(3, product_line_ID);
            pstmt.setDate(4, new java.sql.Date(date_checked.getTime()));
            pstmt.setInt(5, employee_in_charge_ID);
            quantity_checked = products_checked.size();
            quantity_disposed = products_disposed.size(); 
            pstmt.setInt(6, quantity_checked);
            pstmt.setInt(7, quantity_disposed);
            
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int add_stock_checked() {
        try {
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
        
            PreparedStatement pstmt;
            
            for (int i=0;i < products_checked.size();i++)
            {
                pstmt = conn.prepareStatement("INSERT INTO stockforchecking (productID, warehouseID, inventoryCheckID) VALUES (?,?,?)");
                pstmt.setInt(1, products_checked.get(i));
                pstmt.setInt(2, checking_warehouse_ID); 
                pstmt.setInt(3, inventory_check_ID); 
                pstmt.executeUpdate();
                pstmt.close();
                
            }
            conn.close();
            return 1;

        } catch (SQLException e) {
            return 0;
        }         
    }

    public int update_inventory_physical_checking() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Update the warehouse.
            PreparedStatement pstmt = conn.prepareStatement("UPDATE inventoryPhysicalChecking "
            + "SET warehouseID=?, productLineID=?, dateChecked=?, employeeInChargeID=?, quantityChecked=?, quantityDisposed=? "
            + "WHERE inventoryCheckID=?"); //Place UPDATE statement.
            pstmt.setInt(1, checking_warehouse_ID);
            pstmt.setInt(2, product_line_ID);
            convert_date_checked(); //To convert a data checked string to Date.
            pstmt.setDate(3, new java.sql.Date(date_checked.getTime()));
            pstmt.setInt(4, employee_in_charge_ID);
            pstmt.setInt(5, quantity_checked);
            pstmt.setInt(6, quantity_disposed);
            pstmt.setInt(7, inventory_check_ID);
            


            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int update_stocktransfer() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            StringBuilder sql = new StringBuilder("UPDATE product SET status=? WHERE productID IN (");
            
            for (int i = 0; i < products_disposed.size(); i++) {
            sql.append("?");
                if (i < products_disposed.size() - 1) 
                {
                    sql.append(",");
                }
            }
            sql.append(")");
            
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            
            pstmt.setString(1, "disposed");

            for (int i = 0; i < products_disposed.size(); i++) 
            {
                pstmt.setInt(i+2,products_disposed.get(i));
            } 
            

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {

            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int delete_inventory_physical_checking() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Delete the warehouse.
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM inventoryPhysicalChecking WHERE inventoryCheckID=?"); //Place DELETE statement.
            pstmt.setInt(1, inventory_check_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int get_inventory_physical_checkings() { //Generalized function. For viewing products, stock_transfers, transfers to update or delete, etc.
        //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //Clear field arraylists.
            inventory_checkIDList.clear();
            checking_warehouse_IDList.clear();
            checking_product_lineIDlist.clear();
            date_checkedList.clear();
            employeeInCharge_IDList.clear();
            quantity_checkedList.clear();
            quantity_disposedList.clear();

            //2. Get warehouses from the database and put them in arraylists.
            PreparedStatement pstmt = conn.prepareStatement("SELECT inventoryCheckID, warehouseID, productLineID, dateChecked, employeeInChargeID, quantityChecked, quantityDisposed FROM inventoryPhysicalChecking"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                inventory_check_ID = rst.getInt("inventoryCheckID");
                checking_warehouse_ID = rst.getInt("warehouseID");
                product_line_ID = rst.getInt("productLineID");
                date_checked = rst.getDate("dateChecked");
                employee_in_charge_ID = rst.getInt("employeeInChargeID");
                quantity_checked = rst.getInt("quantityChecked");
                quantity_disposed = rst.getInt("quantityDisposed");
                

                inventory_checkIDList.add(inventory_check_ID);
                checking_warehouse_IDList.add(checking_warehouse_ID);
                checking_product_lineIDlist.add(product_line_ID);
                date_checkedList.add(date_checked);
                employeeInCharge_IDList.add(employee_in_charge_ID);
                quantity_checkedList.add(quantity_checked);
                quantity_disposedList.add(quantity_disposed);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int get_inventory_physical_checking_IDs() { //Generalized function. For viewing products, stock_transfers, transfers to update or delete, etc.
        //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //Clear field arraylists.
            inventory_checkIDList.clear();

            //Arraylists for other fields are cleared in case.
            checking_warehouse_IDList.clear();
            checking_product_lineIDlist.clear();
            date_checkedList.clear();
            employeeInCharge_IDList.clear();
            quantity_checkedList.clear();
            quantity_disposedList.clear();

            //2. Get warehouse_IDs from the database and put them in an arraylist.
            PreparedStatement pstmt = conn.prepareStatement("SELECT inventoryCheckID FROM inventoryPhysicalChecking"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                inventory_check_ID = rst.getInt("inventoryCheckID");
                inventory_checkIDList.add(inventory_check_ID);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int get_inventory_physical_checking_record() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Get warehouse record from the database.
            PreparedStatement pstmt = conn.prepareStatement("SELECT warehouseID, productLineID, dateChecked, employeeInChargeID, quantityChecked, quantityDisposed FROM inventoryPhysicalChecking WHERE inventoryCheckID=?"); //Place the SQL statement.
            pstmt.setInt(1, inventory_check_ID);

            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                checking_warehouse_ID = rst.getInt("warehouseID");
                product_line_ID = rst.getInt("productLineID");
                date_checked = rst.getDate("dateChecked");
                employee_in_charge_ID = rst.getInt("employeeInChargeID");
                quantity_checked = rst.getInt("quantityChecked");
                quantity_disposed = rst.getInt("quantityDisposed");
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            err = e;
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    //Testing
    public static void main(String args[]) {
        inventory_physical_checking A =  new inventory_physical_checking();      
        
        A.checking_warehouse_ID = 3001;
        
        A.get_workers_for_warehouse();
        
        System.out.println(A.employeeInCharge_IDList);
    }
}