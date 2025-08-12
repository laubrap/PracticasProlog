%DEFINICION BASE DE CONOCIMIENTOS
%Actuo es un predicado de aridad 2: Relaciona pelicula con un Actor/Actriz
%Aridad => Cantidad de argumentos

pastas(ravioles).
pastas(fideos).
pastas(agnolotis).
pastas(involtini).

%%predicado poliadicos

come(juan,espinaca).
come(marcelo,revueltoGramajo).
gusta(juan,milanesa).
gusta(marcelo,revueltoGramajo).

%%ahora quiero decir que comensalFeliz si come x comida y le gusta
%%Regla
comensalFeliz(Persona):-come(Persona,Comida),gusta(Persona,Comida).

%%Reglas

esHumano(socrates).
esHumano(platon).
esMortal(Persona):-esHumano(Persona).

%%Reglas compuestas
viveEn(tefi, lanus).
viveEn(gise, lanus).
viveEn(alf, lanus).
viveEn(dodain, liniers).
docente(alf).
docente(tefi).
docente(gise).
docente(dodain).

%%Nuestro requerimiento ahora es que “Cualquier docente que vive en Lanús es un afortunado”

esAfortunado(Docente):-docente(Docente),viveEn(Docente,lanus).

%%Ahora quiero hacer lo mismo pero con un OR, utilizamos dos predicados por separado
afortunado(Docente):-docente(Docente).
afortunado(Docente):-viveEn(Docente,lanus).

%%definicion por comprension

a(X):-X>2,X<6.
