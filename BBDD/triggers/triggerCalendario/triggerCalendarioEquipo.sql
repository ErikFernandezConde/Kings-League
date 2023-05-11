/*Kings League equipo 2*/
/*Trigger para el calendario sobre el equipo*/

    /*Trigger modificar equipo*/
    CREATE OR REPLACE TRIGGER tr_cerrar_temporada_equipo
    
    /* Indica que el trigger se activar� antes de que se realice una actualizaci�n en la tabla "Equipo". */
    BEFORE UPDATE ON Equipo
    
    /* Indica que el trigger se ejecutar� por cada fila afectada por la actualizaci�n. */
    FOR EACH ROW
    
    /* Declara una variable llamada "estado_temporada" con el mismo tipo de datos que el campo "ESTADO" de la tabla "Temporada". */
    DECLARE
        estado_temporada Temporada.ESTADO%TYPE;
    BEGIN
    
        /* Asigna el valor del campo "ESTADO" de la fila con ID_TEMP=1 en la tabla "Temporada" a la variable "estado_temporada". */
        SELECT ESTADO INTO estado_temporada FROM Temporada WHERE ID_TEMP = 1;
    
        /* Comprueba si la variable "estado_temporada" es igual a 'Cerrado'. */
        IF estado_temporada = 'Cerrado' THEN
    
            /* Si la temporada est� cerrada, se generar� un error de aplicaci�n con el mensaje 'No se pueden actualizar equipos durante una temporada cerrada.'. */
            RAISE_APPLICATION_ERROR(-20001, 'No se pueden actualizar equipos durante una temporada cerrada.');
    
        END IF;
    
    /* Cierra la estructura de control IF. */
    END;
    
    /* Cierra el bloque de c�digo del trigger. */
    
    