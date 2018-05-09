vinculacion('Yolanda','TCO').
vinculacion('Miguel','HC').
vinculacion('Joaquin','TCO').
vinculacion('Alejandro','MTO').
vinculacion('Pedro','HC').
vinculacion('Juliana','TCO').
vinculacion('Laura','HC').
vinculacion('Ismael','MTO').
vinculacion('David','MTO').
vinculacion('Liliana','TCO').
vinculacion('Jose','TCO').
vinculacion('Wilson','HC').
vinculacion('Isabel','MTO').
vinculacion('Adriana','MTO').
vinculacion('Lucia','TCO').
vinculacion('Cristian','TCO').
vinculacion('Osvaldo','HC').
vinculacion('Sofia','HC').
vinculacion('Andrea','MTO').
vinculacion('Diana','TCO').
vinculacion('Martin','TCO').
vinculacion('Viviana','HC').
vinculacion('Carlos','MTO').
vinculacion('Tatiana','MTO').
vinculacion('Jorge','HC').

%Tipo de vinculacion y las horas pagadas a la semana
horasVinculacion('TCO',35).
horasVinculacion('HC',16).
horasVinculacion('MTO',22).


vinculacionCategoria('TCO','Asistente').
vinculacionCategoria('TCO','Tecnico').
vinculacionCategoria('TCO','Administrador').
vinculacionCategoria('HC','Asistente').
vinculacionCategoria('HC','Tecnico').
vinculacionCategoria('HC','Administrador').
vinculacionCategoria('MTO','Asistente').
vinculacionCategoria('MTO','Tecnico').
vinculacionCategoria('MTO','Administrador').

%Tipo de vinculacion, categoria y valor de la hora
valorHoraCategoria('TCO','Asistente',10000).
valorHoraCategoria('TCO','Tecnico',25000).
valorHoraCategoria('TCO','Administrador',50000).
valorHoraCategoria('HC','Asistente',8500).
valorHoraCategoria('HC','Tecnico',12000).
valorHoraCategoria('HC','Administrador',20000).
valorHoraCategoria('MTO','Asistente',9300).
valorHoraCategoria('MTO','Tecnico',17900).
valorHoraCategoria('MTO','Administrativo',36000).


categoria('Yolanda','Asistente').
categoria('Miguel','Tecnico').
categoria('Joaquin','Administrador').
categoria('Alejandro','Tecnico').
categoria('Pedro','Asistente').
categoria('Juliana','Administrador').
categoria('Laura','Asistente').
categoria('Ismael','Tecnico').
categoria('David','Adlinistrador').
categoria('Liliana','Tecnico').
categoria('Jose','Asistente').
categoria('Wilson','Administrador').
categoria('Isabel','Asistente').
categoria('Adriana','Tecnico').
categoria('Lucia','Asistente').
categoria('Cristian','Administrador').
categoria('Osvaldo','Asistente').
categoria('Sofia','Tecnico').
categoria('Andrea','Administrador').
categoria('Diana','Tecnico').
categoria('Martin','Asistente').
categoria('Viviana','Tecnico').
categoria('Carlos','Asistente').
categoria('Tatiana','Administrador').
categoria('Jorge','Asistente').



%descuento por salud y pension
desPension('MTO',8).
desPension('TCO',8).
desSalud('MTO',4).
desSalud('TCO',4).

%Calculo de la nomina individual
nominaEmpleadoIn(A,B):-vinculacion(A,C),horasVinculacion(C,D),categoria(A,P),valorHoraCategoria(C,P,E),B is round((D*E)).
descuentoEmpPen(A,C):-nominaEmpleadoIn(A,B),vinculacion(A,D), desPension(D,H),C is round((B)*(H/100)).
descuentoEmpSal(A,C):-nominaEmpleadoIn(A,B),vinculacion(A,D), desSalud(D,H),C is round((B)*(H/100)).
descuentoTot(A,B):-descuentoEmpPen(A,C),descuentoEmpSal(A,D),B is (C+D).
nominaDes(A,K):-nominaEmpleadoIn(A,B),descuentoTot(A,C),K is (B-C).

sumar([],0).
sumar([ X | Xs ],R) :- sumar(Xs, R1), R is R1+X.

%Calculo de la nomina general
nominaNormal(Total) :- findall(B, (vinculacion(A,C),horasVinculacion(C,D),categoria(A,P),valorHoraCategoria(C,P,E), B is round((D*E))), Lista), sumar(Lista,Total).
nominaConDes(Total) :- findall(B, (nominaEmpleadoIn(A,B),descuentoTot(A,C), B is round(((B-C)))), Lista), sumar(Lista,Total).
descuentoTotales(Total):- findall(B, (vinculacion(A,B),descuentoTot(A,C),B is round(C)), Lista), sumar(Lista,Total).
