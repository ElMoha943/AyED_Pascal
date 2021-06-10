# AyED_Pascal
Ejercicios de pascal de UTN FRRO


### Template

```Pascal
Program EJ6; //Nombre del programa
Uses crt; //Libreria

Const //Variables constantes

Type //Tipos de variable definidos por el usuario (?
notas = array [30] of integer;

Var //Variables globales
i:integer
Notas:notas
Cant:integer
Prom:float

begin //Las estructuras se encierran entre begin y end ( {} )
     For i := 1 to 30 do
     Begin
        writeln ('Ingrese una nota'); //Escribir
        readln (Notas[i]); //Leer
        Prom := Prom + Notas[i] //En pascal se asigna (<-) con := y no con =
     End;
     Prom:=Prom/30
     For i := 1 to 30 do
     Begin
        If(Notas[i]>=Prom) //Si solo hay una instruccion dentro no requiere poner begin y end
           Cant := Cant + 1
     End;
     writeln(,' alumnos obtuvieron nota superior al promedio')
     readkey(); //getch(), espera a que se pulse una tecla para dejar leer la consola.
end.
```
