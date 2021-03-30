
:- module(proylcc,
	[
		grid/2,
		flick/3,
		ayudaSimple/2,
		ayudaExtendida/2
	]).
	
%Dada una posicion retorna su color asociado

posicionAColor(0,red).
posicionAColor(1,violet).
posicionAColor(2,pink).
posicionAColor(3,green).
posicionAColor(4,blue).
posicionAColor(5,yellow).

grid(1, [
		 [y,g,b,g,v,y,p,v,b,p,v,p,v,r],
		 [r,r,p,p,g,v,v,r,r,b,g,v,p,r],
		 [b,v,g,y,b,g,r,g,p,g,p,r,y,y],
		 [r,p,y,y,y,p,y,g,r,g,y,v,y,p],
		 [y,p,y,v,y,g,g,v,r,b,v,y,r,g],
		 [r,b,v,g,b,r,y,p,b,p,y,r,y,y],
		 [p,g,v,y,y,r,b,r,v,r,v,y,p,y],
		 [b,y,v,g,r,v,r,g,b,y,b,y,p,g],
		 [r,b,b,v,g,v,p,y,r,v,r,y,p,g],
		 [v,b,g,v,v,r,g,y,b,b,b,b,r,y],
		 [v,v,b,r,p,b,g,g,p,p,b,y,v,p],
		 [r,p,g,y,v,y,r,b,v,r,b,y,r,v],
		 [r,b,b,v,p,y,p,r,b,g,p,y,b,r],
		 [v,g,p,b,v,v,g,g,g,b,v,g,g,g]
		 ]).

grid(2, [
		 [y,y,b,g,v,y,p,v,b,p,v,p,v,r],
		 [y,y,p,p,g,v,v,r,r,b,g,v,p,r],
		 [b,y,g,y,b,g,r,g,p,g,p,r,y,y],
		 [r,y,y,y,y,p,y,g,r,g,y,v,y,p],
		 [y,p,y,v,y,g,g,v,r,b,v,y,r,g],
		 [r,b,v,g,b,r,y,p,b,p,y,r,y,y],
		 [p,g,v,y,y,r,b,r,v,r,v,y,p,y],
		 [b,y,v,g,r,v,r,g,b,y,b,y,p,g],
		 [r,b,b,v,g,v,p,y,r,v,r,y,p,g],
		 [v,b,g,v,v,r,g,y,b,b,b,b,r,y],
		 [v,v,b,r,p,b,g,g,p,p,b,y,v,p],
		 [r,p,g,y,v,y,r,b,v,r,b,y,r,v],
		 [r,b,b,v,p,y,p,r,b,g,p,y,b,r],
		 [v,g,p,b,v,v,g,g,g,b,v,g,g,g]
		 ]).

grid(3, [
		 [y,b,g,b,g,b,g,b,g,b,v,r,v,r],
		 [y,v,g,b,p,r,y,v,g,b,p,r,y,v],
		 [g,b,v,p,g,r,p,y,g,v,b,p,p,r],
		 [v,r,b,y,y,v,g,r,b,r,v,p,y,g],
		 [g,p,y,r,v,g,p,y,v,p,v,y,b,p],
		 [r,y,v,r,g,r,g,p,p,v,b,y,b,y],
		 [p,y,b,r,g,v,b,r,y,g,v,b,p,r],
		 [y,v,g,b,p,r,y,v,g,p,r,y,v,g],
		 [g,y,r,p,g,r,y,p,g,y,r,v,p,r],
		 [r,g,v,b,r,y,y,p,b,p,r,y,v,g],
		 [p,r,y,g,r,p,b,y,g,y,p,r,b,r],
		 [p,v,r,g,b,v,r,b,p,b,g,y,v,y],
		 [y,v,y,b,v,r,g,p,y,p,r,g,p,g],
		 [y,r,v,g,p,y,v,p,v,y,b,p,v,y]
		 ]).

grid(4, [
		 [y,g,v,b,b,v,g,b,v,g,v,r,g,r],
		 [g,r,p,r,g,b,p,r,g,b,p,y,g,r],
		 [y,g,y,b,g,b,y,r,g,b,y,b,r,y],
		 [g,b,p,y,r,v,g,y,r,p,g,y,r,p],
		 [b,r,b,p,g,b,p,r,y,v,g,g,r,g],
		 [g,g,r,g,r,g,p,r,g,r,g,r,y,p],
		 [p,r,y,g,b,p,r,y,b,p,r,v,g,b],
		 [b,r,g,b,p,y,r,v,g,y,r,p,g,y],
		 [r,v,b,p,r,v,b,r,r,v,b,p,g,r],
		 [r,b,p,y,y,p,y,p,y,p,r,r,y,p],
		 [g,b,g,y,g,y,b,g,b,y,r,g,b,y],
		 [g,p,p,v,p,v,p,v,y,r,b,r,b,b],
		 [g,b,p,y,g,r,b,p,y,r,v,g,p,y],
		 [y,r,r,y,b,v,b,r,b,v,p,g,r,p]
		 ]).

