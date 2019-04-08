with Ada.Real_Time; use Ada.Real_Time;

package Simulation_Config is

   CEO_DELAY          : CONSTANT Duration := 0.2;
   WORKER_DELAY       : CONSTANT Duration := 2.0;
   CUSTOMER_DELAY     : CONSTANT Duration := 4.0;
   
   TASKLIST_SIZE      : CONSTANT Positive := 40;
   WAREHOUSE_SIZE     : CONSTANT Positive := 50;
   
   NUM_WORKERS        : CONSTANT Natural := 9;
   NUM_CUSTOMERS      : CONSTANT Natural := 7;
   
   FAILURE_DELAY_TIME : CONSTANT Float := 2.0;
   
   TALKATIVE          : CONSTANT Integer := 0;
   SILENT             : CONSTANT Integer := 1;
   
   MODE               : CONSTANT Integer := TALKATIVE;        

end Simulation_Config;
