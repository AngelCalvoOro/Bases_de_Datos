-- EJERCICIO 1
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--Excepciones Oracle PREDEFINIDAS
Declare
      LC$Cadena varchar2(10) ;
Begin
      LC$Cadena := rpad( ' ', 30) ;
Exception
      when VALUE_ERROR then
          dbms_output.put_line( 'Cadena de caracteres demasiado larga') ;
End ; 


-- EJERCICIO 2
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--PRAGMA: Excepciones Oracle personalizadas
/*
Puede asociar un código de error de Oracle con sus propias variables de excepción
utilizando la palabra clave PRAGMA EXCEPTION_INIT,
como parte de la sección declarativa de la siguiente manera:
*/

Declare
      LC$Cadena varchar2(10) ;
      LE$mas_long exception ;
      pragma exception_init( LE$mas_long, -6502 ) ;
Begin
      LC$Cadena := rpad( ' ', 30) ;
Exception
      when LE$mas_long then
          dbms_output.put_line( 'Cadena de caracteres demasiado larga') ;
End ; 

-- EJERCICIO 3
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/

Declare
       LC$C1    varchar2(20) := 'Frase larguisima';
       LC$Cadena varchar2(10) ;
       LE$mas_long exception ;
       pragma exception_init(LE$mas_long, -6502) ;
Begin
      Begin
          LC$Cadena := LC$C1;
      Exception
        when LE$mas_long then
            LC$Cadena := Substr( LC$C1, 1, 10 ) ;
      End ;
      -- Sacar por pantalla el contenido de la variable LC$Cadena 
      dbms_output.put_line(LC$Cadena) ;
End ;

-- EJERCICIO 4
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--EXCEPCIONES PROPIAS
--RAISE
Declare
      LN$I number := 0 ;
      LE$Fin exception ;
Begin
      Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
        If LN$I > 2 Then
           RAISE LE$Fin ;
       End if ;
     End loop ;
Exception
     When LE$Fin Then
         Null ;  --No hacer nada
End ;

-- EJERCICIO 5
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
--EXCEPCIONES PROPIAS
--RAISE
Declare
      LN$I number := 0 ;
      LE$Fin exception ;
Begin
      Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
        If LN$I > 20 Then
           -- Provocar la excepcion LE$Fin
           RAISE LE$Fin ;
        End if ;
      End loop ;
Exception
     When LE$Fin Then
         Null ;  --No hacer nada
End ;

