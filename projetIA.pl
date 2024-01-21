:- dynamic deja_verifie/1.
:- dynamic deja_verifie_false/1.  % Declare dynamic predicates for storing responses

% Prédicat pour poser une question à l'utilisateur
pose_question(Question) :-
    write(Question),
    write('?(yes/no): '),
    read(ReponseAtom),
    downcase_atom(ReponseAtom, Reponse),
    (Reponse = yes -> true ; assert(deja_verifie_false(Question)), fail).

% Prédicat pour vérifier un symptôme
verifier(Symptome) :-
    deja_verifie(Symptome), % If the symptom has already been verified, succeed
    !. % Cut to prevent backtracking

verifier(Symptome) :-
    deja_verifie_false('Est-ce que vous avez : ' + Symptome),
    !, % Cut to prevent backtracking
    fail. % If the user previously responded with 'no', fail

verifier(Symptome) :-
    pose_question('Est-ce que vous avez : ' + Symptome),
    assert(deja_verifie(Symptome)). % Record that the symptom has been verified


% Prédicat pour le diagnostic
diagnostic(grippe) :-
    verifier(fievre),
    verifier(toux),
    verifier(maux_de_tete),
    verifier(fatigue),
    verifier(douleur_musculaire).

diagnostic(bronchiolite_virale) :-
    verifier(age_moins_2ans),
    verifier(mal_de_gorge),
    verifier(fievre),
    verifier(toux),
    verifier(fatigue),
    verifier(nez_qui_coule),
    verifier(difficulte_a_respirer),
    verifier(sifflement).

diagnostic(pneumonie) :-
    verifier(respiration_rapide),
    verifier(fievre),
    verifier(toux).

diagnostic(lepre) :-
    verifier(prurit),
    verifier(absence_de_sueur),
    verifier(insensibilite).

diagnostic(intoxication_alimentaire) :-
    verifier(fievre),
    verifier(frissons),
    verifier(douleurs_abdominales),
    verifier(diarees),
    verifier(vomissement).

diagnostic(appendicite) :-
    verifier(fievre),
    verifier(douleurs),
    verifier(constipation),
    verifier(nausees).   

diagnostic(migraine) :-
    verifier(maux_de_tete),
    verifier(sensibilite_lumiere),
    verifier(nausees).  

diagnostic(rougeole) :-
    verifier(fievre),
    verifier(eruption_cutanee),
    verifier(yeux_rouges_larmoyants). 

diagnostic(varicelle) :-
    verifier(fatigue),
    verifier(douleurs_articulairs),
    verifier(vesicules_molles_sur_le_corps). 

diagnostic(rubeole) :-
    verifier(lesions_visage),
    verifier(lesion_membres),
    verifier(lesion_tronc),
    verifier(fievre_moderee). 

% Prédicat pour afficher le traitement
traitement(grippe) :-
    write('Vous etes diagnostique avec: grippe'), nl,
    write('Ce qui est conseille :'), nl,
    write('La prise d\'antipyretiques en cas de fievre.'), nl,
    write('La prise du paracetamol est privilegiee.'), nl,
    write('En cas de contre-indication, prise d\'anti-inflammatoires non steroidiens (ibuprofene) ou aspirine.'), nl,
    write('Utiliser de preference un seul type de medicament.'), nl,
    write('Vous devez consulter votre medecin.'), nl.

traitement(bronchiolite_virale) :-
    write('Vous etes diagnostique avec: bronchiolite_virale'), nl,
    write('Ce qui est conseille :'), nl,
    write('Chez l\'enfant hospitalise, une oxygenotherapie a 30 à 40% d\'oxygene apportes par canule nasale,'), nl,
    write('sous tente ou masque facial est habituellement suffisante pour maintenir la saturation en oxygene > 90%.'), nl,
    write('L\'intubation endotracheale peut être necessaire dans certains cas graves.'), nl.
