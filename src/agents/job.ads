package Job is
   
   type Operator is new Integer;  
   ADD      : CONSTANT Operator := 1;
   SUBTRACT : CONSTANT Operator := 2;
   MULTIPLY : CONSTANT Operator := 3;
    
   type Job_Type is record
      First, Second : Integer;
      Operation : Operator;
   end record;
   
   type Job_Type_Access is access all Job_Type;
   --procedure Free_Job is new Ada.Unchecked_Deallocation (Job_Type, Job_Type_Access);
   
   function To_String (Job_Access : Job_Type_Access) return String;
   
   function Operation_To_String (Operation : Operator) return String;
      
end Job;
