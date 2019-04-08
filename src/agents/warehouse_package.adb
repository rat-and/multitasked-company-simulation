package body Warehouse_Package is
   
   protected body Warehouse is
            
      function Product_Num return Natural is
      begin
         return Products_Amount;
      end Product_Num;
      
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
     
      procedure Add_Product (I : in Integer) is             
      begin
        Push(Products, I);       
      end Add_Product;
      
      procedure Take_Product (I : out Integer) is              
      begin
         Pop(Products, I);          
      end Take_Product;
      
      procedure Increment_Products is
      begin
         Block;
         Products_Amount := Products_Amount + 1; 
         Release;
      end Increment_Products;
      
      procedure Decrement_Products is
      begin
         if Busy = False then           
            Products_Amount := Products_Amount - 1;         
         else 
            null;
         end if;
      end Decrement_Products;     
  
   end Warehouse;
   

end Warehouse_Package;
