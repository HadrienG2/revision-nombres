with Interface_Utilisateur;
with Langues.Persan;

procedure Main_Persan is

   package Interface_Choisie is new Interface_Utilisateur (Langue              => Langues.Persan.Traits,
                                                           Demander_Min_Et_Max => False);

begin

   Interface_Choisie.Demarrer_Exercices;

end Main_Persan;
