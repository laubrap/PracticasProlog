%%definamos el siguiente de un numero
siguiente(Numero,Siguiente):-Siguiente is Numero + 1.

%%Si usamos "=" se queda con la expresion 2+1, no la evalua
%%Es inversible? No, como obtendriamos desde siguiente el anteror?
%Quedaria 4 is numero + 1, la parte derecha quedaria sin resolver. 
%%En el operador is hay un numero (lado izq) y una expr (lado der), pero no se puede resolver
%%la expr aca => error

%%Pattern matching-> toma ambos resultados
valor(0,1).
valor(Inc,Inc).

%%QUEDE EN NTH0 modulo 3