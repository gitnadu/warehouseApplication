package productMgmt;

import java.util.*;

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

public class Product {
    
    //Fields
    public int          productID;
    public int          warehouseID;
    public Date         dateReceived;
    public int          productLineID;
    public condEnum     productCond; //productCond = product condition
    public String       reason;
    public double       stockPrice;
    public int          supplierID;
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
    public ArrayList<measureEnum>   unitMeasureList = new ArrayList<>();
    public ArrayList<boolean>       receptionList = new ArrayList<>(); //Arraylist of isReceivedFromWarehouse
    public ArrayList<statusEnum>    status = new ArrayList<>();

    //Constructor
    public Products() {}

    //Testing
    public static void main() {

    }
}