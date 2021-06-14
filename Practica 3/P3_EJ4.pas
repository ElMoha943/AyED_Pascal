Program P3_EJ4;
Uses crt;

//Ingresar 30 elementos de tipo char en un arreglo y luego mostrar sólo los elementos
//que sean distintos de ‘ * ‘, indicando la posición que dicho elemento ocupa en el
//arreglo.

Type
chars = array[0..30] of char;

var
caracteres:chars;
i:integer;

procedure CARGA;
begin
     for i := 0 to 29 do
     begin
        writeln('Ingrese el caracter ',i+1);
        readln(caracteres[i]);
     end;
end;

begin
   CARGA;
   for i := 0 to 29 do
        if caracteres[i]<>'*' then
           writeln(caracteres[i]);
   Readkey();
end.
