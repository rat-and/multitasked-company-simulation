with Job; use Job;
with Tasklist_Package; use Tasklist_Package;
with RandGen; use RandGen;
with Simulation_Config; use Simulation_Config;
with Messege; use Messege;

package Menager_Package is
   
   
   --------------------------------------
   --Menager as a task type--------------
   --------------------------------------
      
   task type Menager is     
      entry Initialize (My_Tasklist_Accesss : in Tasklist_Access; My_Id : in Integer);
      entry Freeze;
      entry Go;      
   end Menager; 
   
   function Generate_Random_Job return Job_Type; 
        
   
    --------------------------------------
    --Menager as a protected object type--
    --------------------------------------
    
   
   --protected type Menager is
      --entry  Generate_Random_Job; --(My_Tasklist_Accesss : in out Tasklist_Access);
      --procedure Set_Tasklist_Access (My_Tasklist_Accesss : in Tasklist_Access);
      --procedure Run;
      
   --private    
      --My_Tasklist_Access : Tasklist_Access; 
      --My_Menager_Task    : Menager_Task;
   --end Menager; 
      
   
           
   
      
end Menager_Package;
