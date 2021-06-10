Program P2_EJ1;
Uses crt;

Var
i:integer;
n:integer;
x:integer;
SUM:integer;

function poten(x, i: integer): integer;

var
res:integer;
j:integer;

begin
   res := x;
   If(i = 0) then
       res := 1
   Else
       For j := 1 to i-1 do
           res := res*x;
   writeln(res);
   poten := res;
end;

begin
     writeln('Ingrese la base');
     readln(x);
     writeln('Ingrese la cantidad de terminos');
     readln(n);
     For i := 0 to n do
         SUM:=SUM+poten(x,i);
     writeln('Sumatoria: ', SUM);
     readkey();
end.
