# AyED_Pascal
Ejercicios de pascal de UTN FRRO

### [Guia para tener de referencia](https://www.tutorialspoint.com/pascal/index.htm)

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

### Operators

Operator | Operation | Operands | Result
------------ | ------------- | ------------ | -------------
'+' | Addition or unary positive | real or integer | real or integer
'-' | Subtraction or unary negative | real or integer | real or integer
'*' | Multiplication | real or integer | real or integer
'/' | Real division | real or integer | real
'div' | Integer division | integer | integer
'mod' | Modulus (remainder division) | integer | integer

### Standard Functions

Function | Description | Argument type | Return type
------------ | ------------- | ------------ | -------------
abs | absolute value | real or integer | same as argument
arctan | arctan in radians | real or integer | real
cos | cosine of a radian measure | real or integer | real
exp | e to the given power | real or integer | real
ln | natural logarithm | real or integer | real
round | round to nearest integer | real | integer
sin | sin of a radian measure | real or integer | real
sqr | square (power 2) | real or integer | same as argument
sqrt | square root (power 1/2) | real or integer | real
trunc | truncate (round down) | real or integer | integer

Function | Description | Argument type | Return type
------------ | ------------- | ------------ | -------------
chr | character with given ASCII value | integer | char
ord | ordinal value | integer or char | integer
pred | predecessor | integer or char | same as argument type
succ | successor | integer or char | same as argument type
