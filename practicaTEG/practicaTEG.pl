% BASE DE CONOCIMIENTO
%===============================================================%
continente(Continente):-ubicadoEn(_,Continente).

% jugador(Jugador): Se cumple para los jugadores.
jugador(rojo).

% ubicadoEn(Pais, Continente): Relaciona un país con el continente en el que está ubicado.
ubicadoEn(argentina, américaDelSur).

% aliados(UnJugador, OtroJugador): Relaciona dos jugadores si son aliados.
aliados(rojo, amarillo).

% ocupa(Jugador, País): Relaciona un jugador con un país en el que tiene ejércitos.
ocupa(rojo, argentina).

% limítrofes(UnPaís, OtroPaís): Relaciona dos países si son limítrofes.
limitrofes(argentina, brasil).

%======================================Punto 1================================================
%tienePresencia/2 relaciona un jugador con un continente si este ocupa un pais que esta
%en este continente 
tienePresencia(Jugador,Contienente):-
    ocupa(Jugador,Pais),
    ubicadoEn(Pais,Continente).

%======================================Punto 2================================================
%puedenAtacarse que relaciona dos jugadores si uno ocupa al menos un pais limitrofe
%A algun pais ocupado por el otro 
puedenAtacarse(Jugador,OtroJugador):-
    ocupa(Jugador,Pais),
    ocupa(OtroJugador,OtroPais),
    limitrofes(Pais,OtroPais).

%======================================Punto 3================================================
%sinTensiones/2 que relaciona dos jugadores que o no pueden atacarse o son aliados
sinTensiones(Jugador,OtroJugador):-aliados(Jugador,OtroJugador).

sinTensiones(Jugador,OtroJugador):-
    jugador(Jugador),
    jugador(OtroJugador),
    not(puedenAtacarse(Jugador,OtroJugador)).

%======================================Punto 4================================================
%perdio/1 se cumple para un jugador que no ocupa ningun pais
perdio(Jugador):-
    jugador(Jugador),
    not(ocupa(Jugador,_)). %preguntamos aca si el jugador ocupa algun pais

%======================================Punto 5================================================
%controla/2 relaciona un jugador con un continente si ocupa todos los paises de ese continente
controla(Jugador,Continente):-
    jugador(Jugador),
    continente(Continente),
    forall(ubicadoEn(Pais,Contiente),ocupa(Jugador,Pais)).

%si no ligaramos el Continente, ubicado en nos devolveria Pais=Argentina, Continente=America
%Que, a fines practicos, no nos permite evaluar esta sentencia bien, ya que no posee valor 
%de verdad

%======================================Punto 6================================================
%renido/1 se cumple para los continentes donde todos los jugadores ocupan un pais
%Osea que para todos los jugadores del jugeo, ocupan un pais 
renido(Continente):-
    continente(Continente), 
    forall(jugador(Jugador),
    (ubicadoEn(Pais,Continente),ocupa(Jugador,Pais))).

%======================================Punto 7================================================
%atrincherado/1 se cumple para los jugadores que ocupan paises en un unico continente
atrincherado(Jugador):-
    jugador(Jugador),
    continente(Continente), %si no ponemos esto, decimos que esta ese pais en ALGUN continente
    forall(ocupa(Jugador,Pais),ubicadoEn(Pais,Continente)).


%======================================Punto 8================================================
%puedeConquistar/2 relaciona un jugador con un continente si no lo controla, pero todos los
%paises del continente que le falta ocupar son limitrofes a alguno que si ocupa y pertenecen
%a alguien que no es su aliado

puedeConquistar(Jugador,Continente):-
    not(controla(Jugador,Continente)), %esta sentencia ya liga los predicados
    forall((ubicadoEn(Pais,Continente),not(ocupa(Jugador,Pais))),
        (limitrofes(OtroPais,Pais),ocupa(Jugador,OtroPais))).

    %Para todos los paises que no ocupa
    %estos son limitrofes con un pais de ese continente y el jugador que quiere atacar
    %posee ese pais