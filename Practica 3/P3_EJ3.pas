Program P3_EJ3;
Uses crt;

//Ingresar 25 elementos de tipo entero en un arreglo y luego obtener la suma de los
//valores positivos dentro del conjunto. Utilizar el mismo procedimiento CARGA del
//ejercicio anterior (incluir parámetros).

Type
nums = array[0..25] of real;

var
total:real;
numeros:nums;
i:integer;

procedure CARGA;
begin
     for i := 0 to 24 do
     begin
        writeln('Ingrese el numero ',i+1);
        readln(numeros[i]);
     end;
end;

procedure SUMA;
begin
     for i:= 0 to 24 do
        if numeros[i] > 0 then
           total := total + numeros[i];
end;

begin
   CARGA;
   SUMA;
   writeln('Suma: ',total);
   Readkey();
end.
