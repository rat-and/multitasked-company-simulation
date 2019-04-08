with Messege; use Messege;
with Warehouse_Package; use Warehouse_Package;
with Simulation_Config; use Simulation_Config;

package Customer_Package is

   task type Customer is     
      entry Initialize (My_Warehouse_Access : in Warehouse_Access; My_Id : in Integer); 
      entry Freeze;
      entry Go;      
   end Customer; 

end Customer_Package;
