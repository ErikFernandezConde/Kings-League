/*Kings League equipo 2*/
/*Comprobaciones para el trigger de maximo de jugadores*/

/*COMPROBACIONES*/
/*
SELECT * FROM ContratosJugador;
SELECT * FROM JUGADORES;
SELECT * FROM EQUIPOS;
*/
    /*Comprobacion de habituales*/
    INSERT INTO ContratosJugador VALUES (DEFAULT,10,1,10000000,TO_DATE('12/09/2022', 'DD/MM/YYYY'),TO_DATE('10/10/2022', 'DD/MM/YYYY'),1000000,12); --A la hora de insertar el noveno jugadro habitual salta el trigger

    /*Respuesta a la hora de la ultima insercion:
    Error que empieza en la línea: 73 del comando :
    INSERT INTO ContratosJugador VALUES (DEFAULT,10,1,10000000,TO_DATE('12/09/2022', 'DD/MM/YYYY'),TO_DATE('10/10/2022', 'DD/MM/YYYY'),1000000,12)
    Informe de error -
    ORA-20000: NO SE PUEDEN TENER MAS DE 8 JUGADORES DE TIPO HABITUAL
    ORA-06512: en "EQDAW02.MAX_JUGADORES", línea 28
    ORA-04088: error durante la ejecución del disparador 'EQDAW02.MAX_JUGADORES'
    */

    /*Comprobacion de wild cards*/
    INSERT INTO ContratosJugador VALUES (DEFAULT,133,1,10000000,TO_DATE('12/09/2022', 'DD/MM/YYYY'),TO_DATE('10/10/2022', 'DD/MM/YYYY'),1000000,12);--A la hora de insertar el tercer jugadro wildcard salta el trigger
    
    /*Respuesta a la hora de la ultima insercion:
    Error que empieza en la línea: 77 del comando :
    INSERT INTO ContratosJugador VALUES (DEFAULT,133,1,10000000,TO_DATE('12/09/2022', 'DD/MM/YYYY'),TO_DATE('10/10/2022', 'DD/MM/YYYY'),1000000,12)
    Informe de error -
    ORA-20001: NO SE PUEDEN TENER MAS DE 2 JUGADORES DE TIPO WILDCARD
    ORA-06512: en "EQDAW02.MAX_JUGADORES", línea 33
    ORA-04088: error durante la ejecución del disparador 'EQDAW02.MAX_JUGADORES'
    */  
    
    UPDATE ContratosJugador
    SET ID_EQUIPO = 1
    WHERE ID_CONJU = 14;
    
    /*
    Informe de error -
    ORA-04091: la tabla EQDAW02.CONTRATOSJUGADOR está mutando, puede que el disparador/la función no puedan verla
    ORA-06512: en "EQDAW02.TRG_CONTRATOSJUGADOR", línea 5
    ORA-04088: error durante la ejecución del disparador 'EQDAW02.TRG_CONTRATOSJUGADOR'
    */
