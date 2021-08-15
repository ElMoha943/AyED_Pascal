program prueba2020;
uses crt;

//Maximo 100 prendas
//Hay 50 tipos de recortes
//Prendas[numPrenda][numRecorte] = cantRecorte;
//Recortes[numRecorte][atr] | 1 stock 2 precio;
//Ventas[numVentas][atr] | 1 nombre 2 telefono 3 nro de prenda

var
	Prendas: array [1..100,1..51] of Integer; //El 51 es el precio.
	Recortes: array [1..50,1..2] of Integer;
	Ventas: array [1..100,1..2] of String;
	Ventas2: array [1..100] of Integer;
	opt, indiceP, indiceR, indiceV, i, j, precio, num: Integer;

procedure cargar(cosa: char);
	begin
		if cosa = 'P' then 
			repeat
				for i := 1 to indiceR-1 do // for i := 1 to indiceR do
				begin
					writeln('Ingrese la cantidad de recortes del tipo ',i);
					readln(Prendas[indiceP][i]);
				end;
				precio := 0;
				for j := 1 to indiceR do
					precio := precio + (Prendas[indiceP][j] * Recortes[j][2]); //PRECIO = PRECIO + (CANT_RECORTES * PRECIO_RECORTE)
				Prendas[indiceP][51] := precio;
				indiceP := indiceP+1;
				writeln('Desea ingresar otra prenda? Si 1 No 0');
				readln(num);
			until ((num = 0) or (indiceP = 100))
		else
			repeat
				writeln('Ingrese el stock del recorte ',indiceR);
				readln(Recortes[indiceR][1]);
				writeln('Ingrese el precio unitario del recorte ',indiceR);
				readln(Recortes[indiceR][2]);
				writeln('Desea ingresar otro recorte? Si 1 No 0');
				readln(num);
				indiceR := indiceR + 1;
			until ((num = 0) or (indiceR = 100));
	end;

procedure mostrarPrecios();
begin
	for i := 1 to indiceP-1 do
		writeln('Prenda ',i,' $',Prendas[i][51]);
end;

function verificaStock(numPrenda: Integer): Boolean;
begin
	for i := 1 to indiceR do
		if Prendas[numPrenda][i] > Recortes[i][1] then
		begin
			writeln('No hay suficientes recortes');
			verificaStock := false
		end;
	verificaStock := true;
end;

procedure realizarVenta();
	var
		flag: Boolean;
	begin
		repeat
			writeln('Ingrese el nombre');
			readln(Ventas[indiceV][1]);
			writeln('Ingrese el telefono');
			readln(Ventas[indiceV][2]);
			writeln('Ingrese el n° prenda');
			repeat
				readln(Ventas2[indiceV]);
			until (Ventas2[indiceV] <= indiceP);
			flag := verificaStock(Ventas2[indiceV]);
			if flag = true then
				begin
					writeln('Precio a pagar: ',Prendas[Ventas2[indiceV]][51]);
					writeln('Puede pagarlo? Si 1 No 2');
					readln(num);
					if num = 1 then
						begin
							writeln('Nombre: ',Ventas[indiceV][1],' Telefono: ', Ventas[indiceV][2],' Prenda N°: ',Ventas2[indiceV],' Preico: ',Prendas[Ventas2[indiceV]][51]);
						 	for i := 1 to indiceR do
						 	 	Recortes[i][1] := Recortes[i][1] - Prendas[Ventas2[indiceV]][i]; //Stock = Stock - Usados
						end
			else
				writeln('No se pudo fabricar la prenda.');
			end;
			writeln('Desea ingresar otro recorte? Si 1 No 0');
			readln(num);
			IndiceV := indiceV + 1;
		until (num = 0);
	end;

begin
	indiceP := 1;
	indiceR := 1;
	indiceV := 1;
	repeat
		writeln('MENU');
		readln(opt);
		case opt of
            1: cargar('P');
            2: cargar('R');
            3: mostrarPrecios();
            4: realizarVenta();
	       end;
	until(opt = 5);
	for i := 1 to indiceR do
		writeln('Stock del recorte ',i,': ',Recortes[i][1]);
end.
