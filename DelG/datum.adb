with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Date_Handling; use Date_Handling;

procedure Datum is
   
   --Year_Error, Month_Error, Day_error: exception;
   Date: Date_Type;
 --  Date2: Date_Type;
   
begin
  loop 
     begin   
	Put("Ange ett Datum: ");
	Get(Date);
	exit;
	
     exception
	when Year_Error =>
	   Put_line("Året måste vara större än 0:");
	   Skip_Line;
	when Month_Error =>
	   Put_Line("Månaden måste vara mellan 1-12:");
	   Skip_Line;
	when Day_Error =>
	   Put_Line("Fel datum:");
	   Skip_Line;
	   
     end;
  end loop;
  
   
    
   Put("Ett datum: ");
   Put(Date);
   
   New_Line;
   Put("Nästa datum: ");
   Put(Next_Date(Date));
   
   New_Line;
   Put("Föregående datum: ");
   Put(Previous_Date(Date));
   
 
	 
   
end Datum;
