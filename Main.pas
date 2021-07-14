program tpayed2;
uses crt;

var
option:char;
access:boolean;
empresas: array[0..10,0..5] of string;
ciudades: array[0..10,0..1] of string;
clientes: array[0..10,0..1] of string;
proyectos: array[0..10,0..4] of string;
//productos = array[0..10,0] of string;

contEmpresas, contCiudades, contClientes, contProyectos{, contProductos}:integer; 

procedure altaEmpresa();
	begin
	writeln('Ingrese el codigo de la empresa.');
	readln(empresas[contEmpresas][0]);
	writeln('Ingrese el nombre de la empresa.');
	readln(empresas[contEmpresas][1]);
	writeln('Ingrese la direccion de la empresa.');
	readln(empresas[contEmpresas][2]);
	writeln('Ingrese el mail de la empresa.');
	readln(empresas[contEmpresas][3]);
	writeln('Ingrese el telefono de la empresa.');
	readln(empresas[contEmpresas][4]);
	writeln('Ingrese el codigo de la ciudad');
	readln(empresas[contEmpresas][5]);
	writeln('Empresa añadida exitosamente, pulse cualquier tecla para volver al menu anterior.');
	readKey();
	end;

procedure altaCliente();
	begin
		writeln('Ingrese el nombre de la ciudad.');
		readln(clientes[contClientes][0]);
		writeln('Ingrese el mail de la empresa.');
		readln(clientes[contClientes][1]);
		writeln('Cliente añadido exitosamente, pulse cualquier tecla para volver al menu anterior.');
		readKey();
	end;

procedure altaCiudad();
	begin
		writeln('Ingrese el codigo de la ciudad.');
		readln(ciudades[contCiudades][0]);
		writeln('Ingrese el nombre de la ciudad.');
		readln(ciudades[contCiudades][1]);
		writeln('Ciudad añadida exitosamente, pulse cualquier tecla para volver al menu anterior.');
		contCiudades := contCiudades+1;
		readKey();
	end;

procedure altaProyecto();
	begin
		writeln('Ingrese el codigo del proyecto.');
		readln(proyectos[contProyectos][0]);
		writeln('Ingrese el codigo de la empresa.');
		readln(proyectos[contProyectos][1]);
		writeln('Ingrese la etapa del proyecto.'+#13+#10+'P. Preventa'+#13+#10+'O. Obra'+#13+#10+'T. Terminado');
		readln(proyectos[contProyectos][2]);
		writeln('Ingrese el tipo de proyecto.'+#13+#10+'C. Casa'+#13+#10+'D. Departamento'+#13+#10+'O. Oficina'+#13+#10+'L. Lotes');
		readln(proyectos[contProyectos][3]);
		writeln('Ingrese el codigo de la ciudad.');
		readln(proyectos[contProyectos][4]);
		writeln('Proyecto añadido exitosamente, pulse cualquier tecla para volver al menu anterior.');
		contProyectos:=contProyectos+1;
		readKey();
	end;

procedure altaProducto();
	begin
		//Unused
	end;

procedure getProyecto(tipo:char); //CAMBIAR!
	begin
// 		writeln('Proyecto: ', p.COD_PRO);
// 		writeln('Etapa: Preventa');
// 		writeln('Etapa: Obra');
// 		writeln('Etapa: Terminado');
// 		writeln('TIpo: Casa');
// 		writeln('TIpo: Departamento');
// 		writeln('TIpo: Oficina');
// 		writeln('TIpo: Lote');
// 		writeln('Ciudad: ', c.Nombre);
// 		writeln('Empresa: ', e.Nombre);
	end;

procedure showEmpresa();
	var
		opt: char;
begin
	repeat
		ClrScr();
	    writeln('MENU EMPRESAS DESARROLLADORAS:'+#13+#10+'1. Alta de CIUDADES '+#13+#10+'2. Alta de EMPRESAS '+#13+#10+'3. Alta de PROYECTOS'+#13+#10+'4. Alta de Productos '+#13+#10+'0. Volver al menú principal');
	    repeat
	    	opt := readKey();
	    until((opt = '1') or (opt = '2') or (opt = '3') or (opt = '4') or (opt = '0'));
	    case opt of
	    	'1': altaCiudad();
	    	'2': altaEmpresa();
	    	'3': altaProyecto();
	    	'4': altaProducto();
	    end;
	until(opt = '0');
end;

procedure showCliente();
	var
		opt, tipo: char;
begin
	ClrScr();
	writeln('MENU CLIENTES:'+#13+#10+'1. Alta de Clientes '+#13+#10+'2. Consulta de PROYECTOS'+#13+#10+'0. Volver al menu principal');
	repeat
        opt := readKey();
    until ((opt = '1') or (opt = '2') or (opt = '0'));
    case opt of
    '1': altaCliente();
    '2':
    	begin
    		ClrScr();
    	 	writeln('Ingrese el tipo de proyecto que desae buscar.'+#13+#10+'C. Casa'+#13+#10+'D. Departamento'+#13+#10+'O. Oficina'+#13+#10+'L. Lotes');
    	 	tipo := readKey();
    	 	getProyecto(tipo);
    	end;
    end;
end;

function login(tipo: char): boolean;
var
  attempts: integer;
  clave, secret1, secret2 : string;
  c:char;
begin
  attempts := 3;
  clave := '';
  secret1 := 'admin123';
  secret2 := 'user123';
  while (attempts > 0) do
    begin
      attempts := (attempts-1);
      ClrScr();
      writeln('Ingrese la clave. ', attempts+1, ' intentos restantes');
      repeat
        c := readkey();
        ClrScr();
        writeln('Ingrese la clave. ', attempts+1, ' intentos restantes');
        if(c = #08) then
        	begin
	          delete(clave,length(clave),1);
	          for contEmpresas := 1 to length(clave) do
	            write('*');
        	end
        else
	        begin 
	        	if (c <> #13) then
	        	begin
		            clave := clave + c;
		            for contEmpresas := 1 to length(clave) do
		              write('*')
		        end;
	        end;
      until(c = #13);
      if (tipo = '1') then
      begin
        if (clave = secret1) then
          exit(true)
        else
       	  clave := '';
          writeln('Clave incorrecta');
      end;
      if (tipo = '2') then
      begin
        if (clave = secret2) then
          exit(true)
        else
          clave := '';
          writeln('Clave incorrecta');
      end;
    end;
end;

BEGIN
	contProyectos := 0;
	contCiudades := 0;
	contClientes := 0;
	contEmpresas := 0;
    repeat
	   //menu principal
		repeat
          writeln('Menu: '+#13+#10+'1. Empresas.'+#13+#10+'2. Clientes.'+#13+#10+'0. Salir'+#13+#10+'');
          option := readKey();
		until ((option = '1') or (option = '2') or (option = '0'));
		if (option <> '0') then
		begin
		    //login
		    access := login(option);
		    //mostrar submenu
		    if (access) then
		    begin
		       case option of
		            '1': showEmpresa();
		            '2': showCliente();
		       end;
		    end;
		end;
	until (option = '0');
END.