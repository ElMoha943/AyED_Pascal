program prueba2020;
uses crt, sysutils;

var
    deportistas: array [1..500,1..2] of String[50];
    medallas: array [1..500,1..3] of Integer;
    opt, indiceD, i, j, h: Integer;
    pais: string;

procedure cargar();
    begin
        writeln('Ingrese el nombre del deportista');
        readln(deportistas[indiceD][1]);
        writeln('Ingrese el pais del deportista');
        readln(deportistas[indiceD][2]);
        writeln('Ingrese la cantidad de medallas de bronce.');
        readln(medallas[indiceD][1]);
        writeln('Ingrese la cantidad de medallas de plata.');
        readln(medallas[indiceD][2]);
        writeln('Ingrese la cantidad de medallas de oro.');
        readln(medallas[indiceD][3]);
        indiceD := indiceD + 1;
    end;

procedure medallero(pais: string);
    var
        oro, plata, bronce: Integer;
    begin
        oro := 0;
        plata := 0;
        bronce := 0;
        for i := 1 to indiceD-1 do //Para todos los deportistas
            begin
              if deportistas[i][2] = pais then //corroborar que su pais sea el pais enviado como parametro
                  begin
                      bronce := bronce + medallas[i][1];
                      plata := plata + medallas[i][2];
                      oro := oro + medallas[i][3];
                  end;
            end;
        writeln('Oro Plata Bronce');
        writeln(pais,' ',oro,' ',plata,' ',bronce);
    end;
    

procedure ordenar();
    var
        aux: string;
    begin
        for i := 1 to indiceD-2 do
            for j := i+1 to indiceD-1 do
                if deportistas[i,1] > deportistas[j,1] then 
                    for h := 1 to 2 do
                        begin
                            aux := deportistas[i,h];
                            deportistas[i,h] := deportistas[j,h];
                            deportistas[j,h] := aux; 
                        end;aux := deportistas[i,h];
                        deportistas[i,h] := deportistas[j,h];
                        deportistas[j,h] := aux; 
    end;

procedure listado();
    begin
        ordenar();
        for i := 1 to indiceD-1 do
            writeln(deportistas[i][1],' - ',deportistas[i][2]); 
    end;

begin
    //VALORES DE TESTEO
    {deportistas[1][1]:='Alberto';
    deportistas[1][2]:='Argentina';
    deportistas[2][1]:='Jorge';
    deportistas[2][2]:='Argentina';
    deportistas[3][1]:='Brener';
    deportistas[3][2]:='Bolivia';
    deportistas[4][1]:='Dilan';
    deportistas[4][2]:='Bolivia';

    medallas[1][1]:=1;
    medallas[1][2]:=1;
    medallas[1][3]:=2;
    medallas[2][1]:=1;
    medallas[2][2]:=0;
    medallas[2][3]:=1;
    medallas[3][1]:=4;
    medallas[3][2]:=1;
    medallas[3][3]:=0;
    medallas[4][1]:=1;
    medallas[4][2]:=1;
    medallas[4][3]:=0;}

    indiceD := 5;
    repeat
        writeln('MENU');
        readln(opt);
        case opt of
            1: cargar();
            2: begin
                writeln('Ingrese un pais');
                readln(pais);
                medallero(pais);
            end;
            3: listado();
        end;
    until (opt = 4);
end.
