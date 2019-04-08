package body Menager_Package is


    --------------------------------------
    --Menager as a task type--------------
    --------------------------------------

   task body Menager is
      Menager_TaskLsit_Acceess : Tasklist_Access;
      Initialized              : Boolean := False;
      Id                       : Integer;
   begin


      loop
         select
            accept Initialize (My_Tasklist_Accesss : in Tasklist_Access; My_Id : in Integer) do
               Menager_TaskLsit_Acceess := My_Tasklist_Accesss;
               Id := My_Id;
               Initialized := True;
               Display_Action ("CEO" & Integer'Image(Id) & "      -> INITIALIZED");
            end Initialize;

         or
            accept Freeze do
               Initialized := False;
               Display_Action ("CEO" & Integer'Image(Id) & "      -> FREEZED");
            end Freeze;

         or
            accept Go do
               Initialized := True;
               Display_Action ( "CEO" & Integer'Image(Id) & "      -> GO" );
            end Go;

         else

            if Initialized and then Menager_TaskLsit_Acceess.Jobs_Num < TASKLIST_SIZE then
               Menager_TaskLsit_Acceess.Add_Job( Generate_Random_Job );
               Menager_TaskLsit_Acceess.Increment_Jobs;
               Display_Action ( "CEO" & Integer'Image(Id) & "      -> New job has been generated");
               delay CEO_DELAY;
            else
               null;
            end if;

         end select;

      end loop;

   end Menager;

   function Generate_Random_Job return Job_Type is
      J : Job_Type;
   begin
      J.First     := generate_random_number(100) + 1;
      J.Second    := generate_random_number(100) + 1;
      J.Operation := Operator (generate_random_number(3) + 1);
      return J;
   end Generate_Random_Job;





    --------------------------------------
    --Menager as a protected object type--
    --------------------------------------

  -- protected body Menager is

      --procedure Set_Tasklist_Access (My_Tasklist_Accesss : in Tasklist_Access) is
      --begin
         --Put( "Task list has been set" );  New_Line;
         --My_Tasklist_Access := My_Tasklist_Accesss;
      --end Set_Tasklist_Access;

      --entry Generate_Random_Job when My_Tasklist_Access.isntBusy is --(My_Tasklist_Accesss : in out Tasklist_Access) is
      --begin
         --My_Tasklist_Access.Increment_Jobs;
         --Put( "New job has been generated" ); New_Line;
      --end Generate_Random_Job;

      --procedure Run is
      --begin
         --loop
            --My_Menager_Task.Generate_Random_Job (My_Tasklist_Access);
            --delay 1.0;
         --end loop;
      --end Run;

   --end Menager;



end Menager_Package;
