Program P3_EJ2;
Uses crt;

//Ingresar 20 elementos de tipo real en un arreglo y realizar la suma de los mismos.
//Utilizar los procedimientos CARGA Y SUMA

Type
nums = array[0..20] of real;

var
total:real;
numeros:nums;
i:integer;

procedure CARGA;
begin
     for i := 0 to 19 do
     begin
        writeln('Ingrese el numero ',i+1);
        readln(numeros[i]);
     end;
end;

procedure SUMA;
begin
     for i:= 0 to 19 do
        total := total + numeros[i];
end;

begin
   CARGA;
   SUMA;
   writeln('Suma: ',total);
   Readkey();
end.
