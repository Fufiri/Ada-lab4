with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;

package body Date_Handling is

------------------------------------------------------
   procedure Get(Item: out Date_Type) is
      
      C: Character;
      
   begin
      
      Get(Item.Year);
      
      if Item.Year < 0 then
	 raise Year_Error;
      end if;
     
      Get(C);
      Get(Item.Month);
      
      if Item.Month <= 0 or Item.Month > 12 then
	 raise Month_Error;
      end if;
	
      Get(C);
      Get(Item.Day);
      
      if (Item.Month = 1 or Item.Month = 3 or Item.Month = 5 or Item.Month = 7 or Item.Month = 8 or Item.Month = 10 or Item.Month = 12) and then (Item.Day > 31 or Item.Day <= 0) then
	 raise Day_Error;
      elsif Item.Month = 2 and (Item.Day > 28 or Item.Day <= 0) then
	 raise Day_Error;
      elsif (Item.Month = 4 or Item.Month = 6 or Item.Month = 9 or Item.Month = 11) and then (Item.Day > 30 or Item.Day <= 0)then
	 raise Day_Error;
      end if;      
      
   end Get;
   ------------------------------------------------------
   ------------------------------------------------------
   procedure Put(Item: in Date_Type) is
      
   begin
      
      Put(Item.Year, Width =>0);
      Put("-");
      
      if (Item.Month < 9) then
	 Put("0");
      end if;

      Put(Item.Month, Width =>0);
      Put("-");
      
      if (Item.Day < 9) then
	 Put("0");
      end if;
     
      Put(Item.Day, Width =>0);
      
   end Put;
   ------------------------------------------------------
   --  Checkj_Days_In_Month(Datum: in Date_Type) return True
  -- (31, 28, 31, 30 ...) 
    -- Days_In_Month(Date.Month)
   ------------------------------------------------------
   function Next_Date(Item : in Date_Type) return Date_Type is
      
      ND: Date_Type := Item;
      
   begin
      
      if ND.Day = 31 and ND.Month = 12 then
	 ND.Year := ND.Year+1;
	 ND.Month := 01;
	 ND.Day := 01;   
     elsif (ND.Day = 31) and then(ND.Month = 1 or ND.Month = 3 or ND.Month = 5 or ND.Month = 7 or ND.Month = 8 or ND.Month = 10 or ND.Month = 12) then
	 ND.Month := ND.Month+1;
	 ND.Day := 01;  
     elsif ND.Day = 28 and  ND.Month = 2 then
	 ND.Month := ND.Month+1;
	 ND.Day := 01;
      elsif (ND.Day = 30) and then (ND.Month = 04 or ND.Month = 06 or ND.Month = 09 or ND.Month = 11) then
	 ND.Month := ND.Month+1;
	 ND.Day := 01;
      else
	 ND.Day := ND.Day+1;
      end if;
	 
      return ND;     
      
   end Next_Date;
   ------------------------------------------------------
   ------------------------------------------------------
   function Previous_Date(Item : in Date_Type) return Date_Type is
      
      PD: Date_Type := Item;
      
   begin
      
      if PD.Month = 1 and PD.Day = 1 then
	 PD.Year := PD.Year-1;
	 PD.Month := 12;
	 PD.Day := 31;
      elsif (PD.Day = 1) and then (PD.Month = 2 or PD.Month = 4 or PD.Month = 6 or PD.Month = 8 or PD.Month = 9 or PD.Month = 11) then
	 PD.Month := PD.Month-1;
	 PD.Day := 31;
      elsif (PD.Day = 1) and then (PD.Month = 5 or PD.Month = 7 or PD.Month = 10 or PD.Month = 12) then      
	 PD.Month := PD.Month-1;
	 PD.Day := 30;
      elsif (PD.Day = 1) and then (PD.Month = 3)then
	 PD.Month := PD.Month-1;
	 PD.Day := 28;
      else
	 PD.Day := PD.Day-1;
      end if;

      
      return PD;
      
   end Previous_Date;
   ------------------------------------------------------
   ------------------------------------------------------
  function "<"(L,R: in Date_Type) return Boolean is
   
   begin
      
      if L.Year < R.Year then
	 return True;
      elsif (L.Year = R.Year) and L.Month < R.Month then
	 return True;
      elsif L.Day < R.Day then
	 return True;
      else
	 return False;
      end if;
      
	 
   end "<";
   -------------------------------------------------------
   -------------------------------------------------------
   function ">"(L,R: in Date_Type) return Boolean is
      
   begin
      
        if L.Year > R.Year then
	 return True;
      elsif (L.Year = R.Year) and L.Month > R.Month then
	 return True;
      elsif L.Day > R.Day then
	 return True;
      else
	 return False;
      end if;
      
   end ">";
   -------------------------------------------------------
   -------------------------------------------------------
   function "="(L,R: in Date_Type) return Boolean is
      
   begin
      
      if L.Year /= R.Year then
	 return False;
      elsif L.Month /= R.Month then
	 return False;
      elsif L.Day /= R.Day then
	 return False;
      else
	 return True;
      end if;
            
   end "=";
   -------------------------------------------------------
   
end Date_Handling;
