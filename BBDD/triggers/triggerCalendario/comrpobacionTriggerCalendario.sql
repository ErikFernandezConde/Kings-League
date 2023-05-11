/*Kings League equipo 2*/
/*Comprobacion triggers del calendario*/

    /*Modificar equipo*/
    UPDATE Temporada SET ESTADO = 'Cerrado' WHERE ID_TEMP = 1;
    /*Cerramos la temporada*/
    UPDATE Equipo SET PRESUPUESTO = 3000000 WHERE ID_EQUIPO = 1;
    /*Al hacer el update de equipo podemos ver como salta el error*/
    
    /*
    UPDATE Equipo SET PRESUPUESTO = 3000000 WHERE ID_EQUIPO = 1
    Informe de error -
    ORA-20001: No se pueden actualizar equipos durante una temporada cerrada.
    ORA-06512: en "EQDAW02.TR_CERRAR_TEMPORADA", l�nea 6
    ORA-04088: error durante la ejecuci�n del disparador 'EQDAW02.TR_CERRAR_TEMPORADA'
    */

    /*Modificar jugador*/
    UPDATE Jugador SET TELEFONO = '123456789' WHERE ID_JUG = 1;
    /*Al hacer el update de equipo podemos ver como salta el error*/
    
    
    /*Error que empieza en la l�nea: 59 del comando :
    UPDATE Jugador SET TELEFONO = '123456789' WHERE ID_JUG = 1
    Informe de error -
    ORA-20001: No se pueden actualizar jugadores durante una temporada cerrada.
    ORA-06512: en "EQDAW02.TR_CERRAR_TEMPORADA_JUGADOR", l�nea 6
    ORA-04088: error durante la ejecuci�n del disparador 'EQDAW02.TR_CERRAR_TEMPORADA_JUGADOR'*/


