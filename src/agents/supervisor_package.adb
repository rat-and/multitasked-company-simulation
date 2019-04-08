package body Supervisor_Package is

   task body Tasklist_Supervisor is
      TaskLsit_Acceess1   : Tasklist_Access;
      Initialized         : Boolean := False;
      
   begin
      loop
         select
            
            accept Initialize (My_Tasklist_Accesss : in Tasklist_Access) do
               TaskLsit_Acceess1 := My_Tasklist_Accesss;
               Initialized := True;
            end Initialize;
            
         or
              
            accept Check_Tasklist  do
               if Initialized then
                  Put_Line ( "Number of ongoing jobs: " & Natural'Image( TaskLsit_Acceess1.Jobs_Num ));
               else
                  null;
               end if;
            end Check_Tasklist;
    
         end select;         
            
      end loop; 
 
   end Tasklist_Supervisor;
   
   task body Warehouse_Supervisor is
      Warehouse_Access1   : Warehouse_Access;
      Initialized         : Boolean := False;
      
   begin
      loop
         select
            
            accept Initialize (My_Warehouse_Access : in Warehouse_Access) do
               Warehouse_Access1 := My_Warehouse_Access;
               Initialized := True;
            end Initialize;
            
         or
              
            accept Check_Warehouse  do
               if Initialized then
                  Put_Line ( "Number of stored products: " & Natural'Image( Warehouse_Access1.Product_Num ));
               else
                  null;
               end if;
            end Check_Warehouse;
                
         end select;
         
      end loop; 
  
   end Warehouse_Supervisor;    

end Supervisor_Package;
