%%==============================EJEMPLO INTEGRADOR================================

% natacion: estilos (lista), metros nadados, medallas
practica(ana, natacion([pecho, crawl], 1200, 10)).
practica(luis, natacion([perrito], 200, 0)).
practica(vicky,natacion([crawl, mariposa, pecho, espalda], 800, 0)).
% fútbol: medallas, goles marcados, veces que fue expulsado
practica(deby, futbol(2, 15, 5)).
practica(mati, futbol(1, 11, 7)).
% rugby: posición que ocupa, medallas
practica(zaffa, rugby(pilar, 0)).

/*Aclaraciones:
● para la natación sabemos los estilos que nada, la cantidad de metros
diarios que recorre, y la cantidad de medallas que consiguió a lo largo de
su carrera deportiva
● para el fútbol primero conocemos las medallas, luego los goles
convertidos y por último las veces que fue expulsado
● para el rugby, queremos saber la posición que ocupa y luego la cantidad
de medallas obtenidas*/

%%1) Quiénes son nadadores

esNadador(Persona):-practica(Persona,natacion(_,_,_)).

%%2) Medallas obtenidas

medallasObtenidas(Persona,Medallas):-practica(Persona,natacion(_,_,Medallas)).
medallasObtenidas(Persona,Medallas):-practica(Persona,futbol(Medallas,_,_)).
medallasObtenidas(Persona,Medallas):-practica(Persona,rugby(_,Medallas)).

%%Otro ejemplo de resolucion

medallas(Alguien,Medallas):-practica(Alguien,Deporte),cantMedallas(Deporte,Medallas).

cantMedallas(natacion(_, _, Medallas),Medallas).
cantMedallas(futbol(Medallas,_, _),Medallas).
cantMedallas(rugby(_,Medallas),Medallas).

/*3) Buen deportista
Quiero saber si alguien es buen deportista
● en el caso de la natación, si recorren más de 1.000 metros diarios o nadan
más de 3 estilos
● en el caso del fútbol, si la diferencia de goles menos las expulsiones
suman más de 5
● en el caso del rugby, si son wings o pilares*/

esBuenDeportista(Persona):-practica(Persona,Deporte),esBueno(Deporte).


esBueno(natacion(Estilos,_,_)):-length(Estilos, Cantidad),Cantidad>3.
esBueno(natacion(_,Metros,_)):-Metros>1000.
esBueno(futbol(_,Goles,Exp)):-(Goles-Exp) > 5.
esBueno(rugby(pilar,_)).
esBueno(rugby(wing,_)).


