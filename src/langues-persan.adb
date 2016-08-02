with Ada.Assertions;

package body Langues.Persan is

   function Traduire_Nombre (N : Nombre) return Wide_Wide_String is
   begin
      case N is
         when 1 =>
            return "yék";
         when 2 =>
            return "do";
         when 3 =>
            return "sé";
         when 4 =>
            return "tchahâr";
         when 5 =>
            return "pandj";
         when 6 =>
            return "chéch";
         when 7 =>
            return "haft";
         when 8 =>
            return "hacht";
         when 9 =>
            return "noh";
         when 10 =>
            return "dah";
         when 11 =>
            return "yâzdah";
         when 12 =>
            return "davâzdah";
         when 13 =>
            return "sizdah";
         when 14 =>
            return "tchahârdah";
         when 15 =>
            return "pânzdah";
         when 16 =>
            return "chânzdah";
         when 17 =>
            return "héfdah";
         when 18 =>
            return "hédjdah";
         when 19 =>
            return "nouzdah";
         when 20 =>
            return "bist";
         when 30 =>
            return "si";
         when 40 =>
            return "tchéhél";
         when 50 =>
            return "pandjâh";
         when 60 =>
            return "chast";
         when 70 =>
            return "haftâd";
         when 80 =>
            return "hachtâd";
         when 90 =>
            return "navad";
         when 100 =>
            return "sad";
         when 200 =>
            return "dévist";
         when 300 =>
            return "sisad";
         when 400 =>
            return "tchahârsad";
         when 500 =>
            return "pânsad";
         when 600 =>
            return "chéchsad";
         when 700 =>
            return "haftsad";
         when 800 =>
            return "hachtsad";
         when 900 =>
            return "nohsad";
         when others =>
            if N < 1 then
               raise Constraint_Error with "Je ne sais pas traduire ce nombre!";
            elsif N < 100 then
               return Traduire_Nombre ((N / 10) * 10) & "-o " & Traduire_Nombre (N mod 10);
            elsif N <= 999 then
               return Traduire_Nombre ((N / 100) * 100) & "-o " & Traduire_Nombre (N mod 100);
            elsif N <= 19_999 then
               declare
                  Milliers : constant Wide_Wide_String := (if N > 1_999 then
                                                              Traduire_Nombre (N / 1000) & " "
                                                           else "") & "hézâr";
                  Reste : constant Nombre := N mod 1000;
               begin
                  return Milliers & (if Reste /= 0 then
                                        "-o " & Traduire_Nombre (Reste)
                                     else "");
               end;
            else
               raise Constraint_Error with "Je ne sais pas traduire ce nombre!";
            end if;
      end case;
   end Traduire_Nombre;

end Langues.Persan;
