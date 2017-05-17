alquiler(tinsmithCircle1774, 700).
alquiler(avMoreno708, 2000).
alquiler(avSiempreViva742,1000).
alquiler(calleFalsa123, 200).

ambientes(tinsmithCircle1774,3).
ambientes(avMoreno708,7).
ambientes(avSiempreViva742,4).
ambientes(calleFalsa123,3).

jardin(tinsmithCircle1774).
jardin(avMoreno708).
jardin(avSiempreViva742).

piscina(avMoreno708,30).

% 1.
% ?- piscina(X,30).
% X = avMoreno708.

igualAmbientes(Casa1,Casa2):-
  ambientes(Casa1,UnosAmbientes),
  ambientes(Casa2,UnosAmbientes).

% 2.
% ?-
% ?- igualAmbientes(X,Y).
% X = Y, Y = tinsmithCircle1774 ;
% X = Y, Y = avMoreno708 ;
% X = Y, Y = avSiempreViva742 ;
% X = Y, Y = calleFalsa123.
% X = tinsmithCircle1774,
% Y = calleFalsa123 ;
% X = calleFalsa123,
% Y = tinsmithCircle1774 ;
