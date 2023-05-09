/*Kings League equipo 2*/
/*Trigger verificar que cada equipo solo puede jugar una vez por jornada*/
CREATE OR REPLACE TRIGGER tr_partido_evitar_repetidos
BEFORE INSERT ON Partido
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Partido
    WHERE ID_JOR = :NEW.ID_JOR
        AND (ID_Ganador = :NEW.ID_Ganador OR ID_Perdedor = :NEW.ID_Ganador
             OR ID_Ganador = :NEW.ID_Perdedor OR ID_Perdedor = :NEW.ID_Perdedor);

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El mismo equipo no puede jugar dos veces en la misma jornada.');
    END IF;
END;

select * from partido;

INSERT INTO Partido VALUES (DEFAULT,4, '16:00', 3, 1,1,5);

/*Al insertar un partdio que ya ha jugado su partido en una jornada salta el error
Error que empieza en la l�nea: 20 del comando :
INSERT INTO Partido VALUES (DEFAULT,4, '16:00', 3, 1,1,5)
Informe de error -
ORA-20001: El mismo equipo no puede jugar dos veces en la misma jornada.
*/