traitement(pneumonie) :-
    write('Vous etes diagnostique avec: pneumonie'), nl,
    write('Ce qui est conseille :'), nl,
    write('Si la pneumonie est d\'origine bacterienne, un traitement antibiotique est generalement prescrit.'), nl,
    write('Le choix de l\'antibiotique dépend du type de bacterie responsable'), nl.
traitement(lepre) :-
    write('Vous etes diagnostique avec: lepre'), nl,
    write('Ce qui est conseille :'), nl,
    write('La strategie de traitement principale pour la lepre est la polychimiotherapie (PCT), qui combine plusieurs medicaments pour une periode prolongee.'), nl,
    write('La PCT est generalement administree sur une duree de 6 mois a plusieurs annees, en fonction de la gravite de la maladie. a rifampicine est l\'un des principaux medicaments utilises dans le traitement de la lepre'), nl.
traitement(intoxication_alimentaire) :-
    write('Vous etes diagnostique avec: intoxication_alimentaire'), nl,
    write('Ce qui est conseille :'), nl,
    write('hydratation, Repos, Alimentation legere, eviter les aliments gras, epices, difficiles a digerer et ceux riches en fibres jusqu\'a ce que les symptomes se resorbent completement.'), nl,
    write('Prendre un medicament antidiarrheiques.'), nl.
traitement(appendicite) :-
    write('Vous etes diagnostique avec: appendicite'), nl,
    write('Aller d\'urgence à l\'hôpital'), nl.
traitement(migraine) :-
    write('Vous etes diagnostique avec: migraine'), nl,
    write('Ce qui est conseille :'), nl,
    write('Prendre un medicaments analgesiques en vente libre, tels que l\'ibuprofene'), nl,
    write('l\'acetaminophène ou l\'aspirine, peuvent etre utilises pour soulager la douleur legere a moderee.'), nl.
traitement(rougeole) :-
    write('Vous etes diagnostique avec: rougeole'), nl,
    write('Ce qui est conseille :'), nl,
    write('Antipyretiques : Des medicaments tels que l\'acétaminophène (paracetamol) ou l\'ibuprofene peuvent etre utilises pour reduire la fievre et soulager les maux de tete. Gouttes nasales salines : Pour soulager la congestion nasale.Antitussifs : En cas de toux persistante, des medicaments antitussifs peuvent etre recommandes. Isolement'), nl.
traitement(varicelle) :-
    write('Vous etes diagnostique avec: varicelle'), nl,
    write('Ce qui est conseille :'), nl,
    write('Antipyretiques : Des medicaments tels que l\'acetaminophene (paracetamol) peuvent etre utilises pour reduire la fievre.'), nl,
    write('Antihistaminiques : En cas de demangeaisons severes, des antihistaminiques peuvent etre recommandes.'), nl,
    write('Soins de la peau : Utiliser des lotions apaisantes a base d\'avoine colloidale pour'), nl,
    write('soulager les demangeaisons et prendre des bains tiedes.'), nl.

    
traitement(rubeole) :-
    write('Vous etes diagnostique avec: rubeole'), nl,
    write('Ce qui est conseille :'), nl,
    write('Antipyretiques : Des medicaments tels que l\'acetaminophene (paracetamol) peuvent etre utilises pour reduire la fievre.'), nl,
    write('Antihistaminiques : En cas de demangeaisons severes, des antihistaminiques peuvent etre recommandes.'), nl,
    write('Soins de la peau : Appliquer des lotions apaisantes pour soulager les demangeaisons et prendre des bains tiedes.'), nl.

% Prédicat pour nettoyer les faits dynamiques à la fin
nettoyer :-
    retractall(deja_verifie(_)),
    retractall(deja_verifie_false(_)).

% Prédicat pour démarrer le diagnostic
diagnostics :-
    (diagnostic(Maladie), traitement(Maladie); write('Diagnostic inconnu.')), nl,nettoyer.
