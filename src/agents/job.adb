package body Job is   
   
   function To_String (Job_Access : Job_Type_Access) return String is
      Operation : String := Operation_To_String(Job_Access.Operation);
   begin
      return Integer'Image(Job_Access.First) & " " & Operation & Integer'Image(Job_Access.Second);
   end To_String;
   
   
   function Operation_To_String (Operation : Operator) return String is
   begin 
      case Operation is
         when ADD =>
            return " + ";
         when SUBTRACT =>
            return " - ";
         when others =>
            return " * ";
      end case;
   end Operation_To_String;
      
end Job;
