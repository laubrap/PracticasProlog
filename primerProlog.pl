%DEFINICION BASE DE CONOCIMIENTOS
%Actuo es un predicado de aridad 2: Relaciona pelicula con un Actor/Actriz
%Aridad => Cantidad de argumentos

actuo("Once upon a time in  Hollywood","Leo Di Caprio").
actuo("Once upon a time in  Hollywood","Brad Pitt").
actuo("Once upon a time in  Hollywood","Margot Robbie").
actuo("Wolf of Wall Street","Leo Di Caprio").
actuo("Wolf of Wall Street","Margot Robbie").
actuo("Wolf of Wall Street","Jonah Hill").
actuo("Good Fellas","Lorraine Bracco").
actuo("Good Fellas","Ray Liotta").
actuo("Good Fellas","Joe Pesci").
actuo("Good Fellas","Robert De Niro").
director("Good Fellas","Martin Scorsese").
ganoUnOscar("Good Fellas").

suertudo(Actor):-actuo(Pelicula,Actor),ganoUnOscar(Pelicula).

comidas("milanesa","no pasta").
comidas("fideos","pasta").
comidas("ravioles","pasta").
comidas("berenjenas","no pasta").
comidas("gabagool","no pasta").
aptoCeliacos("fideos").
aptoCeliacos("gabagool").
aptoCeliacos("ravioles").


pastasAptasCeliacos(Comida):-comidas(Comida,"pasta"), aptoCeliacos(Comida).
