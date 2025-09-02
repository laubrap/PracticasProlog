%Imaginemos que tenemos una sucesion de predicados de la forma
%habitat(Animal,Bioma). que relaciona un animal con su bioma
%Queremos, a partir de este, hacer el predicado acuatico, que dado un animal, nos
%si vive o no en el mar
habitat(delfin,mar).
habitat(leon,sabana).
habitat(leon,bosque).

acuatico(Animal):-habitat(Animal,mar).

%ahora buscamos el predicado terrestre, que se cumple si el animal NO
%habita el mar, puede ser sabana, bosque, deberiamos hacer una regla por cada uno?
%es decir, terrestre(Animal):-habitat(Animal,sabana). por ejemplo? No.

terrestre(Animal):-not(acuatico(Animal)). 
%no esta bien, ver abajo por que

%que pasa si con esta definicion, preguntamos quanimales son terrestres?
%es decir terrestre(Animal).
%El problema es que el predicado not no es inversible
%No sabemos el universo de todos los animales que no son acuaticos
%No podemos definir un universo infinito en la base de conocimiento
%Podemos solucionar esto con un predicado generador, utilizando todos los
%animales que HAY en la base de conocimiento:

animal(Animal):-habitat(Animal,_).
bioma(Bioma):-habitat(_,Bioma).

%ahora entonces

terrestre(Animal):-animal(Animal),not(acuatico(Animal)).

%queremos saber si ahora un animal es friolento, por lo que debe habitar 
%biomas templados solamente
%para todos los biomas que habita un animal, es bioma debe ser templado
%para esto utilizamos la herramienta del forall 

templado(Bioma):-habitat(_,sabana).
templado(Bioma):-habitat(_,desierto).
templado(Bioma):-habitat(_,jungla).

friolento(Animal):-
    animal(Animal),
    forall(habitat(Animal,Bioma),templado(Bioma)).

friolento(Animal):-
    not((animal(Animal),not(friolento(Animal)))).
%NO (existe un un animal que NO(sea friolento))

%=================================Practica Habitat============================================
%Dado el predicado come/2 que relaciona un animal con otro al cual se come, modelar
%los siguientes predicados
come(leon,gacela).

%======================================Punto 1================================================
%hostil/2 relaciona un animal con un bioma si todos los animales que lo habitan se lo comen 
hostil(Animal,Bioma):-
    animal(Animal),
    bioma(Bioma),
    forall(habitat(Animales,Bioma),come(Animales,Animal)).


%======================================Punto 2================================================
%terrible/2 relaciona un animal con un bioma si todos los animales que se lo comen habian en el 
%no existe un animal en el bioma que no se lo coma  
terrible(Animal,Bioma):-
    animal(Animal),
    bioma(Bioma),
    not((habitat(OtroAnimal,Bioma),not(come(OtroAnimal,Animal)))).    

%======================================Punto 3================================================
%compatibles/2 que relaciona dos animales si ninguno se come al otro 
compatibles(Animal,OtroAnimal):-
    animal(Animal),
    animal(OtroAnimal),
    not(come(Animal,OtroAnimal)),
    not(come(OtroAnimal,Animal)),
    Animal\=OtroAnimal.

%======================================Punto 4================================================
%Adaptable/1 se cumple para los animales que habitan todos los biomas
adaptable(Animal):-
    animal(Animal),
    forall(habitat(_,Bioma), habitat(Animal,Bioma)).
    
%======================================Punto 5================================================
%raro/1 se cumple para los animales que habitan un unico bioma
raro(Animal):-
    habitat(Animal,Bioma),
    not((habitat(Animal,OtroBioma), Bioma\=OtroBioma)). 
%Hay qye poner el Bioma\=OtroBioma dentro del not ya que no devuelve una variable ligada
%Simplemente tenemos true o false

%======================================Punto 6================================================
%Dominante/1 se cumple para los animales que se comen a todos los otros animales del bioma en
%el que viven 

dominante(Animal):-
    habitat(Animal,Bioma),
    forall((habitat(OtroAnimal,Bioma),Animal\=OtroAnimal),come(Animal,OtroAnimal)).