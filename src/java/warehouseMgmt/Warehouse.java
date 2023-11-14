package warehouseMgmt;

public class Warehouse {
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
    public Warehouse(int warehouseID, String city, String phoneNumber, String firstAddress,
                     String state, String country, String postalCode, boolean isFunctional,
                     int maxRow, int maxBay, int maxLevel, int maxBinNumber) {
                        this.warehouseID = warehouseID;
                        this.city = city;
                        this.phoneNumber = phoneNumber;
                        this.firstAddress = firstAddress;
                        this.state = state;
                        this.country = country;
                        this.postalCode = postalCode;
                        this.isFunctional = isFunctional;
                        this.maxRow = maxRow;
                        this.maxBay = maxBay;    
                        this.maxLevel = maxLevel;
                        this.maxBinNumber = maxBinNumber;
                     }

    //Testing
    public static void main() {



    }
}