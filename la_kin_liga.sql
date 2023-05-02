DROP TABLE Equipo CASCADE CONSTRAINTS;
DROP TABLE Jugador CASCADE CONSTRAINTS;
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Entrenador CASCADE CONSTRAINTS;
DROP TABLE Propietario CASCADE CONSTRAINTS;
DROP TABLE Temporada;
DROP TABLE Partido;
DROP TABLE Jornada;
DROP TABLE Usuario;
DROP TABLE ContratoDueno CASCADE CONSTRAINTS;
DROP TABLE ContratoEntrena CASCADE CONSTRAINTS;
DROP TABLE ContratoStaff CASCADE CONSTRAINTS;
DROP TABLE ContratoJugador CASCADE CONSTRAINTS;


CREATE TABLE Equipo (
 	ID_EQUIPO	INTEGER GENERATED ALWAYS AS IDENTITY
					START WITH 1
					INCREMENT BY 1
					NOCACHE
                    PRIMARY KEY,
    NOMBRE		    Varchar2(20),
    COLOR_ESCUDO	Varchar2(15),
    EQUIPACION		Varchar2(15),
    PRESUPUESTO	    Number(9),
		CONSTRAINT EQU_PRESUPUESTO_CK CHECK(PRESUPUESTO <= 200000000)
);

CREATE TABLE Jugador (
    ID_JUG		INTEGER GENERATED ALWAYS AS IDENTITY
					START WITH 1
					INCREMENT BY 1
					NOCACHE
                    PRIMARY KEY,
    PIEMANODOMINANTE	Varchar2(30),
    TAMANOCALZADO	    Number(2),
    P_DRAFT		        Varchar2(15),
 	POSICION		    Varchar2(15) CHECK (POSICION IN 
                            ('Portero','Delantero','Defensa','Centro')),
	TIPO			    Varchar2(10) CHECK (TIPO IN
                            ('Habitual','WildCard')),
    DNI		    Varchar2(9) CHECK (LENGTH(DNI) = 9),
    NOMBRE	    Varchar2(20),
    APELLIDO1	Varchar2(30),
    APELLIDO2	Varchar2(30),
    TELEFONO	Number(9) CHECK (LENGTH(TELEFONO) = 9),
    CORREO	    Varchar2(50)
);

CREATE TABLE Staff (
	ID_STAFF	INTEGER GENERATED ALWAYS AS IDENTITY
                        START WITH 1
                        INCREMENT BY 1
                        NOCACHE
                        PRIMARY KEY,
	DNI		        Varchar2(9) CHECK (LENGTH(DNI) = 9),
    NOMBRE	        Varchar2(20),
    APELLIDO1	    Varchar2(30),
    APELLIDO2	    Varchar2(30),
    TELEFONO	    Number(9) CHECK (LENGTH(TELEFONO) = 9),
    CORREO	        Varchar2(50),
    ROL		        Varchar2(15)
);

CREATE TABLE Entrenador (
	ID_ENT 	    INTEGER GENERATED ALWAYS AS IDENTITY
                        START WITH 1
                        INCREMENT BY 1
                        NOCACHE
                        PRIMARY KEY,
    DNI		        Varchar2(9) CHECK (LENGTH(DNI) = 9),
    NOMBRE	        Varchar2(20),
    APELLIDO1	    Varchar2(30),
    APELLIDO2	    Varchar2(30),
    TELEFONO	    Number(9) CHECK (LENGTH(TELEFONO) = 9),
    CORREO	        Varchar2(50)
);

CREATE TABLE Propietario (
	ID_PRO 	    INTEGER GENERATED ALWAYS AS IDENTITY
                        START WITH 1
                        INCREMENT BY 1
                        NOCACHE
                        PRIMARY KEY,
    DNI		        Varchar2(9) CHECK (LENGTH(DNI) = 9),
    NOMBRE	        Varchar2(20),
    APELLIDO1	    Varchar2(30),
    APELLIDO2	    Varchar2(30),
    TELEFONO        Number(9) CHECK (LENGTH(TELEFONO) = 9),
    CORREO	        Varchar2(50)
);


