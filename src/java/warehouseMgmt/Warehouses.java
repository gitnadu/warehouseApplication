package warehouseMgmt;

public class Warehouses {
    public int warehouseID;
    public String city;
    public String phoneNumber;
    public String firstAddress;
    public String state;
    public String country;
    public String postalCode;
    public boolean isFunctional;
    public int maxRow;
    public int maxBay;
    public int maxLevel;
    public int maxBinNumber;

    //Constructor
    public Warehouses() {}

    public int registerWarehouse() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. To get the next warehouseID.
            //2.1 Get the next warehosueID.
            PreparedStatement pstmt = conn.prepareStatement("") //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                productID = rst.getInt("newID");
            }

            //2.2 Save the new warehouse.
            pstmt = conn.prepareStatement("") //Place INSERT INTO statement.
            pstmt.setInt(1, warehouseID);
            pstmt.setString(2, city);
            pstmt.setString(3, phoneNumber);
            pstmt.setString(4, firstAddress);
            pstmt.setString(5, state);
            pstmt.setString(6, country);
            pstmt.setString(7, postalCode);
            pstmt.setBoolean(8, isFunctional);
            pstmt.setInt(9, maxRow);
            pstmt.setInt(10, maxBay);
            pstmt.setInt(11, maxLevel);
            pstmt.setInt(12, maxBinNumber);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    //Testing
    public static void main() {



    }
}