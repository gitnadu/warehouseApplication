package supplierMgmt;

public class Suppliers {
    public int supplierID;
    public String supplierContactNumber;
    public String officeAddress;
    public String officePhoneNumber;

    //Constructor
    public Suppliers() {}

    public int registerSupplier() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. To get the next supplierID.
            //2.1 Get the next supplierID.
            PreparedStatement pstmt = conn.prepareStatement("") //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                productID = rst.getInt("newID");
            }

            //2.2 Save the new supplier
            pstmt = conn.prepareStatement("") //Place INSERT INTO statement.
            pstmt.setInt(1, supplierID);
            pstmt.setString(2, supplierContactNumber);
            pstmt.setString(3, officeAddress);
            pstmt.setString(4, officePhoneNumber);

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