/*-----Cosas Basicas-----*/

% Sería mejor que se llamara "precio", ya que relaciona a una casa, con su precio.
% Luego, si quieren algo que genere solo a la casa, pueden hacer casa(UnaCasa) :- precio(UnaCasa, _).

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

% Ver lo que comento más abajo
instalaciones(tinsmithCircle1774,aireAcondicionado).
instalaciones(tinsmithCircle1774,extractorCocina).
instalaciones(tinsmithCircle1774,calefaccion(gas)).
instalaciones(avMoreno708,aireAcondicionado).
instalaciones(avMoreno708,extractorCocina).
instalaciones(avMoreno708,calefaccion(lozaRadiante)).
instalaciones(avMoreno708,vidriosDobles).
instalaciones(avSiempreViva742,calefaccion(gas)).

quiere(carlos, ambientes(3)).
quiere(carlos, jardin).
quiere(ana, pileta(15)).
quiere(ana,aireAcondicionado).
quiere(ana,vidriosDobles).
quiere(maria, ambientes(3)).
quiere(maria, pileta(15)).

quiere(pedro, UnaCaracteristica):-
  quiere(maria, UnaCaracteristica).
quiere(pedro, vidriosDobles).
quiere(pedro, calefaccion(lozaRadiante)).
quiere(chameleon, UnaCaracteristica):-
  persona(Cualquiera),
  Cualquiera\=chameleon,
  quiere(Cualquiera, UnaCaracteristica).

/*-----Predicados relacionantes de personas y casas-----*/

/*
¿Qué están recibiendo? Parece el predicado, pero en este contexto es un Functor.
Así que están recibiendo al Functor caracteristica y al Functor quiere, con esos argumentos.
Y luego se fijan cosas en base a los respectivos predicados.

No usen functores característica y quiere. Que sean solo predicados. No necesitan esa entidad compuesta.

Lo que les interesa relacionar acá, es una Característica deseada (eso sí es un functor, por ejemplo, de ambientes), con una de la propiedad.
*/
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

/*
Este caso de abajo debía servir para cualquier característica deseada que sea exactamente igual a la de la casa.
Esto sirve para el jardín, y para lo que aparezca el día de mañana como "techoDeTejas", "balcón", "chimenea", etc.

¿Estaría mal que sea cierto también si deseamos 3 ambientes y la casa tiene exactamente 3 ambientes? No. Estaría perfecto.
Encontraríamos por más de un camino que la casa cumple con lo que queremos, y eso no tiene nada de malo.

Pero tenemos un problema: Ver si se cumple lo de las instalaciones. Fíjense lo que dice el enunciado:
"Para saber si una propiedad cumple con cierto conjunto de instalaciones, cada una de las instalaciones deseadas deben estar en el conjunto de las instalaciones de la propiedad"

Así que hay que pensar en las instalaciones como un conjunto de cosas.
Y a la vez hay que darle alguna buena forma de identificarlas y diferenciarlas de las otras cosas que tiene la casa.

Denle una vuelta de tuerca.

*/
cumple(
    (caracteristica(UnaCasa,jardin)),
    (quiere(UnaPersona,jardin))
      ):-
  caracteristica(UnaCasa,jardin),
  quiere(UnaPersona,jardin).

% 1.
% Esta primera consulta no hacía falta. Queríamos la de abajo.
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
% Sean expresivos también en la consulta. Con esa "X", quizá alguien entienda que Pedro quiere a otra persona, o terminar la facu.
% Usar lo mismo en otras consultas también.
% ?- quiere(pedro,X).
% X = ambientes(3) ;
% X = pileta(15).

% 4.
% Esta parte se refería a lo de "cumplir" con esos criterios (en este caso, 2 ambientes O MÁS).
% Lo de ver si tiene cierta característica exacta ya se vio en el punto 1.
% ?- caracteristica(X,ambientes(2)).
% false.

% 5.
% Esto es fruta. No funciona con su versión de código.
% En esta consulta, tienen que emplear 2 predicados, y ver la relación entre pedro y las casas que tienen algo de lo que él quiere
% ?- cumple(X,pedro).
% X = tinsmithCircle1774 ;
% X = avMoreno708 ;
% X = avSiempreViva742 ;
% X = calleFalsa123 ;
% X = avMoreno708 ;
% false.

% 6.
% El predicado cumple/2 debería relacionar a una propiedad con una característica. Así que traten de pensarlo así.
% Vean el enunciado: "Queremos saber si una propiedad cumple con cierta característica", da a entender esa relación. No se la compliquen.
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

% Repensar, sin el forall.
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

% Esto de abajo va a cambiar un poco con las cosas de arriba, pero viene muy bien encarado.
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
