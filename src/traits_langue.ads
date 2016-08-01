-- Ce paquet de traits rassemble les caractéristiques d'une langue étudiée
generic
   type Nombre is range <>;
   with function Traduire_Nombre (N : Nombre) return Wide_Wide_String is <>;
   Nom_Programme, Nom_Langue : in Wide_Wide_String;
package Traits_Langue is
end Traits_Langue;
