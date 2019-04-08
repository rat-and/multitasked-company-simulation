package body Factory is

   procedure Init_Simulation is      
      CEO               : Menager;       
     
      Workers           : array (1 .. NUM_WORKERS) of Worker;
      Customers         : array (1 .. NUM_CUSTOMERS) of Customer;         
                    
   begin
      
      CEO.Initialize (Jobs, 1);
      
      for I in 1 .. NUM_WORKERS loop
         Workers(I).Initialize (Jobs, Store, I);         
      end loop;       
      
      for I in 1 .. NUM_CUSTOMERS loop
         Customers(I).Initialize (Store, i);        
      end loop;  
      
      end Init_Simulation;    
      
end Factory;
