with Messege; use Messege;
with Job; use Job;
with Warehouse_Package; use Warehouse_Package;
with Tasklist_Package; use Tasklist_Package;
with Simulation_Config; use Simulation_Config;

package Worker_Package is
   
   --------------------------------------
   --Worekr as a protected object type--
   --------------------------------------
   
   
   --protected type Worker is
      --procedure Set_Tasklist_Access (My_Tasklist_Accesss : in Tasklist_Access);
      --entry Execute_Job;
      --procedure Run;
      
   --private 
      --My_Tasklist_Access : Tasklist_Access; 
   --end Worker;  
      
   
   
   --------------------------------------
   --Worker as a task type--------------
   --------------------------------------
   
   
   task type Worker is      
      entry Initialize (My_Tasklist_Accesss : in Tasklist_Access; My_Warehouse_Access : in Warehouse_Access; My_Id : in Integer);     
      entry Freeze;
      entry Go;       
     
   end Worker;
   
   function Execute_Job (J : Job_Type) return Integer;

end Worker_Package;
