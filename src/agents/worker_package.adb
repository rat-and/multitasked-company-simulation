package body Worker_Package is
   
   -------------------------------------
   --Worekr as a protected object type--
   -------------------------------------   

   --protected body Worker is      
 
      --procedure Set_Tasklist_Access (My_Tasklist_Accesss : in Tasklist_Access) is
      --begin
         --Put( "Task list has been set to a Worker" );
         --New_Line;
         --My_Tasklist_Access := My_Tasklist_Accesss;
      --end Set_Tasklist_Access;   
                 
      --entry Execute_Job when My_Tasklist_Access.isntBusy is         
      --begin         
         --My_Tasklist_Access.Decrement_Jobs;
         --Put( "Job has been Executed" );
         --New_Line;         
      --end Execute_Job;
  
      --procedure Run is
      --begin         
         --loop
            --Execute_Job;
            --delay 2.0;
         --end loop;
      --end Run;  
            
   --end Worker;
   
   
   --------------------------------------
   --Worker as a task type--------------
   --------------------------------------
   
   task body Worker is
      Worker_TaskLsit_Acceess : Tasklist_Access;
      Worker_Warehouse_Access : Warehouse_Access;
      Initialized             : Boolean := False;
      My_Job                  : Job_Type;
      Id                      : Integer;
   begin    
        
      
      loop
         
         select
             accept Initialize (My_Tasklist_Accesss : in Tasklist_Access; My_Warehouse_Access : in Warehouse_Access; My_Id : in Integer) do         
               Worker_TaskLsit_Acceess := My_Tasklist_Accesss;               
               Worker_Warehouse_Access := My_Warehouse_Access;               
               Id := My_Id;               
               Initialized := True;               
            end Initialize; 
            
         or
              
            accept Freeze do
               Initialized := False;
               Display_Action ( "WORKER" & Integer'Image(Id) & "   -> FREEZED ");
            end Freeze;
            
         or
              
            accept Go do
               Initialized := True;
               Display_Action ( "WORKER" & Integer'Image(Id) & "   -> GO "); 
         end Go;        
                    
                      
         else
                     
            if Initialized and then Worker_TaskLsit_Acceess.Jobs_Num > 0              
              and then Worker_Warehouse_Access.Product_Num <= WAREHOUSE_SIZE then
               
               Worker_TaskLsit_Acceess.Take_Job (My_Job);               
               Worker_TaskLsit_Acceess.Decrement_Jobs;                
               Worker_Warehouse_Access.Add_Product ( Execute_Job (My_Job));
               Worker_Warehouse_Access.Increment_Products;
               
               Display_Action ( "WORKER" & Integer'Image(Id) & "   -> New job has been executed: " 
                    & Integer'Image(My_Job.First) & Operation_To_String (My_Job.Operation) &
                      Integer'Image( My_Job.Second) );                
               Display_Action( "WORKER" & Integer'Image(Id) & "   -> Current jobs amount: " &
                      Natural'Image (Worker_TaskLsit_Acceess.Jobs_Num) );              
               delay WORKER_DELAY;
               
            else               
               null;               
            end if;  
            
         end select;
         
      end loop;
      
   end Worker;
   
   function Execute_Job (J : Job_Type) return Integer is
   begin       
      case J.Operation is
         when ADD =>
            return J.First + J.Second;
         when SUBTRACT =>
            return J.First - J.Second;
         when others =>
            return J.First * J.Second;
      end case;                   
   end Execute_Job;     
   
   

end Worker_Package;
