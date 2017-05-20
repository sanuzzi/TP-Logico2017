alquiler(casa(tinsmithCircle1774, 700)).
alquiler(casa(avMoreno708, 2000)).
alquiler(casa(avSiempreViva742,1000)).
alquiler(casa(calleFalsa123, 200)).

caracteristica(ambientes(tinsmithCircle1774,3)).
caracteristica(ambientes(avMoreno708,7)).
caracteristica(ambientes(avSiempreViva742,4)).
caracteristica(ambientes(calleFalsa123,3)).

caracteristica(jardin(tinsmithCircle1774)).
caracteristica(jardin(avMoreno708)).
caracteristica(jardin(avSiempreViva742)).

caracteristica(pileta(avMoreno708,30)).

% 1.
% ?- piscina(X,30).
% X = avMoreno708.

igualAmbientes(Casa1,Casa2):-
  ambientes(Casa1,UnosAmbientes),
  ambientes(Casa2,UnosAmbientes),
  Casa1\=Casa2.

% 2.
% ?- igualAmbientes(X,Y).
% X = Y, Y = tinsmithCircle1774 ;
% X = Y, Y = avMoreno708 ;
% X = Y, Y = avSiempreViva742 ;
% X = Y, Y = calleFalsa123.
% X = tinsmithCircle1774,
% Y = calleFalsa123 ;
% X = calleFalsa123,
% Y = tinsmithCircle1774 ;

cumpleAmbientes(UnaCasa, UnosAmbientes, UnaRestriccion):-
  ambientes(UnaCasa,UnosAmbientes),
  UnosAmbientes>=UnaRestriccion.

cumplePileta(UnaCasa, UnosM3, UnaRestriccion):-
  pileta(UnaCasa,UnosM3),
  UnosM3>=UnaRestriccion.

quiere(carlos, (ambientes(UnaCasa,UnosAmbientes))):- cumpleAmbientes(UnaCasa,UnosAmbientes,3).
quiere(carlos, (jardin(UnaCasa))):-jardin(UnaCasa).

quiere(ana, (pileta(UnaCasa,UnosMetrosCubicos))):- cumplePileta(UnaCasa,UnosMetrosCubicos, 15).

quiere(maria, (ambientes(UnaCasa,UnosAmbientes))):- cumpleAmbientes(UnaCasa, UnosAmbientes,3).
quiere(maria, (pileta(UnaCasa, UnosMetrosCubicos))):- cumplePileta(UnaCasa,UnosMetrosCubicos, 15).

quiere(pedro, UnaRestriccion):- quiere(maria, UnaRestriccion).

quiere(chameleon, UnaCasa):- quiere(Cualquiera, UnaCasa),Cualquiera\=chameleon.

% 3.
% ?- quiere(pedro,X).
% X = ambientes(tinsmithCircle1774, 3) ;
% X = ambientes(avMoreno708, 7) ;
% X = ambientes(avSiempreViva742, 4) ;
% X = ambientes(calleFalsa123, 3) ;
% X = pileta(avMoreno708, 30).

% 4.
% ?-  ambientes(X,2).
% false.
