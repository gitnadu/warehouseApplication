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
    
    //Temporary fields
    public int supplier_ID_temporary;
    public String supplier_name_temporary;
    public String supplier_contact_number_temporary;
    public String office_address_temporary;
    public String office_phone_number_temporary;
    
    public int supplier_ID_holder;
    public String supplier_name_holder;
    //public String supplier_contact_number_holder;
    public String office_address_holder;
    //public String office_phone_number_holder;
    public int temp_container;
    public int supplier_search_count;

    //Arraylists
    public ArrayList<Integer>   supplier_ID_list = new ArrayList<>();
    public ArrayList<String>    supplier_name_list = new ArrayList<>();
    public ArrayList<String>    contact_num_list = new ArrayList<>(); //supplier_contact_numberList
    public ArrayList<String>    office_address_list = new ArrayList<>();
    public ArrayList<String>    office_tel_list = new ArrayList<>();  //office_tel_list
    
    public ArrayList<String>   temp_supplier_ID_list = new ArrayList<>();

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
           
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

            //2. Update the supplier.
            PreparedStatement pstmt = conn.prepareStatement("UPDATE supplier SET supplierName=?, supplierContactNumber=?, officeAddress=?, officePhoneNumber=? WHERE supplierID=?"); //Place UPDATE statement.
            pstmt.setString(1, supplier_name_temporary);
            pstmt.setString(2, supplier_contact_number_temporary);
            pstmt.setString(3, office_address_temporary);
            pstmt.setString(4, office_phone_number_temporary);
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");

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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");


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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");


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
    
    public void get_suppliers_delete(){
        
        try{
            supplier_ID_list.clear();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            PreparedStatement pstmt = conn.prepareStatement("SELECT s.supplierID FROM supplier s "
                    + "WHERE NOT EXISTS (SELECT productID FROM product p WHERE s.supplierID = p.supplierID)");
                    
            ResultSet rst= pstmt.executeQuery();
            
            int temp;
            while (rst.next()){
                temp = rst.getInt("employeeID");
                supplier_ID_list.add(temp);
            }
            
            // Closing Statements
            pstmt.close();
            conn.close();
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    }

    public int get_supplier_record() { //It works.
        try {
            //1. Connect to database.
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");


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
    
    public int search_employees(){
        
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwarehouse?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            
            temp_supplier_ID_list.clear();
            

            PreparedStatement pstmt = conn.prepareStatement("SELECT supplierID FROM supplier WHERE (CASE WHEN ? = 0 THEN supplierName LIKE CONCAT('%', ?, '%') ELSE supplierName != '' END)");

            if(supplier_name_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setString(2, null);
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, supplier_name_holder);
            }
                
            ResultSet rst = pstmt.executeQuery();

            containList(rst);
            
            // 2
            StringBuilder sql = new StringBuilder("SELECT supplierID FROM supplier WHERE (CASE WHEN ? = 0 THEN officeAddress LIKE CONCAT('%', ?, '%') ELSE officeAddress != '' END) AND supplierID IN (");
            
            addString(sql);
            
            pstmt = conn.prepareStatement(sql.toString());

            if(office_address_holder.equals(""))
            {
                pstmt.setInt(1, 1);
                pstmt.setNull(2, java.sql.Types.VARCHAR);   
            }
            else
            {
                pstmt.setInt(1, 0);
                pstmt.setString(2, office_address_holder);
            }
            
            set_idList(pstmt);
            
            temp_supplier_ID_list.clear();
         
            rst = pstmt.executeQuery();

            containList(rst);

            sql = new StringBuilder("SELECT supplierName,supplierContactNumber, officeAddress, officePhoneNumber " +
                "FROM supplier " +
                "WHERE supplierID IN (");
            
            addString(sql);
            
            sql.append("ORDER BY supplierName ASC");
           
            pstmt = conn.prepareStatement(sql.toString());
            
            for (int i = 0; i < temp_supplier_ID_list.size(); i++) 
                pstmt.setString(i+1,temp_supplier_ID_list.get(i));
                    
            
            rst= pstmt.executeQuery();
            
            supplier_search_count = 0;
            
            supplier_name_list.clear();
            contact_num_list.clear();
            office_address_list.clear();
            office_tel_list.clear();
            
            while (rst.next()) {
                supplier_name = rst.getString("supplierName");
                supplier_contact_number = rst.getString("supplierContactNumber");
                office_address = rst.getString("officeAddress");
                office_phone_number = rst.getString("officePhoneNumber");
                
                supplier_name_list.add(supplier_name);
                contact_num_list.add(supplier_contact_number);
                office_address_list.add(office_address);
                office_tel_list.add(office_phone_number);
                
                supplier_search_count++;
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
            temp_container = rst.getInt("supplierID");
            temp_supplier_ID_list.add(Integer.toString(temp_container));
        }

    }
    
    public void addString(StringBuilder sql)
    {
        for (int i = 0; i < temp_supplier_ID_list.size(); i++) {
        sql.append("?");
            if (i < temp_supplier_ID_list.size() - 1) 
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
            for (int i = 0; i < temp_supplier_ID_list.size(); i++) 
            {
                pstmt.setString(i+3,temp_supplier_ID_list.get(i));
            } 
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    //Testing
}