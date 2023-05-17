SET SERVEROUTPUT ON;
BEGIN
CALENDARIO.GENERAR_CALENDARIO();
END;

DECLARE 
C_CURSOR SYS_REFCURSOR;
C_ID_PARTIDO PARTIDO.ID_PARTIDO%TYPE;
C_ID_JORNADA JONADA.ID_JOR%TYPE;
C_ID_GANADOR PARTIDO.ID_GANADOR%TYPE;
C_ID_PERDEDOR PARTIDO.ID_PERDEDOR%TYPE;
C_DIA_JORNADA DATE:= TO_DATE('01/01/2024','DD/MM/YYYY');
  
BEGIN
CALENDARIO.GENERAR_CALENDARIO(c_cursor);
LOOP
    FETCH c_cursor INTO C_Id_Jornada, C_Id_Partido, C_ID_GANADOR, C_ID_PERDEDOR;
    EXIT WHEN c_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( 'ID_PARTIDO: '|| C_ID_PARTIDO ||', ID_JORNADA: ' 
    || C_ID_JORNADA || ', Equipo1: ' || C_ID_GANADOR || ', Equipo2: '|| C_ID_PERDEDOR ||'DIA'||C_DIA_JORNADA|| '. ');
  END LOOP;
  
  CLOSE c_cursor;
END;
