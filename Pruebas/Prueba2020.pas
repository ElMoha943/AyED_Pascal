program prueba2020;
uses crt;

type
	estadistica = array[1..3] of Integer;

var
	M: array[1..100,1..9] of Integer; //NOTAS
	Categoria, Ejercicio: Integer;
	grupos, i, j, num, opt: Integer;
	nombres: array [1..100] of string;
	stats: estadistica;

function estadisticas(cat, ej : Integer) : estadistica;
	begin
		stats[1] := 0;
		stats[2] := 0;
		stats[3] := 0;
		for i := 1 to 100 do
		 	if M[i][1] = cat then
		 		if 	M[i][ej] = 1 then
		 			stats[1] := stats[1] + 1
		 		else if M[i][ej] = 0 then
		 			stats[3] := stats[3] + 1
		 		else
		 			stats[2] := stats[2] + 1;
		estadisticas := stats;
	end;

procedure inscripcion();
	begin
		if grupos = 100 then 
			writeln('Se alcanso el maximo')
		else
			begin
				writeln('Ingrese el nombre');
				readln(nombres[grupos]);
				writeln('Ingrese la Categoria');
				repeat
					readln(Categoria);
				until ((Categoria > 0) and (Categoria < 6));
				M[grupos][1] := Categoria;
				writeln('El numero asignado a este grupo es: ',grupos);
				grupos := grupos + 1;
			end;
	end;

procedure carga();
	begin
		repeat
			writeln('Ingrese el numero de grupo');
			readln(num);
			if ((num < 100) and (num > 0)) then
				begin
					for i := 2 to 8 do
						repeat
							writeln('Ingrese la nota del ejercicio ',i);
							readln(M[num][i]);
							if (M[num][i] = 1) then
								M[num][9] := M[num][9] + 1; 
						until ((M[num][i] > -2) and (M[num][i] < 2))
				end;
		until num = 0;
	end;

procedure listaGanadores();
	var
		mayor: Integer;
		mayorGrupo: Integer;
	begin
		for i := 1 to 5 do
		begin
			mayorGrupo := 0;
			mayor := 0;
			for j := 1 to 100 do
		 		if ((M[j][1] = i) and (M[j][9] > mayor )) then
		 			begin
		 				mayorGrupo := j;
		 				mayor := M[j][9];
		 			end;
		 	writeln('El ganador de la categoria ',i,' es el grupo ',mayorGrupo,' ',mayor);
		end;
	end;

begin
	repeat
	grupos := 1;
		writeln('MENU');
		readln(opt);
		case opt of
            1: inscripcion();
            2: carga();
            3: listaGanadores();
            4: begin
            		writeln('Ingrese la Categoria');
					readln(Categoria);
					writeln('Ingrese el Ejercicio');
					readln(Ejercicio);
					stats := estadisticas(Categoria,Ejercicio);
					writeln('Bien: ',stats[1],'Mal: ',stats[2],'No Resueltos: ',stats[3]);
				end;
	       end;
	until(opt = 5);
end.
