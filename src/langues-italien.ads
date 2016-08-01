with Traits_Langue;

package Langues.Italien is

   type Nombre is range 0 .. 999;

   function Traduire_Nombre (N : Nombre) return Wide_Wide_String;

   package Traits is new Traits_Langue (Nombre          => Nombre,
                                        Traduire_Nombre => Traduire_Nombre,
                                        Nom_Programme   => "Il numero italiano",
                                        Nom_Langue      => "italien");

end Langues.Italien;
