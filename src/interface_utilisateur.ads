with Ada.Wide_Wide_Text_IO;
with Traits_Langue;

generic
   with package Langue is new Traits_Langue (others => <>);
   Demander_Min_Et_Max : in Boolean;
package Interface_Utilisateur is

   -- Démarrer l'interface utilisateur du programme, et donc les exercices
   procedure Demarrer_Exercices;

private

   -- On va avoir besoin d'entrées/sorties texte Unicode
   package Text_IO renames Ada.Wide_Wide_Text_IO;
   package Positive_IO is new Text_IO.Integer_IO (Positive);

   -- Et de paquets spécifiques à la langue qu'on veut parler
   package Nombre_IO is new Text_IO.Integer_IO (Langue.Nombre);

   -- Par défaut, les fonctions d'Ada pour récupérer des nombres laissent traîner des sauts de ligne dans le buffer
   -- d'entrée. Ici, ce comportement est indésirable et on veut l'éviter via la fonction suivante.
   generic
      type Entier is (<>);
      with procedure Get (What  : out Entier;
                          Width : Text_IO.Field := 0);
   function Get_Entier return Entier;

end Interface_Utilisateur;
