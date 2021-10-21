Program Loteos;
Uses crt, sysutils;

Type
    lotes = Record
        num: integer;
        metros: real;
        precio: real; //PRECIO POR METRO CUADRADO
        contado: real; // % DESCUENTO
        anticipo: real; // % DESCUENTO
        vendido: char; //S/N
    end;

    clientes = Record
        num: integer;
        nombre: string;
        pago: char; // c/a
        monto: real;
    end;

var
    lote: lotes;
    cliente: clientes;

    docLotes: file of lotes;
    docClientes: file of clientes;

    monto, precio, total: real;
    opt: char;

procedure Asignar();
begin
    {$I-}
    assign(docLotes, 'C://lotes.dat');
    reset(docLotes);
    if (ioresult = 2) then
        rewrite(docLotes);

    assign(docClientes, 'C://clientes.dat');
    reset(docClientes);
    if (ioresult = 2) then
        rewrite(docClientes);
    {$I+}
end;

procedure Cerrar();
begin
    close(docLotes);
    close(docClientes);
end;

function Buscar(inicio, fin, num: integer):integer;
var
    mid: integer;
begin
    if(inicio > fin) then
    begin
        Buscar := -1;
    end;
    mid := (fin-inicio) DIV 2;
    seek(docLotes, mid);
    read(docLotes, lote);
    if(lote.num = num) then
    Begin
        Buscar := mid;
    End
    else
    begin
        if(lote.num > num) then
        begin
            Buscar := Buscar(mid+1,fin,num);
        end
        else
        begin
            Buscar := Buscar(inicio,fin-1,num);
        end;
    end;
end;

function Buscar(inicio, fin, num: integer):integer;
var
    mid: integer;
begin
    if(inicio > fin) then
        Buscar := -1;
    mid := (fin-inicio) DIV 2;
    seek(docLotes, mid);
    read(docLotes, lote);
    if(lote.num = num) then
        Buscar := mid;
    else
        if(lote.num > num) then
            Buscar := Buscar(mid+1,fin,num);
        else
            Buscar := Buscar(inicio,fin-1,num);
end;

function VALOR(metros, precio: real): real; //tipo: char
begin
    { if(tipo = 'C') then }
        VALOR := metros * precio * lote.contado;
    { else
        VALOR := metros * precio * lote.anticipo;
    end; }
end;

procedure Consultas();
begin
    writeLn('Ingrese el monto maximo a pagar');
    readln(monto);
    seek(docLotes,0);
    repeat
        read(docLotes,lote);
        precio := VALOR(lote.metros, lote.precio);
        if((lote.vendido = 'N') and (precio <= monto)) then
        begin
            writeLn('Numero: ', lote.num);
            writeLn('Metros: ', lote.metros);
            writeLn('Precio', precio);
        end;
    until (eof(docLotes))
end;

procedure Ventas();
var
    i: integer;
begin
    writeLn('Ingrese su nombre');
    readln(cliente.nombre);
    writeLn('Ingrese el numero de lote');
    readln(cliente.num);
    repeat
        writeLn('Ingrese la forma de pago. C cotado / A anticipo en cuotas');
        cliente.pago := readKey();
    until ((cliente.pago = 'C') or (cliente.pago = 'A'));
    i := Buscar(0, fileSize(docLotes),cliente.num); //SUPONIENOD QUE NO VA A PONER ALGO QUE NO EXISTE
    seek(docLotes,i);
    read(docLotes,lote);
    if(lote.vendido = 'S') then
    begin
        lote.vendido := 'N';
        seek(docLotes, i);
        write(docLotes,lote);
        seek(docClientes, fileSize(docClientes));
        write(docClientes, cliente);
    end
    else
    begin
        writeLn('Este lote ya esta vendido');
    end;
end;

procedure Listados();
begin
    reset(docClientes); //Seek(docClientes, 0)
    repeat
        read(docClientes, cliente);
        writeLn('Lote: ', cliente.num);
        writeLn('Nombre: ', cliente.nombre);
        writeLn('Forma de Pago: ', cliente.pago);
        writeLn('Monto: ', cliente.monto);
        total := total + cliente.monto;
    until (eof(docClientes));
    writeLn('Ganancias totales: ', total);
end;

begin
    Asignar();
    repeat
    writeLn('Menu uwu');
    readln(opt);
        case opt of
            '1': Consultas();
            '2': Ventas();
            '3': Listados();
        end;
    until (opt = '4');
    Cerrar();
end.
