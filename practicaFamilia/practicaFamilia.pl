%%Dada la siguiente base de conocimientos:
progenitor(homero, bart).
progenitor(homero, lisa).
progenitor(homero, maggie).
progenitor(abe, homero).
progenitor(abe, jose).
progenitor(jose, pepe).
progenitor(mona, homero).
progenitor(jacqueline, marge).
progenitor(marge, bart).
progenitor(marge, lisa).
progenitor(marge, maggie).

%%Resolver los predicados hermano, tío, primo y abuelo.
%%hermano
hermano(Hermano1,Hermano2):-progenitor(Progenitor,Hermano1),
    progenitor(Progenitor,Hermano2),Hermano1 \= Hermano2. %%asi no nos salta dos veces true

%%tio
tio(Tio,Sobrino):-hermano(Tio,Hermano),progenitor(Hermano,Sobrino).

%%primo
primo(Primo1,Primo2):-progenitor(Progenitor1,Primo1),progenitor(Progenitor2,Primo2),
    hermano(Progenitor1,Progenitor2).

%%o puedo usar la definicion de tio
primo(Primo1,Primo2):-tio(Tio,Primo1),progenitor(Tio,Primo2).

%%abuelo
abuelo(Abuelo,Nieto):-progenitor(Progenitor,Nieto),progenitor(Abuelo,Progenitor).

