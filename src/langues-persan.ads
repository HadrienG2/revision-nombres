with Traits_Langue;

package Langues.Persan is

   type Nombre is range 1 .. 19_999;

   function Traduire_Nombre (N : Nombre) return Wide_Wide_String;

   package Traits is new Traits_Langue (Nombre          => Nombre,
                                        Traduire_Nombre => Traduire_Nombre,
                                        Nom_Programme   => "اتمت فارسى",
                                        Nom_Langue      => "persan");

end Langues.Persan;
