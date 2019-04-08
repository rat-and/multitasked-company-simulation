package body Customer_Package is

   task body Customer is 
      Id                        : Integer;
      Customer_Warehouse_Access : Warehouse_Access;
      Initialized               : Boolean := False;
      Product                   : Integer;
   
   begin       
      
      loop
         select 
            accept Initialize (My_Warehouse_Access : in Warehouse_Access; My_Id : in Integer) do
               Customer_Warehouse_Access := My_Warehouse_Access;               
               Id := My_Id;               
               Initialized := True;                
            end Initialize;
            
         or
            accept Freeze do
               Initialized := False;
               Display_Action ( "CUSTOMER" & Integer'Image(Id) & " -> FREEZED" );               
            end Freeze;
            
         or
            accept Go do
               Initialized := True;
               Display_Action ("CUSTOMER" & Integer'Image(Id) & " -> GO" );               
            end Go;
                                 
            
         else        
            
            if Initialized and then Customer_Warehouse_Access.Product_Num > 0 then                
               Customer_Warehouse_Access.Take_Product (Product);               
               Customer_Warehouse_Access.Decrement_Products;               
               Display_Action ( "CUSTOMER" & Integer'Image(Id) & " -> Product: " & Integer'Image(Product)
                    & " has been sold" ); 
               Display_Action ( "CUSTOMER" & Integer'Image(Id) & " -> Current products amount: " 
                    & Natural'Image (Customer_Warehouse_Access.Product_Num) );              
               delay CUSTOMER_DELAY;               
            else               
               null;               
            end if;
         end select;        
      end loop;      
   end Customer;   
      
end Customer_Package;
