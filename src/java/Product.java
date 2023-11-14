package productManagement;

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
    public int productID; //public
    public int warehouseID;
    public Date dateReceived;
    public int productLineID;
    public condEnum productCond; //productCond = product condition
    public String reason;
    public double stockPrice;
    public int supplierID;
    public measureEnum unitMeasure; //enum
    public boolean isReceivedFromWarehouse;
    public statusEnum status; //enum 

    //Default constructor

    //Constructor
    public Product(int productID, int warehouseID, Date dateReceived, int productLineID,
                   condEnum productCond, String reason, double stockPrice, int supplierID,
                   measureEnum unitMeasure, boolean isReceivedFromWarehouse, statusEnum status) 
                   {
                        this.productID = productID;
                        this.warehouseID = warehouseID;
                        this.dateReceived = dateReceived;
                        this.productLineID = productLineID;
                        this.productCond = productCond;
                        this.reason = reason;
                        this.stockPrice = stockPrice;
                        this.supplierID = supplierID;
                        this.unitMeasure = unitMeasure;
                        this.isReceivedFromWarehouse = isReceivedFromWarehouse;
                        this.status = status;
    }
    
    //Testing
    public static void main() {

    }
}