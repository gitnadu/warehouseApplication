package supplierMgmt;

public class Suppliers {
    //Fields
    public int supplierID;
    public String supplierName;
    public String supplierContactNumber;
    public String officeAddress;
    public String officePhoneNumber;

    //Arraylists
    public ArrayList<int>           supplierIDList = new ArrayList<>();
    public ArrayList<String>        supplierNameList = new ArrayList<>();
    public ArrayList<String>        contactNumList = new ArrayList<>(); //supplierContactNumberList
    public ArrayList<String>        officeAddressList = new ArrayList<>();
    public ArrayList<String>        officeTelList = new ArrayList<>();  //officeTelList

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
            pstmt.setString(2, supplierName)
            pstmt.setString(3, supplierContactNumber);
            pstmt.setString(4, officeAddress);
            pstmt.setString(5, officePhoneNumber);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    int updateSupplier() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. Update the supplier.
            PreparedStatement pstmt = conn.prepareStatement("") //Place UPDATE statement.
            pstmt.setInt(1, supplierID);
            pstmt.setString(2, supplierName);
            pstmt.setString(3, supplierContactNumber);
            pstmt.setString(4, officeAddress);
            pstmt.setString(5, officePhoneNumber);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int deleteSupplier() {
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //2. Delete the supplier.
            PreparedStatement pstmt = conn.prepareStatement("") //Place DELETE statement.
            pstmt.setInt(1, supplierID);
            pstmt.setInt(2, supplierName);
            pstmt.setDate(3, supplierContactNumber);
            pstmt.setInt(4, officeAddress);
            pstmt.setString(5, officePhoneNumber);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public int getSuppliers() { //Generalized function. For viewing suppliers, suppliers to update or delete, etc.
        try {
            //1. Connect to database.
            Connection conn;
            conn = DriverManager.getConnection("") //Place the path.
            System.out.println("Connection Successful")

            //Clear field arraylists.
            supplierIDList.clear();
            supplierNameList.clear();
            contactNumList.clear();
            officeAddressList.clear();
            officeTelList.clear();
            
            //2. Get suppliers from the database and put them in arraylists.
            PreparedStatement pstmt = conn.prepareStatement("") //Place the SQL statement.
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                supplierID = rst.getInt("supplierID");
                supplierName = rst.getInt("supplierName");
                supplierContactNumber = rst.getDate("supplierContactNumber");
                officeAddress = rst.getInt("officeAddress");
                officePhoneNumber = rst.getString("officePhoneNumber");

                supplierIDList.add(supplierID);
                supplierNameList.add(supplierID);
                contactNumList.add(supplierContactNumber);
                officeAddressList.add(officeAddress);
                officeTelList.add(officePhoneNumber);
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