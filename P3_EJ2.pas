Program P3_EJ1;
Uses crt;

Type
nums = array[0..25] of real;

var
total:real;
numeros:nums;
i:integer;

procedure CARGA;
begin
     for i := 0 to 19 do
     begin
        writeln('Ingrese el numero ',i);
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
