casa(tinsmithCircle1774, 700).
casa(avMoreno708, 2000).
casa(avSiempreViva742,1000).
casa(calleFalsa123, 200).

caracteristica(tinsmithCircle1774,ambientes(3)).
caracteristica(avMoreno708,ambientes(7)).
caracteristica(avSiempreViva742,ambientes(4)).
caracteristica(calleFalsa123,ambientes(3)).

caracteristica(tinsmithCircle1774,jardin).
caracteristica(avMoreno708,jardin).
caracteristica(avSiempreViva742,jardin).
caracteristica(avMoreno708,pileta(30)).

persona(carlos, [ambientes(3),jardin]).
persona(carlos).
persona(maria).
persona(ana).
persona(pedro).
persona(chameleon).

% 1.
% ?- caracteristica(_,pileta(30)).
% true.
% ?- caracteristica(X,pileta(30)).
% X = avMoreno708.

% 2.
% ?- caracteristica(Casa1,ambientes(UnosAmbientes)),
% |    caracteristica(Casa2,ambientes(UnosAmbientes)),
% |    Casa1\=Casa2.
% Casa1 = tinsmithCircle1774,
% UnosAmbientes = 3,
% Casa2 = calleFalsa123 ;
% Casa1 = calleFalsa123,
% UnosAmbientes = 3,
% Casa2 = tinsmithCircle1774 ;
% false.

cumpleAmbientes(UnaCasa, UnosAmbientes, UnaRestriccion):-
  caracteristica(UnaCasa,ambientes(UnosAmbientes)),
  UnosAmbientes>=UnaRestriccion.

cumplePileta(UnaCasa, UnosM3, UnaRestriccion):-
  caracteristica(UnaCasa,pileta(UnosM3)),
  UnosM3>=UnaRestriccion.

quiere(carlos, (caracteristica(UnaCasa,ambientes(UnosAmbientes)))):-
  cumpleAmbientes(UnaCasa,UnosAmbientes,3).
quiere(carlos, (caracteristica(UnaCasa,jardin))):-
  caracteristica(UnaCasa,jardin).

quiere(ana, (caracteristica(UnaCasa,pileta(UnosMetrosCubicos)))):-
  cumplePileta(UnaCasa,UnosMetrosCubicos, 15).

quiere(maria, (caracteristica(UnaCasa,ambientes(UnosAmbientes)))):-
  cumpleAmbientes(UnaCasa, UnosAmbientes,3).
quiere(maria, (caracteristica(UnaCasa,pileta( UnosMetrosCubicos)))):-
  cumplePileta(UnaCasa,UnosMetrosCubicos, 15).

quiere(pedro, UnaCaracteristica):-
  quiere(maria, UnaCaracteristica).

quiere(chameleon, UnaCaracteristica):-
  persona(Cualquiera),
  Cualquiera\=chameleon,
  quiere(Cualquiera, UnaCaracteristica).

% 3.
% ?- quiere(pedro, X).
% X = caracteristica(tinsmithCircle1774, ambientes(3)) ;
% X = caracteristica(avMoreno708, ambientes(7)) ;
% X = caracteristica(avSiempreViva742, ambientes(4)) ;
% X = caracteristica(calleFalsa123, ambientes(3)) ;
% X = caracteristica(avMoreno708, pileta(30)).
% 4.
% ?- caracteristica(X,ambientes(2)).
% false.
% 5.
% ?- quiere(pedro, caracteristica(X,_)).
% X = tinsmithCircle1774 ;
% X = avMoreno708 ;
% X = avSiempreViva742 ;
% X = calleFalsa123 ;
% X = avMoreno708.
% 6.
% ?- quiere(_,caracteristica(avMoreno708,X)).
% X = ambientes(7) ;
% X = jardin ;
% X = pileta(30) ;
% X = ambientes(7) ;
% X = pileta(30) ;
% X = ambientes(7) ;
% X = pileta(30) ;
% X = ambientes(7) ;
% X = jardin ;
% X = pileta(30) ;
% X = ambientes(7) ;
% X = pileta(30) ;
% X = ambientes(7) ;
% X = pileta(30).
% 7.
% ?- casa(UnaCasa,_),
% |    forall(
% |    casa(UnaCasa,_),
% |    not(quiere(_,caracteristica(UnaCasa,_)))
% |    ).
% false.

%----------ENTREGA 2----------%

% 8.
cumpleTodo(Pers,Casa):-
persona(Pers),
casa(Casa,_),
forall(

).
