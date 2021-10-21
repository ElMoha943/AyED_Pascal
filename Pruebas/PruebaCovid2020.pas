Program covid;
uses ctrl, sysutils;

type
    turistas = Record
        ingreso: string;
        CeCOT: string;
        dni: string;
        birthdate: string;
        domicilio: string;
        prov_origen: char; //A-Z
        egreso: string;
        test: char; //+ o -
    end;

    alertas = Record
        fecha: string;
        dni: string;
        birthdate: string;
        telefono: string;
        sexo: char; // F o M
        domicilio: string;
        prov_origen: char; // A - Z
        baja: boolean;
    end;

    provincias = Record
        cod_prov: char; //A-Z
        nombres: string;
    end;

var
    turista := turistas;
    alertas := alerta;
    provincias := provincia;

    docTuristas := file of turistas;
    docAlertas := file of alertas;
    docProvincias := file of provincias;

    opt := char;
    i := integer;

procedure Abrir();
begin
    {$I-}
    assign(docTuristas, 'C://turistas.dat');
    reset(docTuristas);
    if(ioresult = 2) then
        rewrite(docTuristas);

    assign(docProvincias, 'C://provincias.dat');
    reset(docProvincias);
    if(ioresult = 2) then
        rewrite(docProvincias);

    assign(docAlertas, 'C://alertas.dat');
    reset(docAlertas);
    if(ioresult = 2) then
        rewrite(docAlertas);
    {$I+}
end;

procedure Close();
begin
    close(docAlertas);
    close(docTuristas);
    close(docProvincias);
end;

function BuscarT(dni: integer): integer
begin
    for i:=0 to filesize(docTuristas) do
        seek(docTuristas,i);
        write(docTuristas,turista);
        if(turista.dni = dni) then
        begin
            BuscarT := i;
        end;
end;

function BuscarTPcod: integer): integer
begin
    for i:=0 to filesize(docProvincias) do
        seek(docProvincias,i);
        write(docProvincias,provincia);
        if(provincia.cod_prov = cod) then
        begin
            BuscarP := i;
        end;
end;

procedure CargaIngreso();
begin
    repeat
        repeat
            writeln('¿Posee CeCOT? 1. Si 2. No')
            opt := readkey()
        until (opt = 1 or opt = 2);
        if(opt = 1) then
        begin
            turista.ingreso := Date;
            writeln('N° CeCot');
            readln(turista.CeCOT);
            writeln('DNI');
            readln(turista.dni);
            writeln('Fecha de nacimiento');
            readln(turista.birthdate);
            writeln('Domicilio');
            readln(turista.domicilio);
            writeln('Provincia de origen');
            readkey(turista.prov_origen);
            seek(docTuristas,filesize(docTuristas));
            write(docTuristas,turista);
        end
        else
        begin
            writeln('No puede entrar');
        end;
        repeat
            writeln('Desea ingresar otro? 1. Si 0. No');
            opt := readkey;
        until (opt = 1 or opt = 0);       
    until (opt := 0);
end;

function NombreProv(codigo: char): string;
begin
    for i:= 0 to filesize(docProvincias)-1 do 
        seek(docProvincias,i)
        read(docProvincias,provincia;
        if(provincia.cod_prov = codigo) then
        begin
            NombreProv :=  provincia.nombre;
        end;
end;

procedure CargaEgreso();
var
    dni: string;
begin
    writeln('Documento');
    i := BuscarT(dni);
    if(i = -1) then
    begin
        writeln('Ese DNI no existe');
    end
    else
    begin
        seek(docTuristas,i);
        read(docTuristas,turista);
        turista.egreso := Date;
        writeln('Resultado del test');
        readkey(turista.test);
        seek(docTuristas,i);
        write(docTuristas,turista);
        if(turista.test = '+') then
        begin
            alerta.fecha := Date;
            alerta.dni := turista.dni;
            alerta.birthdate := turista.birthdate;
            writeln('Telefono');
            readln(alerta.telefono);
            writeln('Sexo');
            readln(alerta.sexo);
            alerta.domicilio := turista.domicilio;
            alerta.prov_origen := turista.prov_origen;
            alerta.baja := false;
            seek(docAlertas, filesize(docAlertas));
            write(docAlertas, alerta);
        end;
    end;
end;

procedure ListAlertas();
begin
    writeln('Codigo de Provincia');
    provincia.cod_prov := readkey();
    i := BuscarP(provincia.cod_prov);
    if(i := -1) then
    begin
        writeln('Esa provincia no existe');
    end
    else
    begin
        seek(docProvincias, i);
        read(docProvincias,provincia);
        writeln('Provincia',NombreProv(provincia.cod_prov),' Fecha: ',Hoy());
        for i:= 0 to filesize(docAlertas)-1 do 
            seek(docAlertas,i)
            read(docAlertas,alerta);
            if((alerta.cod_prov = provincia.cod_prov) and (alerta.fecha = Hoy()) and (alerta.baja = false)) then
            begin
                writeln('Dni: ', alerta.dni);
                writeln('Telefono: ', alerta.telefono);
                writeln('Domicilio; ', alerta.domicilio);
            end;
    end;
end;

procedure CantAlertas(sex: char);
var
    cant: Integer;
begin
    cant := 0;
    for i:= 0 to filesize(docAlertas) do
        seek(docAlertas,i)
        read(docAlertas,alerta);
        if(alerta.sex = sex) then
        begin
            cant := cant +1;
        end;
    writeln('Cantidad: ', cant);
end;

procedure ListAlertasRE(min, max: integer);
begin
    for i:= 0 to filesize(docAlertas) do
        seek(docAlertas,i)
        read(docAlertas,alerta);
        edad := CalcularEdad(alerta.birthdate)
        if((edad > min) and (edad < max) and (alerta.baja = false)) then
        begin
            writeln('Dni: ', alerta.dni);
            writeln('Telefono: ', alerta.telefono);
        end;
end;

procedure Baja();
begin
    for i:= 0 to filesize(docAlertas) do
        seek(docAlertas,i)
        read(docAlertas,alerta);
        if(DISTRANCURRIDOS(alerta.fecha, Hoy())) then
        begin
            alerta.baja := true;
            seek(docAlertas,i);
            write(docAlertas,alerta);
        end;
end;

begin
    Abrir();
    repeat
        writeln('Menu');
        opt = readkey();
        case opt of
            '1': CargaIngreso();
            '2': CargaEgreso();
            '3': ListAlertas();
            '4': CantAlertas('M');
            '5': CantAlertas('F');
            '6': ListAlertasRE();
            '7': Baja();
        end;
    until (opt=8);
    Cerrar();
end.
