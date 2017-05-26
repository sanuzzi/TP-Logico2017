/*-----Cosas Basicas-----*/
casa(tinsmithCircle1774, 700).
casa(avMoreno708, 2000).
casa(avSiempreViva742,1000).
casa(calleFalsa123, 200).

persona(carlos).
persona(maria).
persona(ana).
persona(pedro).
persona(chameleon).

/*-----Caracteristicas, Gustos y instalaciones-----*/
caracteristica(tinsmithCircle1774,ambientes(3)).
caracteristica(tinsmithCircle1774,jardin).
caracteristica(avMoreno708,ambientes(7)).
caracteristica(avMoreno708,jardin).
caracteristica(avMoreno708,pileta(30)).
caracteristica(avSiempreViva742,ambientes(4)).
caracteristica(avSiempreViva742,jardin).
caracteristica(calleFalsa123,ambientes(3)).

instalaciones(tinsmithCircle1774,aireAcondicionado).
instalaciones(tinsmithCircle1774,extractorCocina).
instalaciones(tinsmithCircle1774,calefaccionGas).
instalaciones(avMoreno708,aireAcondicionado).
instalaciones(avMoreno708,extractorCocina).
instalaciones(avMoreno708,calefaccionLoza).
instalaciones(avMoreno708,vidriosDobles).

quiere(carlos, ambientes(3)).
quiere(carlos, jardin).
quiere(ana, pileta(15)).
quiere(maria, ambientes(3)).
quiere(maria, pileta(15)).

quiere(pedro, UnaCaracteristica):-
  quiere(maria, UnaCaracteristica).

quiere(chameleon, UnaCaracteristica):-
  persona(Cualquiera),
  Cualquiera\=chameleon,
  quiere(Cualquiera, UnaCaracteristica).

/*-----Predicados relacionantes de personas y casas-----*/
cumple(
    (caracteristica(UnaCasa,ambientes(AmbQueTiene))),
    (quiere(UnaPersona,ambientes(AmbQueQuiere)))
      ):-
  caracteristica(UnaCasa,ambientes(AmbQueTiene)),
  quiere(UnaPersona,ambientes(AmbQueQuiere)),
  AmbQueTiene>=AmbQueQuiere.

cumple(
    (caracteristica(UnaCasa,pileta(M3QueTiene))),
    (quiere(UnaPersona,pileta(M3QueQuiere)))
      ):-
  caracteristica(UnaCasa,pileta(M3QueTiene)),
  quiere(UnaPersona,pileta(M3QueQuiere)),
  M3QueTiene>=M3QueQuiere.

cumple(
    (caracteristica(UnaCasa,jardin)),
    (quiere(UnaPersona,jardin))
      ):-
  caracteristica(UnaCasa,jardin),
  quiere(UnaPersona,jardin).

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

% 3.
% ?- quiere(pedro,X).
% X = ambientes(3) ;
% X = pileta(15).

% 4.
% ?- caracteristica(X,ambientes(2)).
% false.

% 5.
% ?- cumple(X,pedro).
% X = tinsmithCircle1774 ;
% X = avMoreno708 ;
% X = avSiempreViva742 ;
% X = calleFalsa123 ;
% X = avMoreno708 ;
% false.

% 6.
% ?- cumple((caracteristica(avMoreno708,X)),_).
% X = ambientes(7) ;
% X = ambientes(7) ;
% X = ambientes(7) ;
% X = ambientes(7) ;
% X = ambientes(7) ;
% X = ambientes(7) ;
% X = pileta(30) ;
% X = pileta(30) ;
% X = pileta(30) ;
% X = pileta(30) ;
% X = pileta(30) ;
% X = pileta(30) ;
% X = jardin ;
% X = jardin ;
% false.

% 7.
/*
¿Cuando una propiedad cumple una caracteristica?
Cuando cumple((caracteristica(UnaProp,UnaCarat)),_).
       -UnaCarat previamente tiene que ser unificada, ¿¿¿De donde???-
       ...de lo que quiere cada persona
       (esto ra lo resolvi cambiando todo el codigo)
Entonces, ¿cuando una caracteristica no la cumple ninguna propiedad?
Cuando para toda casa ninguna cumple.

?- ningunaCumple(X).
false.

De testeo cambio la cantidad de ambientes que quiere carlos a 50
?- ningunaCumple(X).
X = ambientes(50) ;
X = ambientes(50) ;
false.
Entonces me encuentra a carlos y a chameleon
*/

ningunaCumple(CaractQueQuiere):-
  quiere(UnaPersona,CaractQueQuiere),
  forall(
    casa(UnaCasa,_),
    not(cumple(
      (caracteristica(UnaCasa,_)),
      (quiere(UnaPersona,CaractQueQuiere))
    ))
  ).
%----------ENTREGA 2----------%

/* 8.
  Una casa cumple algo si cumple(CaractDeCasa,QuierePersona).
  Entonces cumpleTodo si para cosa que quiere la persona la casa la cumple
  Va a ser inversible por el segundo argumento...aunque podria ser por ambos.
  Ya fue, por ambos...

?- cumpleTodo(X,Y).
X = carlos,Y = tinsmithCircle1774 ;
X = carlos,Y = avMoreno708 ;
X = carlos,Y = avSiempreViva742 ;
X = maria,Y = avMoreno708 ;
X = ana,Y = avMoreno708 ;
X = pedro,Y = avMoreno708 ;
X = chameleon,Y = avMoreno708 ;
false.
*/

cumpleTodo(UnaPersona,UnaCasa):-
  persona(UnaPersona),
  casa(UnaCasa,_),
  forall(
    quiere(UnaPersona,LoQueQuiere),
    cumple((caracteristica(UnaCasa,_)),(quiere(UnaPersona,LoQueQuiere)))
  ).

/* 9.

*/

%Op1:
mejorOpcion(UnaPersona):-

  cumpleTodo(UnaPersona,UnaCasa)
