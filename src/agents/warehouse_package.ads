with Fifo;
with Simulation_Config; use Simulation_Config;

package Warehouse_Package is
   package Product_Fifo is new Fifo(Integer); use Product_Fifo;
   
   protected type Warehouse is     
      procedure Add_Product (I : in Integer);
      procedure Take_Product (I : out Integer);
      procedure Increment_Products;
      procedure Decrement_Products;
      procedure Release;    
      procedure Block;
      function isntBusy return Boolean;  
      function Product_Num return Natural;
      
   private
      Busy            : Boolean := False;
      Products        : Fifo_Type;
      Products_Amount : Natural range 0 .. 255 := 0;
      Max_Amount      : Positive := WAREHOUSE_SIZE;
   end Warehouse; 
   
   type Warehouse_Access is access all Warehouse;

end Warehouse_Package;
