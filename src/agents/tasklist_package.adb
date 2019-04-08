package body Tasklist_Package is

   protected body Tasklist is
      
      function Jobs_Num return Natural is
      begin
         return Jobs_Amount;
      end Jobs_Num;
      
      function isntBusy return Boolean is
      begin
         return not Busy;
      end isntBusy;      
      
      procedure Release is
      begin 
         Busy := False;
      end Release;
      
      procedure Block is
      begin 
         Busy := True;
      end Block;            
     
         
      procedure Add_Job (J : in Job_Type) is         
      begin
        Push(Jobs, J);       
      end Add_Job;
      
      procedure Take_Job (J : out Job_Type) is
         --Jo : Job_Type;         
      begin
         Pop(Jobs, J);  
         --return J;
      end Take_Job;
      
      procedure Increment_Jobs is
      begin
         Block;
         Jobs_Amount := Jobs_Amount + 1; 
         Release;
      end Increment_Jobs;
      
      procedure Decrement_Jobs is
      begin
         if Busy = False then           
            Jobs_Amount := Jobs_Amount - 1;         
         else 
            null;
         end if;
      end Decrement_Jobs;     
  
   end Tasklist; 
end Tasklist_Package;
