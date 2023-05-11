/*Kings League equipo 2*/
/*Trigger que comprueba que al cerrar la temporada cada equipo deba tener
un minimo de  8 jugadores*/

-- Creaci�n del trigger trg_verif_jugadores
CREATE OR REPLACE TRIGGER trg_verif_jugadores
BEFORE UPDATE OF ESTADO ON Temporada -- Se dispara antes de que se actualice la columna ESTADO en la tabla Temporada
FOR EACH ROW -- Se ejecuta por cada fila afectada

DECLARE
    num_jugadores INTEGER; -- Variable para almacenar el n�mero de jugadores de cada equipo

BEGIN

    -- Verificar que todos los equipos tienen al menos 8 jugadores
    FOR equipo IN (SELECT ID_EQUIPO FROM Equipo) -- Por cada equipo en la tabla Equipo
    LOOP
        -- Contar el n�mero de jugadores que tiene el equipo actual
        SELECT COUNT(*) INTO num_jugadores
        FROM ContratoJugador
        WHERE ID_EQUIPO = equipo.ID_EQUIPO;

        -- Si el equipo actual tiene menos de 8 jugadores, lanzar un error
        IF num_jugadores < 8 THEN
            RAISE_APPLICATION_ERROR(-20001, 'El equipo ' || equipo.ID_EQUIPO || ' no tiene al menos 8 jugadores');
        END IF;
    END LOOP;
    
    -- Verificar que el estado de la temporada no se actualice a "Cerrado" si hay equipos con menos de 8 jugadores
    IF :NEW.ESTADO = 'Cerrado' THEN -- Si se intenta actualizar el estado a 'Cerrado'
        FOR equipo IN (SELECT ID_EQUIPO FROM Equipo) -- Por cada equipo en la tabla Equipo
        LOOP
            -- Contar el n�mero de jugadores que tiene el equipo actual
            SELECT COUNT(*) INTO num_jugadores
            FROM ContratoJugador
            WHERE ID_EQUIPO = equipo.ID_EQUIPO;

            -- Si el equipo actual tiene menos de 8 jugadores, lanzar un error
            IF num_jugadores < 8 THEN
                RAISE_APPLICATION_ERROR(-20002, 'No se puede cerrar la temporada porque el equipo ' || equipo.ID_EQUIPO || ' no tiene al menos 8 jugadores');
            END IF;
        END LOOP;
    END IF;

END;