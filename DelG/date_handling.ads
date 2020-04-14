package Date_Handling is
   
   type Date_Type is private;
   Year_Error, Month_Error, Day_error: exception;
   
   procedure Get(Item: out Date_Type);
   procedure Put(Item: in Date_Type);
   function Next_Date(Item: in Date_Type) return Date_Type;
   function Previous_Date(Item: in Date_Type) return Date_Type;
   function "<"(L, R: in Date_Type) return Boolean;
   function ">"(L, R: in Date_Type) return Boolean;
   function "="(L, R: in Date_Type) return Boolean;
   
   
private
   
   
   type Date_Type is array (1..3) of Integer;
   
   
 --  type Date_Type is 
   --   record
--	 Year: Integer;
--	 Month: Integer;
--	 Day: Integer;
  --    end record;
   
end Date_Handling;
