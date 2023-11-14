
package invEmpMgmt; //invEmpMgmt = inventoryEmployeeManagement.
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
public class InventoryEmployee {
    
    // fields of inventory employee
    public String first_name;
    public String last_name;
    public String middle_name;
    public String perm_address;
    public String curr_address;
    
    public Date birthday = new Date();
    DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    
    public InventoryEmployee(){}
    
    public int register_employee(){
        
        try{
            String temp_birthday = "2003-12-03";
            birthday = df.parse(temp_birthday);
        }catch(Exception e){
            e.printStackTrace();
        }
            
        
        
    }
    public static void main( String argcs[])
    {
        
    }
}
