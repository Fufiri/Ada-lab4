with Ada.Text_Io; use Ada.Text_Io;
with Date_Handling; use Date_Handling;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;

procedure Datum_F is
   
   Date: Date_Type;
   Date2: Date_Type;
   Sum: Integer := 0;
   
begin
   
   Put("Mata in dagens datum: ");
   Get(Date);
   Put("Mata in ett annat Datum: ");
   Get(Date2);
        
  if Date < Date2 then 
   while Date < Date2 loop
      Date := Next_Date(Date);
      Sum := Sum+1;
     exit when Date = Date2;
   end loop;
   
   New_Line;
   Put("Det andra datumet är ");
   Put(Sum, Width =>0);
   Put(" efter det första");
  end if;
  
  if Date > Date2 then
    while Date > Date2 loop
      Date := Previous_Date(Date);
      Sum := Sum+1;
     exit when Date = Date2;
     end loop;
     
     New_Line;
     Put("Det andra datumet är ");
     Put(Sum, Width => 0);
     Put(" dagar innan det första");
   end if;   
	
	
end Datum_F;
