Program P3_EJ5;
Uses crt;

//Ingresar números enteros en un arreglo A de 10 elementos e ingresar números enteros
//en otro arreglo B de igual dimensión (utilizar procedure CARGA con parámetros).
//Obtener, un arreglo C, siendo C = A + B. (cada elemento de C se obtiene como la
//suma de los elementos homólogos de A y B).
//a. Mostrar A, B y C, uno debajo del otro.
//b. Mostrar A, B y C, uno al lado del otro

Type
nums = array[0..9] of integer;

var
A:nums;
B:nums;
C:nums;
i:integer;

procedure CARGA(caso:char);
begin
     for i := 0 to 9 do
     begin
        writeln('Ingrese el caracter ',i+1,' del conjunto ',caso);
        if caso = 'A' then
           readln(A[i])
        else
           readln(B[i]);
     end;
end;

procedure MOSTRAR(caso:char);
begin
     for i := 0 to 9 do
        if caso = 'A' then
           writeln(A[i])
        else if caso = 'B' then
           writeln(B[i])
        else
           writeln(C[i]);
end;

begin
   CARGA('A');
   CARGA('B');
   writeln('A B C');
   for i := 0 to 9 do
   begin
        C[i] := A[i] + B[i];
        writeln(A[i],' ',B[i],' ',C[i]);
   end;
   writeln('Conjunto A');
   MOSTRAR('A');
   writeln('Conjunto B');
   MOSTRAR('B');
   writeln('Conjunto C');
   MOSTRAR('C');
   Readkey();
end.
