package productMgmt;

import java.util.*;
import java.sql.*;

//Enums
enum condEnum { //condEnum = condition enum
    BAD,
    GOOD,
    DISPOSED;
}

enum measureEnum {
    EACH,
    GROUP;
}

enum statusEnum {
    STORED,
    DISPOSED;
}

public class Products {
    
    //Fields
    public int          productID;
    public int          warehouseID;
    public Date         dateReceived;
    public int          productLineID;
    public condEnum     productCond; //productCond = product condition
    public String       reason;
    public double       stockPrice;
    public int          supplierID;
    public int          binID;
    public measureEnum  unitMeasure;
    public boolean      isReceivedFromWarehouse;
    public statusEnum   status;

    //ArrayLists
    public ArrayList<int>           productIDList = new ArrayList<>();
    public ArrayList<int>           warehouseIDList = new ArrayList<>();
    public ArrayList<Date>          dateReceivedList = new ArrayList<>();
    public ArrayList<int>           productLineIDList = new ArrayList<>();
    public ArrayList<condEnum>      productCondList = new ArrayList<>();
    public ArrayList<String>        reasonList = new ArrayList<>();
    public ArrayList<double>        stockPriceList = new ArrayList<>();
    public ArrayList<int>           supplierIDList = new ArrayList<>();
    public ArrayList<int>           binIDList = new ArrayList<>();
    public ArrayList<measureEnum>   unitMeasureList = new ArrayList<>();
    public ArrayList<boolean>       receptionList = new ArrayList<>(); //Arraylist of isReceivedFromWarehouse
    public ArrayList<statusEnum>    status = new ArrayList<>();

    //Constructor
    public Products() {}

    public int registerProduct() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. To get the next productID.
            //2.1 Get the next productID.
            PreparedStatement pstmt = conn.prepareStatement("") //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                productID = rst.getInt("newID");
            }

            //2.2 Save the new product
            pstmt = conn.prepareStatement("") //Place INSERT INTO statement.
            pstmt.setInt(1, productID);
            pstmt.setInt(2, warehouseID);
            pstmt.setDate(3, dateReceived);
            pstmt.setInt(4, productLineID);
            pstmt.setString(5, productCond); //enum
            pstmt.setString(6, reason);
            pstmt.setDouble(7, stockPrice);
            pstmt.setInt(8, supplierID);
            pstmt.setInt(9, binID)
            pstmt.setString(10, unitMeasure); //enum
            pstmt.setBoolean(11, isReceivedFromWarehouse); //boolean
            pstmt.setString(12, status); //enum

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int updateProduct() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. Update the product.
            PreparedStatement pstmt = conn.prepareStatement("") //Place UPDATE statement.
            pstmt.setInt(1, productID);
            pstmt.setInt(2, warehouseID);
            pstmt.setDate(3, dateReceived);
            pstmt.setInt(4, productLineID);
            pstmt.setString(5, productCond); //enum
            pstmt.setString(6, reason);
            pstmt.setDouble(7, stockPrice);
            pstmt.setInt(8, supplierID);
            pstmt.setInt(9, binID);
            pstmt.setString(10, unitMeasure); //enum
            pstmt.setBoolean(11, isReceivedFromWarehouse); //boolean
            pstmt.setString(12, status); //enum

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int deleteProduct() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. Delete the product.
            PreparedStatement pstmt = conn.prepareStatement("") //Place DELETE statement.
            pstmt.setInt(1, productID);
            pstmt.setInt(2, warehouseID);
            pstmt.setDate(3, dateReceived);
            pstmt.setInt(4, productLineID);
            pstmt.setString(5, productCond); //enum
            pstmt.setString(6, reason);
            pstmt.setDouble(7, stockPrice);
            pstmt.setInt(8, supplierID);
            pstmt.setInt(9, binID);
            pstmt.setString(10, unitMeasure); //enum
            pstmt.setBoolean(11, isReceivedFromWarehouse); //boolean
            pstmt.setString(12, status); //enum

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int getProducts() { //Generalized function. For viewing products, stock_transfers, transfers to update or delete, etc.
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //Clear field arraylists.
            productIDList.clear();
            warehouseIDList.clear();
            dateReceivedList.clear();
            productLineIDList.clear();
            productCondList.clear();
            reasonList.clear();
            stockPriceList.clear();
            supplierIDList.clear();
            unitMeasureList.clear();
            receptionList.clear();
            status.clear();

            //2. Get products from the database and put them in arraylists.
            PreparedStatement pstmt = conn.prepareStatement("") //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                productID = rst.getInt("productID");
                warehouseID = rst.getInt("warehouseID");
                dateReceived = rst.getDate("dateReceived");
                productLineID = rst.getInt("productLineID");
                productCond = rst.getString("productCondition"); //enum
                reason = rst.getString("reason");
                stockPrice = rst.getDouble("stockPrice");
                supplierID = rst.getInt("supplierID");
                binID = rst.getInt("binID");
                unitMeasure = rst.getString("unitMeasure"); //enum
                isReceivedFromWarehouse = rst.getBoolean("isReceivedFromWarehouse"); //boolean
                status = rst.getString("status");   //enum

                productIDList.add(productID);
                warehouseIDList.add(warehouseID);
                dateReceivedList.add(dateReceived);
                productLineIDList.add(productLineID);
                productCondList.add(productCond);
                reasonList.add(reason);
                stockPriceList.add(stockPrice);
                supplierIDList.add(supplierID);
                binIDList.add(binID);
                unitMeasureList.add(unitMeasure);
                receptionList.add(isReceivedFromWarehouse);
                status.add(status);
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
    public static void main() {

    }
}
