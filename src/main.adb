with Ada.Text_IO; use Ada.Text_IO;
with Factory; use Factory;
with Supervisor_Package; use Supervisor_Package;
with Simulation_Config; use Simulation_Config;

procedure Main is
   Choice            : Natural range 1 .. 3 := 1;
   Warehouse_Sup     : Warehouse_Supervisor;
   Tasklist_Sup      : Tasklist_Supervisor;

begin

   Put( "Program started" ); New_Line;
   delay 2.0;

   Init_Simulation;

   if Simulation_Config.MODE = SILENT then

      Warehouse_Sup.Initialize (Store);
      Tasklist_Sup.Initialize (Jobs);


      while True loop

         New_Line;
         Put_Line ( "##MENU##" );
         Put_Line ( "[1] check tasklist" );
         Put_Line ( "[2] check warehouse" );
         --Put_Line ( "[3] end simulation" );
         Choice := Natural'Value(Get_Line);

         if Choice = 1 then
            Tasklist_Sup.Check_Tasklist;
         elsif Choice = 2 then
            Warehouse_Sup.Check_Warehouse;
         else
            null;
         end if;

      end loop;

   else
      null;
   end if;


end Main;
