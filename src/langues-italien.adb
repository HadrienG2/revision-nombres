with Ada.Assertions;

package body Langues.Italien is

   function Traduire_Nombre (N : Nombre) return Wide_Wide_String is
   begin
      case N is
         when 0 =>
            return "zero";
         when 1 =>
            return "uno";
         when 2 =>
            return "due";
         when 3 =>
            return "tre";
         when 4 =>
            return "quattro";
         when 5 =>
            return "cinque";
         when 6 =>
            return "sei";
         when 7 =>
            return "sette";
         when 8 =>
            return "otto";
         when 9 =>
            return "nove";
         when 10 =>
            return "dieci";
         when 11 =>
            return "undici";
         when 12 =>
            return "dodici";
         when 13 =>
            return "tredici";
         when 14 =>
            return "quattordici";
         when 15 =>
            return "quindici";
         when 16 =>
            return "sedici";
         when 17 =>
            return "diciassette";
         when 18 =>
            return "diciotto";
         when 19 =>
            return "diciannove";
         when 20 =>
            return "venti";
         when 23 =>
            return "ventitrè";
         when 30 =>
            return "trenta";
         when 40 =>
            return "quaranta";
         when 50 =>
            return "cinquanta";
         when 60 =>
            return "sessanta";
         when 70 =>
            return "settanta";
         when 80 =>
            return "ottanta";
         when 90 =>
            return "novanta";
         when others =>
            if N < 0 then
               raise Ada.Assertions.Assertion_Error with "Je ne sais pas traduire ce nombre!";
            elsif N <= 99 then
               declare
                  Dizaines : constant Wide_Wide_String := Traduire_Nombre ((N / 10) * 10);
                  Chiffre_Unites : constant Nombre := N mod 10;
               begin
                  if (Chiffre_Unites = 1) or (Chiffre_Unites = 8) then
                     return Dizaines (Dizaines'First .. Dizaines'Last - 1) & Traduire_Nombre (Chiffre_Unites);
                  else
                     return Dizaines & Traduire_Nombre (Chiffre_Unites);
                  end if;
               end;
            elsif N <= 999 then
               declare
                  Centaines : constant Wide_Wide_String := (if N >= 200 then
                                                               Traduire_Nombre (N / 100)
                                                            else
                                                               "") & "cento";
                  Nombre_Dizaines : constant Nombre := N mod 100;
               begin
                  case Nombre_Dizaines is
                     when 0 =>
                        return Centaines;
                     when 23 =>
                        return Centaines & "ventitre";
                     when others =>
                        return Centaines & Traduire_Nombre (Nombre_Dizaines);
                  end case;
               end;
            else
               raise Ada.Assertions.Assertion_Error with "Je ne sais pas traduire ce nombre!";
            end if;
      end case;
   end Traduire_Nombre;

end Langues.Italien;
