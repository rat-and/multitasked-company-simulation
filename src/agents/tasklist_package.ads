with Fifo;
with Simulation_Config; use Simulation_Config;
with Job; use Job; 
   
   package Tasklist_Package is
      package Job_Fifo is new Fifo(Job_Type);
   use Job_Fifo;

   protected type Tasklist is     
      procedure Add_Job (J : in Job_Type);
      procedure Take_Job (J : out Job_Type);
      procedure Increment_Jobs;
      procedure Decrement_Jobs;
      procedure Release;    
      procedure Block;
      function isntBusy return Boolean;  
      function Jobs_Num return Natural;
      
   private
      Busy        : Boolean := False;
      Jobs        : Fifo_Type;
      Jobs_Amount : Natural range 0 .. 255 := 0;
      Max_Amount  : Positive := TASKLIST_SIZE;
   end Tasklist;          
   
   type Tasklist_Access is access all Tasklist;

end Tasklist_Package;
