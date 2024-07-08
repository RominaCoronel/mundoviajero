CREATE DATABASE mundoviajero;

USE mundoviajero;

CREATE TABLE destinos (
	id_destino INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(255) NOT NULL UNIQUE,
	pais varchar(255) NOT NULL,
	descripcion text NOT NULL,
    precio DECIMAL(10,2) NOT NULL
    );

CREATE TABLE actividades (
	id_actividad INT NOT NULL PRIMARY KEY,
	id_destino INT NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion text NOT NULL,
    FOREIGN KEY (id_destino) REFERENCES destinos(id_destino)
    );

CREATE TABLE destinos_nacionales (
	id_destino_nacional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_destino INT NOT NULL,
	estado varchar(50) NOT NULL,
    tipo_clima varchar(50) NOT NULL,
    FOREIGN KEY (id_destino) REFERENCES destinos(id_destino)
    );
    
    CREATE TABLE destinos_internacionales (
	id_destino_internacional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_destino INT NOT NULL,
    idioma_oficial VARCHAR(255),
    requisitos_visa text NOT NULL,
    FOREIGN KEY (id_destino) REFERENCES destinos(id_destino)
    );
    
INSERT INTO Destinos (id_destino, nombre, pais, descripcion, precio)
VALUES 
(1, 'Cancún', 'México', 'Hermosas playas caribeñas y sitios arqueológicos mayas.', 710815.00),
(2, 'Roma', 'Italia', 'Capital histórica de Italia con sus ruinas antiguas y el Vaticano.', 1371299.00),
(3, 'París', 'Francia', 'Ciudad del amor con la Torre Eiffel y el Louvre.', 1551788.00),
(4, 'Río de Janeiro', 'Brasil', 'Famoso por sus playas como Copacabana e Ipanema y el Cristo Redentor.', 259202.00),
(5, 'Miami', 'Estados Unidos', 'Destino de playa y compras en Florida.', 818541.00),
(6, 'Barcelona', 'España', 'Ciudad modernista con la Sagrada Familia y el Parque Güell.', 1117878.00),
(7, 'Bariloche', 'Argentina', 'Ciudad de montaña junto al lago Nahuel Huapi.', 61108.00),
(8, 'Mendoza', 'Argentina', 'Región vinícola y montañosa.', 31788.00),
(9, 'Salta', 'Argentina', 'Ciudad colonial en el noroeste argentino.', 61108.00),
(10, 'Jujuy', 'Argentina', 'Provincia con paisajes de montaña y colores únicos.', 52980.00),
(11, 'Córdoba', 'Argentina', 'Ciudad universitaria y cultural en el centro del país.', 31788.00),
(12, 'Cataratas del Iguazú', 'Argentina', 'Impresionante conjunto de cascadas en la selva misionera.', 51214.00);

INSERT INTO Destinos_Nacionales (id_destino_nacional, id_destino, estado, tipo_clima)
VALUES 
    (1, 7, 'Río Negro','Templado frío'),
    (2, 8, 'Mendoza','Desértico'),
    (3, 9, 'Salta','Subtropical'),
    (4, 10, 'Jujuy', 'Árido'),
    (5, 11, 'Córdoba', 'Templado'),
    (6, 12, 'Misiones','Tropical');

INSERT INTO Destinos_Internacionales (id_destino_internacional, id_destino, idioma_oficial, requisitos_visa)
VALUES 
    (1, 2, 'Italiano', 'No se requiere visa para ciudadanos de la Union Europea.'),
    (2, 3, 'Francés', 'No se requiere visa para ciudadanos de la Union Europea.'),
    (3, 5, 'Inglés', 'No se requiere visa para ciudadanos de muchos países.'),
    (4, 6, 'Español', 'No se requiere visa para ciudadanos de la Union Europea.'),
    (5, 5, 'Inglés', 'No se requiere visa para ciudadanos de muchos países.'),
    (6, 6, 'Español', 'No se requiere visa para ciudadanos de la Union Europea.');

INSERT INTO Actividades (id_actividad, id_destino, nombre, descripcion)
VALUES 
    (1, 7, 'Esquí en Cerro Catedral', 'Disfruta de las pistas de esquí más famosas de Sudamérica.'),
    (2, 8, 'Tour de bodegas', 'Recorre las mejores bodegas y viñedos de la región vitivinícola de Argentina.'),
    (3, 9, 'City tour por Salta', 'Visita los principales monumentos y plazas de la ciudad de Salta.'),
    (4, 10, 'Trekking en Quebrada de Humahuaca', 'Descubre paisajes únicos y coloridos en una caminata memorable.'),
    (5, 11, 'Visita a la Manzana Jesuítica', 'Explora la historia colonial de Córdoba en este recorrido cultural.'),
    (6, 12, 'Paseo en lancha por las Cataratas del Iguazú', 'Acércate a las cataratas y disfruta de vistas impresionantes.'),
	(7, 1, 'Tour por las Ruinas Mayas', 'Explora las antiguas ruinas mayas en Cancún y descubre su fascinante historia.'),
    (8, 2, 'Visita al Coliseo Romano', 'Recorre uno de los monumentos más emblemáticos de la antigua Roma.'),
    (9, 3, 'Tour por la Torre Eiffel', 'Sube a uno de los símbolos más reconocibles de París y disfruta de vistas panorámicas.'),
    (10, 4, 'Visita al Cristo Redentor', 'Disfruta de vistas panorámicas de Río de Janeiro desde uno de sus símbolos más icónicos.'),
    (11, 5, 'Recorrido por South Beach', 'Disfruta de las playas y la vida nocturna de Miami en el famoso distrito de South Beach.'),
    (12, 6, 'Visita a la Sagrada Familia', 'Descubre la impresionante obra arquitectónica de Antoni Gaudí en Barcelona.');