%Map(-Map)
%Retorna un mapeo Map de las posiciones de una grilla de 14x14
%[
% [NLista,Elem0,Elem1,...,Elem13],
% [NLista1,Elem0,Elem1,...,Elem13],
% ...,
% [NLista13,Elem0,Elem1,...,Elem13]
%].
%Donde NLista es la posición numerica de la lista en la grilla, comenzando por la posicion 0.

map([
     [0,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [1,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [2,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [3,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [4,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [5,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [6,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [7,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [8,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [9,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [10,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [11,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [12,0,1,2,3,4,5,6,7,8,9,10,11,12,13],
     [13,0,1,2,3,4,5,6,7,8,9,10,11,12,13]
    ]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% flick(+Grid, +Color, -FGrid)
%
% FGrid es el resultado de hacer 'flick' de la grilla Grid con el color Color.

flick(Grid, Color, FGrid):-
    Grid = [F|_Fs],
    F = [_X|_Xs],
    colorearAdyacentes(Grid,Color,FGrid,_N).

%colorearAdyacentes(+Grid,+Color,-FGrid,-NCambios)
%Dada una grilla Grid retorna un grilla FGridcon todas las celdas adyacentes a la celda
%superior izquierda de Grid pintadas con el color NuevoColor y un valor NCambios
%que representa la cantidad de celdas que cambiaron de color.
colorearAdyacentes(Grid,NuevoColor,FGrid,NCambios):-
    Grid = [F|_Fs],
    F = [X|_Xs],
    map(Map),
    (X\=NuevoColor)-> adyacentes(Grid,Map,X,NuevoColor,0,0,FGrid,NCambios);
    FGrid = Grid,
    NCambios = 0.

%adyacentes(+Grid,+Map,+Color,+NuevoColor,+NFila,+NElem,-FGrid,-NCambios)
%Verifica si el valor en la posicion (NFila,NElem) es adyacente y lo pinta de NuevoColor,
%luego se llama recursivamente con las posiciones adyacentes.
%En NCambios retorna la cantidad de celdas que se modificaron en la grilla.
%si Grid = FGridAux entonces no se produjeron cambion en la grilla, por lo que no hay mas adyacentes y NCambios = 0.
adyacentes(Grid,Map,Color,NuevoColor,NFila,NElem,FGrid,NCambios):-
    buscarFila(Grid,Map,Color,NuevoColor,NFila,NElem,FGridAux),
    (Grid \= FGridAux)-> NFilaMas is NFila + 1, NFilaMenos is NFila - 1,
    NElemMas is NElem + 1, NElemMenos is NElem - 1,
    NCambiosAux = 1,
    adyacentes(FGridAux,Map,Color,NuevoColor,NFilaMenos,NElem,FGridAux2,NCambiosAux2),
    adyacentes(FGridAux2,Map,Color,NuevoColor,NFilaMas,NElem,FGridAux3,NCambiosAux3),
    adyacentes(FGridAux3,Map,Color,NuevoColor,NFila,NElemMas,FGridAux4,NCambiosAux4),
    adyacentes(FGridAux4,Map,Color,NuevoColor,NFila,NElemMenos,FGridAux5,NCambiosAux5),
    NCambios is NCambiosAux + NCambiosAux2 + NCambiosAux3 + NCambiosAux4 + NCambiosAux5,
    FGrid = FGridAux5;
    NCambios = 0,
    FGrid = Grid.

%buscarFila(+Grid,+Map,+Color,+NuevoColor,+NFila,+NElem,-FGrid)
%Busca la fila correspondiente al numero NFila y cuando la encuentra llama a la regla
%buscarElemento.
buscarFila([],[],_Color,_NuevoColor,_NFila,_NElem,[]).
buscarFila([F|Fs],[M|Ms],Color,NuevoColor,NFila,NElem,FGrid):-
    M = [E|Es],
    (E = NFila)-> buscarFila(Fs,Ms,Color,NuevoColor,NFila,NElem,FGridAux),
    buscarElemento(F,Es,Color,NuevoColor,NElem,NuevaFila),
    FGrid = [NuevaFila|FGridAux];
    buscarFila(Fs,Ms,Color,NuevoColor,NFila,NElem,FGridAux),
    FGrid = [F|FGridAux].

%BuscarElemento(+FilaGrid,+FilaMap,+Color,+NuevoColor,+NElem,-NuevaFila)
%Busca un elemento en FilaGrid y si es de color Color lo pinta de NuevoColor, retorna la
%fila con el valor modificado.
buscarElemento([],[],_Color,_NuevoColor,_NElem,[]).
buscarElemento([Color|Xs],[NElem|Es],Color,NuevoColor,NElem,NuevaFila):-
    buscarElemento(Xs,Es,Color,NuevoColor,NElem,NuevaFilaAux),
	NuevaFila = [NuevoColor|NuevaFilaAux].
buscarElemento([X|Xs],[_E|Es],Color,NuevoColor,NElem,NuevaFila):-
    buscarElemento(Xs,Es,Color,NuevoColor,NElem,NuevaFilaAux),
    NuevaFila = [X|NuevaFilaAux].

%ayudaSimple(+Grid,-Res)
% Res es una lista que retorna la cantidad de celdas que se añadieron al
% conjunto de celdas adyacentes al seleccionar cada color [r,v,p,g,b,y].

ayudaSimple(Grid,Res):-
    ayudaSR(Grid,["r","v","p","g","b","y"],Res).

ayudaSR(_Grid,[],[]).
ayudaSR(Grid,[C|Cs],Res):-
    obtenerCantidadSumados(Grid,C,_FGridAux,CSumadosColor),
    ayudaSR(Grid,Cs,ResAux),
    Res = [CSumadosColor|ResAux].

%ayudaExtendida(+Grid,-Res)
% Res es una matriz que contiene filas que representan la cantidad de
% celdas añadidas a la relacion adyacentes al seleccionar un color y
% luego seleccionas otro de los 5 colores restantes
% retorna una lista de la forma
% [
%  [C0,NST0],
%  [C1,NST1],
%  ...
%  [C5,NST5]
% ]
% donde los pares siguen el orden de colores de la ayuda simple, C es el color del segundo paso y NST es la suma de 
% elementos añadidos a la relacion adyacente en cada paso.

ayudaExtendida(Grid,Res):-
    ayudaER(Grid,["r","v","p","g","b","y"],Res).


ayudaER(_Grid,[],[]).
ayudaER(Grid,[C|Cs],Res):-
    obtenerCantidadSumados(Grid,C,FGrid,NSumadosColor),
    ayudaSimple(FGrid,ResColorExtendido),
    sumarLista(NSumadosColor,ResColorExtendido,ResFila),
    ayudaER(Grid,Cs,ResER),
	obtenerMaximoCascara(ResFila,PosColor,Mayor),
	posicionAColor(PosColor,Col),
	ColorMayor = [Col,Mayor],
    Res = [ColorMayor|ResER].


%sumarLista(+N,+Lista,-Res).
%Suma el valor N a todos los elementos de la lista.
sumarLista(_N,[],[]).
sumarLista(N,[E|Es],Res):-
    NE is N + E,
    sumarLista(N,Es,ResAux),
    Res = [NE|ResAux].

% obtenerCantidadSumados(+Grid,+Color,-FGrid,-Res)
% colorea la grilla Grid con el color Color y la grilla FGrid resultante es pintada de un color k,
% luego a la cantidad de colores pintados en FGrid le resta la cantidad de colores pintados en Grid para obtener la cantidad de elementos
% añadidos a la relacion adyacente al pintar Grid del color Color.
obtenerCantidadSumados(Grid,Color,FGrid,Res):-
    colorearAdyacentes(Grid,Color,FGrid,NCambiados),
    (Grid \= FGrid)-> colorearAdyacentes(FGrid,k,_FGA,NCambiadosAux),
    Res is NCambiadosAux - NCambiados;
    Res = 0,
	FGrid = Grid.

%obtenerMaximoCascara(+Lista,-Pos,-Mayor)
% retorna el mayor elemento de una lista Lista y su posicion en la misma
obtenerMaximoCascara(Lista,Pos,Mayor):-
    obtenerMaximo(Lista,0,Mayor,Pos).

% obtenerMaximo(+Lista,+PosActual,-Mayor,-PosMayor)
% recorre la lista Lista comparando los elementos y almacenando el mayor y la posicion del mismo.
obtenerMaximo([],PosActual,0,PosActual).
obtenerMaximo([N|Ns],PosActual,Mayor,PosMayor):-
    PosSig is PosActual + 1,
    obtenerMaximo(Ns,PosSig,MayorAux,PosMayorAux),
    (N<MayorAux)->  Mayor = MayorAux,
    PosMayor = PosMayorAux;
    Mayor = N,
    PosMayor = PosActual.


















