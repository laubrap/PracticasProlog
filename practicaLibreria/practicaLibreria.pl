% vende(Título, Autor, Género, Editorial, Precio)
vende(elResplandor, stephenKing, terror, debolsillo, 2300).
vende(crónicasDelÁngelGris, alejandroDolina, ficción, booket, 1600).
vende(harryPotter3, jkRowling, ficción, salamandra, 2500).
vende(mort, terryPratchett, aventura, plazaJanés, 1300).

% vende(Título, Autor, Género, CantidadDeDiscos, CantidadDeTemas, Precio)
vende(differentClass, pulp, pop, 2, 24, 1450).
vende(bloodOnTheTracks, bobDylan, folk, 1, 12, 2500).

%Con estos predicados,cuando queremos consultar que podemos comprar con menos de 1500 pesos
%pondriamos vende(Titulo,_,_,_,Precio),Precio<1500. 
%Pero, al tener predicados de aridad diferente, nos topamos con un problema, solo podemos saber
%cuales libros me puedo comprar con ese presupuesto, pero no los discos
%Como podriamos resolverlo? 

%======================================Functores================================================
vende(libro(elResplandor, stephenKing, terror, debolsillo),2300).
vende(libro(crónicasDelÁngelGris, alejandroDolina, ficción, booket),1600).
vende(libro(harryPotter3, jkRowling, ficción, salamandra), 2500).
vende(libro(mort, terryPratchett, aventura, plazaJanés), 1300).

vende(disco(differentClass, terryPratchett, pop, 2, 24), 1450).
vende(disco(differentClass, pulp, pop, 2, 24), 1450).
vende(disco(bloodOnTheTracks, bobDylan, folk, 1, 12), 2500).

%Ahora, si queremos preguntar el precio 

puedoComprar(Plata,Articulo):-
    vende(Articulo,Precio),
    Precio=<Plata.

autor(Autor):-vende(libro(_, Autor, _, _),_).
autor(Autor):-vende(disco(_, Autor, _, _, _), _).

%Elaboramos ahora el predicado tematico, que se cumple para un autor si todo lo
%que se vende es de el

tematico(Autor):-
    autor(Autor),
    forall(vende(Articulo,_),esDe(Articulo,Autor)).

esDe(libro(_, Autor, _, _),Autor).
esDe(disco(_, Autor, _, _, _), Autor).


%======================================Practica================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%======================================Punto 1================================================
%libroMasCaro/1 se cumple para un articulo si es el libro de mayor precio
libro(Libro):-vende(libro(Libro, _, _, _),_).
precioLibro(Libro,Precio):-vende(libro(Libro, _, _, _),Precio).

libroMasCaro(Libro):-
    libro(Libro),
    precioLibro(Libro,Precio),
    forall(
        (vende(libro(OtroLibro,_, _, _), PrecioOtro),Libro\=OtroLibro),
        PrecioOtro<Precio).

%======================================Punto 2================================================
%curiosidad/1 se cumple para un articulo si es lo unico que hay a la venta de su autor

curiosidad(Articulo):-
    vende(Articulo,_), %Ya que esDe no es inversible
    esDe(Articulo,Autor), 
    not((vende(OtroArticulo,_),
        esDe(OtroArticulo,Autor),
        Articulo\=OtroArticulo)).
    
%======================================Punto 3================================================
%sePrestaAConfusion/1 se cumple para un titulo si pertenece a mas de un articulo 
sePrestaAConfusion(Titulo):-
    titulo(Articulo,Titulo),
    titulo(OtroArticulo,Titulo),
    Articulo\=OtroArticulo.

titulo(libro(Titulo,_, _, _), Titulo):-
    vende(libro(Titulo, _, _, _),_).

titulo(disco(Titulo,_, _, _, _), Titulo):-
    vende(disco(Titulo, _, _, _, _),_).


%======================================Punto 4================================================
%mixto/1 se cumple para los autores de mas de un tipo de articulo

mixto(Autor):-
    autor(Autor),
    esDe(libro(_, _, _, _),Autor),
    esDe(disco(_,_, _, _, _), Autor).