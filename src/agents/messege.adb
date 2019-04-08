package body Messege is

   procedure Display_Action (Msg : in String) is
   begin
      if Simulation_Config.MODE = TALKATIVE then
         Put( Msg );
         New_Line;
      else
         null;
      end if;     
         
   end Display_Action;   

end Messege;
