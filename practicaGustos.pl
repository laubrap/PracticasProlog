%%==================================PRACTICA GUSTOS)==================================
morocha(ana).
conOnda(nora).
%%Juan gusta de María.
gusta(juan,maria).

%%Pedro gusta de Ana y de Nora.
gusta(pedro,ana).
gusta(pedro,nora).

%%Todos los que gustan de Nora gustan de Zulema.
gusta(Persona,zulema):-gusta(Persona,nora).

%%Julián gusta de las morochas y de las chicas con onda.
gusta(julian,Persona):-morocha(Persona).
gusta(julian,Persona):-conOnda(Persona).

%%Mario gusta de las morochas con onda y de Luisa.
gusta(julian,luisa).
gusta(mario,Persona):-morocha(Persona),conOnda(Persona).

%%Todos los que gustan de Ana y de Luisa, gustan de Laura.

gusta(Persona,laura):-gusta(Persona,ana),gusta(Persona,luisa).

%%Después cambiar ese "y" por un "o".
gusta(Persona,laura):-gusta(Persona,ana).
gusta(Persona,laura):-gusta(Persona,luisa).

