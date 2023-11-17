package supplierMgmt;

import java.util.*;
import java.sql.*;

public class supplier {
    //Fields
    public int supplier_ID;
    public String supplier_name;
    public String supplier_contact_number;
    public String office_address;
    public String office_phone_number;

    //Arraylists
    public ArrayList<Integer>   supplier_ID_list = new ArrayList<>();
    public ArrayList<String>    supplier_name_list = new ArrayList<>();
    public ArrayList<String>    contact_num_list = new ArrayList<>(); //supplier_contact_numberList
    public ArrayList<String>    office_address_list = new ArrayList<>();
    public ArrayList<String>    office_tel_list = new ArrayList<>();  //office_tel_list
    
    public Exception err;

    //Constructor
    public supplier() {}

    public int register_supplier() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. To get the next supplier_ID.
            //2.1 Get the next supplier_ID.
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(supplierID) + 1 AS newID FROM supplier"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                supplier_ID = rst.getInt("newID");
            }

            //2.2 Save the new supplier
            pstmt = conn.prepareStatement("INSERT INTO supplier (supplierID, supplierName, supplierContactNumber, officeAddress, officePhoneNumber) VALUES (?,?,?,?,?)"); //Place INSERT INTO statement.
            pstmt.setInt(1, supplier_ID);
            pstmt.setString(2, supplier_name);
            pstmt.setString(3, supplier_contact_number);
            pstmt.setString(4, office_address);
            pstmt.setString(5, office_phone_number);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
            
            return 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int update_supplier() { //It works.
        try {
            //1. Connect to database.
            Connection conn;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?zeroDateTimeBehavior=CONVERT_TO_NULL&user=root&password=12345678"); //Place the path.
            System.out.println("Connection Successful");

            //2. Update the supplier.
            PreparedStatement pstmt = conn.prepareStatement("UPDATE supplier SET supplierName=?, supplierContactNumber=?, officeAddress=?, officePhoneNumber=? WHERE supplierID=?"); //Place UPDATE statement.
            pstmt.setString(1, supplier_name);
            pstmt.setString(2, supplier_contact_number);
            pstmt.setString(3, office_address);
            pstmt.setString(4, office_phone_number);
            pstmt.setInt(5, supplier_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int delete_supplier() {
        try {
            //1. Connect to database.
            Connection conn;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?zeroDateTimeBehavior=CONVERT_TO_NULL&user=root&password=12345678"); //Place the path.
            System.out.println("Connection Successful");

            //2. Delete the supplier.
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM supplier WHERE supplierID=?"); //Place DELETE statement.
            pstmt.setInt(1, supplier_ID);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int get_suppliers() { //Generalized function. For viewing suppliers, suppliers to update or delete, etc.
        //It works.
        try {
            //1. Connect to database.
            Connection conn;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?zeroDateTimeBehavior=CONVERT_TO_NULL&user=root&password=12345678"); //Place the path.
            System.out.println("Connection Successful");

            //Clear field arraylists.
            supplier_ID_list.clear();
            supplier_name_list.clear();
            contact_num_list.clear();
            office_address_list.clear();
            office_tel_list.clear();
            
            //2. Get suppliers from the database and put them in arraylists.
            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierID, supplierName, supplierContactNumber, officeAddress, officePhoneNumber FROM supplier"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                supplier_ID = rst.getInt("supplierID");
                supplier_name = rst.getString("supplierName");
                supplier_contact_number = rst.getString("supplierContactNumber");
                office_address = rst.getString("officeAddress");
                office_phone_number = rst.getString("officePhoneNumber");

                supplier_ID_list.add(supplier_ID);
                supplier_name_list.add(supplier_name);
                contact_num_list.add(supplier_contact_number);
                office_address_list.add(office_address);
                office_tel_list.add(office_phone_number);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int get_supplier_IDs() { //Generalized function. For viewing products, stock_transfers, transfers to update or delete, etc.
        try {
            //1. Connect to database.
            Connection conn;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?zeroDateTimeBehavior=CONVERT_TO_NULL&user=root&password=12345678"); //Place the path.
            System.out.println("Connection Successful");

            //Clear field arraylists.
            supplier_ID_list.clear();

            //Arraylists for other fields are cleared in case.
            supplier_name_list.clear();
            contact_num_list.clear();
            office_address_list.clear();
            office_tel_list.clear();

            //2. Get supplier_IDs from the database and put them in an arraylist.
            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierID FROM supplier"); //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                supplier_ID = rst.getInt("supplierID");
                supplier_ID_list.add(supplier_ID);
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int get_supplier_record() { //It works.
        try {
            //1. Connect to database.
            Connection conn;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?zeroDateTimeBehavior=CONVERT_TO_NULL&user=root&password=12345678"); //Place the path.
            System.out.println("Connection Successful");

            //2. Get warehouse record from the database.
            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierID, supplierName, supplierContactNumber, officeAddress, officePhoneNumber FROM supplier WHERE supplierID=?"); //Place the SQL statement.
            pstmt.setInt(1, supplier_ID);

            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                supplier_name = rst.getString("supplierName");
                supplier_contact_number = rst.getString("supplierContactNumber");
                office_address = rst.getString("officeAddress");
                office_phone_number = rst.getString("officePhoneNumber");
            }

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    //Testing
}