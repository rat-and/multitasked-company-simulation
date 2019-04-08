with Ada.Text_IO; use Ada.Text_IO;
with Tasklist_Package; use Tasklist_Package;
with Warehouse_Package; use Warehouse_Package;

package Supervisor_Package is

   task type Tasklist_Supervisor is
      pragma Priority(5);
      entry Initialize (My_Tasklist_Accesss : in Tasklist_Access);
      entry Check_Tasklist;    
   end Tasklist_Supervisor; 
   
   task type Warehouse_Supervisor is
      pragma Priority(5);
      entry Initialize (My_Warehouse_Access : in Warehouse_Access);
      entry Check_Warehouse;    
   end Warehouse_Supervisor;

end Supervisor_Package;
