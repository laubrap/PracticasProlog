%Imaginemos que tenemos una sucesion de predicados de la forma
%habitat(Animal,Bioma). que relaciona un animal con su bioma
%Queremos, a partir de este, hacer el predicado acuatico, que dado un animal, nos
%si vive o no en el mar
habitat(delfin,mar).

acuatico(Animal):-habitat(Animal,mar).

%ahora buscamos el predicado terrestre, que se cumple si el animal NO
%habita el mar, puede ser sabana, bosque, deberiamos hacer una regla por cada uno?
%es decir, terrestre(Animal):-habitat(Animal,sabana). por ejemplo? No.

terrestre(Animal):-not(acuatico(Animal)).