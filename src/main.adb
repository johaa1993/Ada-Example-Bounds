With Ada.Text_IO; Use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;

with GNAT.Memory_Dump;
with System.Storage_Elements; use System.Storage_Elements;

procedure Main is
   First, Last : Integer;
begin
   Get (First);
   Get (Last);
   declare
      Data : aliased String (First .. Last) := (others => 'a');
   begin
      Put_Line (Data'First'Img & " .. " & Data'Last'Img);

      -- Find out where first and last is stored.
      GNAT.Memory_Dump.Dump (Data'Address - 8, 8);
   end;
end;
