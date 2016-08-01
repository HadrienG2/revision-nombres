with Ada.IO_Exceptions;
with Ada.Numerics.Discrete_Random;

package body Interface_Utilisateur is

   function Get_Entier return Entier is
      Result : Entier;
   begin
      Get (Result);
      Text_IO.Skip_Line;
      return Result;
   exception
      when Ada.IO_Exceptions.Data_Error =>
         Text_IO.Skip_Line;
         raise;
   end Get_Entier;


   procedure Demarrer_Exercices is
      function Get_Positive is new Get_Entier (Entier => Positive,
                                               Get    => Positive_IO.Get);
      function Get_Nombre is new Get_Entier (Entier => Langue.Nombre,
                                             Get    => Nombre_IO.Get);
      Nb_Nombres : Positive;
      Nombre_Min, Nombre_Max : Langue.Nombre;
   begin

      Text_IO.Put_Line ('"' & Langue.Nom_Programme & """ - Programme pour la révision des nombres " &
                          Langue.Nom_Langue & 's');
      Text_IO.New_Line;

      if Demander_Min_Et_Max then
         Text_IO.Put ("Quel est le plus petit nombre que vous voulez étudier aujourd'hui ? ");
         Nombre_Min := Get_Nombre;
         Text_IO.Put ("Et le plus grand nombre ? ");
         Nombre_Max := Get_Nombre;
      else
         Nombre_Min := Langue.Nombre'First;
         Nombre_Max := Langue.Nombre'Last;
      end if;

      declare
         subtype Nombre_Etudie is Langue.Nombre range Nombre_Min .. Nombre_Max;
         package Random_Nombre is new Ada.Numerics.Discrete_Random (Nombre_Etudie);
         Generateur_Nombres : Random_Nombre.Generator;
         Nombre, Nombre_Propose : Nombre_Etudie;
      begin

         Random_Nombre.Reset (Generateur_Nombres);

         Text_IO.Put ("Combien de nombres voulez-vous étudier par exercice ? ");
         Nb_Nombres := Get_Positive;
         Text_IO.New_Line;

         Text_IO.Put_Line ("Commençons par aller dans le sens français->" & Langue.Nom_Langue & "...");
         for I in 1 .. Nb_Nombres loop

            Nombre := Random_Nombre.Random (Generateur_Nombres);
            Text_IO.Put (" * ");
            Nombre_IO.Put (Nombre);
            Text_IO.Put (" ? ");

            declare
               Nom_Propose : constant Wide_Wide_String := Text_IO.Get_Line;
               Nom_Correct : constant Wide_Wide_String := Langue.Traduire_Nombre (Nombre);
            begin
               if not (Nom_Propose = Nom_Correct) then
                  Text_IO.Put_Line ("Non, c'est " & Nom_Correct & " !");
               end if;
            end;

         end loop;
         Text_IO.New_Line;

         Text_IO.Put_Line ("Et maintenant, dans le sens " & Langue.Nom_Langue & "->français...");
         for I in 1 .. Nb_Nombres loop

            Nombre := Random_Nombre.Random (Generateur_Nombres);
            Text_IO.Put (" * " & Langue.Traduire_Nombre (Nombre) & " ? ");

            declare
               use type Langue.Nombre;
            begin
               Nombre_Propose := Get_Nombre;
               if not (Nombre_Propose = Nombre) then
                  Text_IO.Put_Line ("Non, c'est " & Nombre_Etudie'Wide_Wide_Image (Nombre) & " !");
               end if;
            exception
               when Ada.IO_Exceptions.Data_Error =>
                  Text_IO.Put_Line ("Quoi?! La réponse était " & Nombre_Etudie'Wide_Wide_Image (Nombre) & " !");
            end;

         end loop;
         Text_IO.New_Line;

      end;

      Text_IO.Put_Line ("C'est tout pour aujourd'hui. A la prochaine fois !");

   end Demarrer_Exercices;

end Interface_Utilisateur;
