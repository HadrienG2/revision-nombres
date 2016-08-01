with Interface_Utilisateur;
with Langues.Italien;

procedure Main_Italien is

   package Interface_Choisie is new Interface_Utilisateur (Langue              => Langues.Italien.Traits,
                                                           Demander_Min_Et_Max => True);

begin

   Interface_Choisie.Demarrer_Exercices;

end Main_Italien;
