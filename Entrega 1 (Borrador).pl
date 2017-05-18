///
En esta versión da como resultado cual es el alquiler que necesita segun lo que alquilerRequerido cada uno.
///
alquilerRequerido(carlos , (alquiler(UnaCasa, UnosPrecios))):-
 alquiler(UnaCasa,UnosPrecios),
 ambientes(UnaCasa,UnosAmbientes),
 UnosAmbientes >= 3,jardin(UnaCasa).
>> alquilerRequerido(carlos,Lugar)
<< Lugar = alquiler(tinsmithCircle1774, 700)
Lugar = alquiler(avMoreno708, 2000)
Lugar = alquiler(avSiempreViva742, 1000)
--------------
alquilerRequerido(ana,(alquiler(UnaCasa, UnosPrecios))):-
alquiler(UnaCasa, UnosPrecios),
piscina(UnaCasa,Metros),
Metros >= 1000.
<< alquilerRequerido(ana,Lugar)
>> False
--------------
alquilerRequerido(maria,(alquiler(UnaCasa, UnosPrecios))):-
alquiler(UnaCasa, UnosPrecios),
ambientes(UnaCasa,UnosAmbientes),
UnosAmbientes >=2,
piscina(UnaCasa,Metros),
Metros >= 30.
<< alquilerRequerido(maria,Lugar)
>> Lugar = alquiler(avMoreno708, 2000)
--------------
alquilerRequerido(pedro,Lugar):- alquilerRequerido(maria,Lugar).
<< alquilerRequerido(pedro,Lugar)
>> Lugar = alquiler(avMoreno708, 2000)
--------------
alquilerRequerido(chamaleon,Lugar):- alquilerRequerido(carlos,Lugar).
alquilerRequerido(chamaleon,Lugar):- alquilerRequerido(pedro,Lugar).
alquilerRequerido(chamaleon,Lugar):- alquilerRequerido(ana,Lugar).
<< alquilerRequerido(chamaleon,Lugar)
>> Lugar = alquiler(tinsmithCircle1774, 700)
Lugar = alquiler(avMoreno708, 2000)
Lugar = alquiler(avSiempreViva742, 1000)
Lugar = alquiler(avMoreno708, 2000)

///
Esta versión tiene como objetivo dar en resultado lo que quiere cada persona.
///
quiere(carlos , (ambientes(UnaCasa, UnosAmbientes))):-
 ambientes(UnaCasa,UnosAmbientes),
 UnosAmbientes >= 3,jardin(UnaCasa).
<<<quiere(Carlos,X)
>>>Carlos = carlos,
   Casa = ambientes(tinsmithCircle1774, 3)
   Carlos = carlos,
   Casa = ambientes(avMoreno708, 7)
   Carlos = carlos,
   Casa = ambientes(avSiempreViva742, 4)
--------------
quiere(ana,(piscina(UnaPiscina,Metros))):-
piscina(UnaPiscina,Metros),
metros = 100.
>>>quiere(ana,X)
<<<False
--------------
quiere(maria,(ambientes(UnaCasa,UnosAmbientes),(piscina(UnaCasa,Metros)))):-
ambientes(UnaCasa,UnosAmbientes),
UnosAmbientes >=2,
piscina(UnaCasa,Metros),
Metros >= 15.
>>>quiere(maria,(Ambientes,Piscina))
<<<Ambientes = ambientes(avMoreno708, 7),
   Piscina = piscina(avMoreno708, 30)

--------------
quiere(pedro,(Ambientes,Piscina)):-quiere(maria,(Ambientes,Piscina)).
>>>quiere(pedro,Casa)
<<<Casa = (ambientes(avMoreno708, 7),piscina(avMoreno708, 30))

quiere(chamaleon,Lugar):- quiere(carlos,Lugar).
quiere(chamaleon,Lugar):- quiere(pedro,Lugar).
quiere(chamaleon,Lugar):- quiere(ana,Lugar).

--------------
4)
revisarAmbientes(ambientes(UnaCasa,Ambientes)):-
ambientes(UnaCasa,Ambientes),
Ambientes >=2.
>>> revisarAmbientes(Casa)
<<< Casa = ambientes(tinsmithCircle1774, 3)
Casa = ambientes(avMoreno708, 7)
Casa = ambientes(avSiempreViva742, 4)
Casa = ambientes(calleFalsa123, 3)
--------------
5)quiere(pedro,(Ambientes,Piscina)):-quiere(maria,(Ambientes,Piscina)).
>>>quiere(pedro,Casa)
<<<Casa = (ambientes(avMoreno708, 7),piscina(avMoreno708, 30))





////////
carlos(ambiente,jardin).
ana(piscina).
maria(ambiente,piscina).
pedro(ambiente,piscina):- maria(ambiente,piscina).
chamaleon(ambiente,piscina,jardir):-
carlos(ambiente,jardin),
ana(piscina),
pedro,(ambiente,piscina).////////