CREATE TABLE Temporada (
	ID_TEMP		INTEGER GENERATED ALWAYS AS IDENTITY
					START WITH 1
					INCREMENT BY 1
					NOCACHE
                    PRIMARY KEY,
    TIPO		Varchar2(10) CHECK (TIPO IN ('Invierno','Verano')),
    ESTADO	    Varchar2(10) CHECK (ESTADO IN ('Abierto','Cerrado'))
);

CREATE TABLE Partido (
	ID_PARTIDO	INTEGER GENERATED ALWAYS AS IDENTITY
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    PRIMARY KEY,
    HORA		Timestamp,
    GOLES_EQ1	Number(2),
    GOLES_EQ2	Number(2)
);

CREATE TABLE Jornada (
	ID_JOR		INTEGER GENERATED ALWAYS AS IDENTITY
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    PRIMARY KEY,
    NUMERO	    Number(2),
    TIPO        Varchar2(15) CHECK (TIPO IN ('FaseRegular','PlayOffs'))
);

CREATE TABLE Usuario (
    ID_USUARIO	    INTEGER GENERATED ALWAYS AS IDENTITY
                        START WITH 1
                        INCREMENT BY 1
                        NOCACHE
                        PRIMARY KEY,
    NOMBRE	        Varchar2(20),
    CONTRASENA	    Varchar2(50),
    EMAIL		    Varchar2(30),
    TEL		        Number(9) CHECK (LENGTH(TEL) = 9),
    ADMIN		    Varchar2(2) CHECK (ADMIN IN ('SI','NO'))
);

CREATE TABLE ContratoDueno (
    ID_CONDU    INTEGER GENERATED ALWAYS AS IDENTITY
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    PRIMARY KEY,
    ID_PRO      Number(5),
    ID_EQUIPO   Number(5),
    Sueldo      Number(10),
    Fecha_ini   DATE,
    Fecha_fin   DATE,
        CONSTRAINT CONDU_ID_PRO_FK FOREIGN KEY(ID_PRO)
            REFERENCES Propietario (ID_PRO),
        CONSTRAINT CONDU_ID_EQUIPO_FK FOREIGN KEY(ID_EQUIPO)
            REFERENCES Equipo (ID_EQUIPO)
);

CREATE TABLE ContratoEntrena (
    ID_CONEN    INTEGER GENERATED ALWAYS AS IDENTITY
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    PRIMARY KEY,
    ID_ENT      Number(5),
    ID_EQUIPO   Number(5),
    Sueldo      Number(10),
    Fecha_ini   DATE,
    Fecha_fin   DATE,
        CONSTRAINT CONEN_ID_ENT_FK FOREIGN KEY(ID_ENT)
            REFERENCES Entrenador (ID_ENT),
        CONSTRAINT CONEN_ID_EQUIPO_FK FOREIGN KEY(ID_EQUIPO)
            REFERENCES Equipo (ID_EQUIPO)
);

CREATE TABLE ContratoStaff (
    ID_CONST    INTEGER GENERATED ALWAYS AS IDENTITY
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    PRIMARY KEY,
    ID_STAFF    Number(5),
    ID_EQUIPO   Number(5),
    Sueldo      Number(10),
    Fecha_ini   DATE,
    Fecha_fin   DATE,
        CONSTRAINT CONST_ID_STAFF_FK FOREIGN KEY(ID_STAFF)
            REFERENCES Staff (ID_STAFF),
        CONSTRAINT CONST_ID_EQUIPO_FK FOREIGN KEY(ID_EQUIPO)
            REFERENCES Equipo (ID_EQUIPO)
);

CREATE TABLE ContratoJugador (
    ID_CONJU    INTEGER GENERATED ALWAYS AS IDENTITY
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    PRIMARY KEY,
    ID_JUG      Number(5),
    ID_EQUIPO   Number(5),
    Sueldo      Number(10),
    Fecha_ini   DATE,
    Fecha_fin   DATE,
    Clausula    Number(10),
    Dorsal      Number(2),
        CONSTRAINT CONJU_ID_JUG_FK FOREIGN KEY(ID_JUG)
            REFERENCES Jugador (ID_JUG),
        CONSTRAINT CONJU_ID_EQUIPO_FK FOREIGN KEY(ID_EQUIPO)
            REFERENCES Equipo (ID_EQUIPO)
);
