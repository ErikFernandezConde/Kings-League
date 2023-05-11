/*Kings League equipo 2*/
/*Trigger para el calendario sobre el jugador*/

    /*Trigger modificar jugador*/
    CREATE OR REPLACE TRIGGER tr_cerrar_temporada_jugador
    
    /* Se indica que el trigger se ejecutar� antes de una operaci�n de actualizaci�n en la tabla Jugador. */
    
    BEFORE UPDATE ON Jugador
    
    /* Se especifica que el trigger se ejecutar� una vez por cada fila actualizada. */
    
    FOR EACH ROW
    
    /* Se declara una variable que almacenar� el estado de la temporada. */
    
    DECLARE
    estado_temporada Temporada.ESTADO%TYPE;
    BEGIN
    /* Se selecciona el estado de la temporada almacenada en la tabla Temporada. */
    
    SELECT ESTADO INTO estado_temporada FROM Temporada WHERE ID_TEMP = 1;
    
    /* Se comprueba si el estado de la temporada es "Cerrado". Si es as�, se lanza un error que indica que no se pueden actualizar jugadores. */
    
    IF estado_temporada = 'Cerrado' THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se pueden actualizar jugadores durante una temporada cerrada.');
    END IF;
    /* Este es el final del c�digo para crear el trigger. */
    
    END;