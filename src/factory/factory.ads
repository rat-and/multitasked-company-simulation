with Tasklist_Package; use Tasklist_Package;
with Menager_Package; use Menager_Package;
with Worker_Package; use Worker_Package;
with Warehouse_Package; use Warehouse_Package;
with Customer_Package; use Customer_Package;
with Simulation_Config; use Simulation_Config;


package Factory is

   Jobs       : Tasklist_Access := new Tasklist;
   Store      : Warehouse_Access := new Warehouse;

   procedure Init_Simulation;

end Factory;
