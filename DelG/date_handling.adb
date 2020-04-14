with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;

package body Date_Handling is

------------------------------------------------------
   procedure Get(Item: out Date_Type) is
      
      C: Character;
      
   begin
      
      Get(Item(1));
      
      if Item(1) < 0 then
	 raise Year_Error;
      end if;
     
      Get(C);
      Get(Item(2));
      
      if Item(2) <= 0 or Item(2) > 12 then
	 raise Month_Error;
      end if;
	
      Get(C);
      Get(Item(3));
      
      if (Item(2) = 1 or Item(2) = 3 or Item(2) = 5 or Item(2) = 7 or Item(2) = 8 or Item(2) = 10 or Item(2) = 12) and then (Item(3) > 31 or Item(3) <= 0) then
	 raise Day_Error;
      elsif Item(2) = 2 and (Item(3) > 28 or Item(3) <= 0) then
	 raise Day_Error;
      elsif (Item(2) = 4 or Item(2) = 6 or Item(2) = 9 or Item(2) = 11) and then (Item(3) > 30 or Item(3) <= 0)then
	 raise Day_Error;
      end if;      
      
   end Get;
   ------------------------------------------------------
   ------------------------------------------------------
   procedure Put(Item: in Date_Type) is
      
   begin
      
      Put(Item(1), Width =>0);
      Put("-");
      
      if (Item(2) < 9) then
	 Put("0");
      end if;

      Put(Item(2), Width =>0);
      Put("-");
      
      if (Item(3) < 9) then
	 Put("0");
      end if;
     
      Put(Item(3), Width =>0);
      
   end Put;
   ------------------------------------------------------
   ------------------------------------------------------
   function Next_Date(Item : in Date_Type) return Date_Type is
      
      ND: Date_Type := Item;
      
   begin
      
      if ND(3) = 31 and ND(2) = 12 then
	 ND(1) := ND(1)+1;
	 ND(2) := 01;
	 ND(3) := 01;   
     elsif (ND(3) = 31) and then(ND(2) = 1 or ND(2) = 3 or ND(2) = 5 or ND(2) = 7 or ND(2) = 8 or ND(2) = 10 or ND(2) = 12) then
	 ND(2) := ND(2)+1;
	 ND(3) := 01;  
     elsif ND(3) = 28 and  ND(2) = 2 then
	 ND(2) := ND(2)+1;
	 ND(3) := 01;
      elsif (ND(3) = 30) and then (ND(2) = 04 or ND(2) = 06 or ND(2) = 09 or ND(2) = 11) then
	 ND(2) := ND(2)+1;
	 ND(3) := 01;
      else
	 ND(3) := ND(3)+1;
      end if;
	 
      return ND;     
      
   end Next_Date;
   ------------------------------------------------------
   ------------------------------------------------------
   function Previous_Date(Item : in Date_Type) return Date_Type is
      
      PD: Date_Type := Item;
      
   begin
      
      if PD(2) = 1 and PD(3) = 1 then
	 PD(1) := PD(1)-1;
	 PD(2) := 12;
	 PD(3) := 31;
      elsif (PD(3) = 1) and then (PD(2) = 2 or PD(2) = 4 or PD(2) = 6 or PD(2) = 8 or PD(2) = 9 or PD(2) = 11) then
	 PD(2) := PD(2)-1;
	 PD(3) := 31;
      elsif (PD(3) = 1) and then (PD(2) = 5 or PD(2) = 7 or PD(2) = 10 or PD(2) = 12) then      
	 PD(2) := PD(2)-1;
	 PD(3) := 30;
      elsif (PD(3) = 1) and then (PD(2) = 3)then
	 PD(2) := PD(2)-1;
	 PD(3) := 28;
      else
	 PD(3) := PD(3)-1;
      end if;

      
      return PD;
      
   end Previous_Date;
   ------------------------------------------------------
   ------------------------------------------------------
  function "<"(L,R: in Date_Type) return Boolean is
   
   begin
      
      if L(1) < R(1) then
	 return True;
      elsif (L(1) = R(1)) and L(2) < R(2) then
	 return True;
      elsif L(3) < R(3) then
	 return True;
      else
	 return False;
      end if;
      
	 
   end "<";
   -------------------------------------------------------
   -------------------------------------------------------
   function ">"(L,R: in Date_Type) return Boolean is
      
   begin
      
        if L(1) > R(1) then
	 return True;
      elsif (L(1) = R(1)) and L(2) > R(2) then
	 return True;
      elsif L(3) > R(3) then
	 return True;
      else
	 return False;
      end if;
      
   end ">";
   -------------------------------------------------------
   -------------------------------------------------------
   function "="(L,R: in Date_Type) return Boolean is
      
   begin
      
      if L(1) /= R(1) then
	 return False;
      elsif L(2) /= R(2) then
	 return False;
      elsif L(3) /= R(3) then
	 return False;
      else
	 return True;
      end if;
            
   end "=";
   -------------------------------------------------------
   
end Date_Handling;
