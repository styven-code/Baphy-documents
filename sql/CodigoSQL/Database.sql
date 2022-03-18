CREATE SCHEMA Baphystore;

CREATE TABLE Baphystore.book(
    id SERIAL NOT NULL, 
    title varchar(100) NOT NULL, 
    author varchar(100) NOT NULL, 
    language varchar(20) NOT NULL, 
    edition varchar(50) NOT NULL, 
    isbn int8 NOT NULL, 
    id_category int4 NOT NULL, 
    CONSTRAINT pk_book PRIMARY KEY (id), 
    CONSTRAINT uk_Book UNIQUE (isbn, id_category)
);
COMMENT ON TABLE Baphystore.book IS 'Entidad de producto (Libro)';
COMMENT ON COLUMN Baphystore.book.id IS 'Llave primaria de la entidad libro';
COMMENT ON COLUMN Baphystore.book.title IS 'Título del libro ';
COMMENT ON COLUMN Baphystore.book.author IS 'Autor del libro ';
COMMENT ON COLUMN Baphystore.book.language IS 'Idioma del libro';
COMMENT ON COLUMN Baphystore.book.edition IS 'Editorial del libro ';
COMMENT ON COLUMN Baphystore.book.isbn IS 'isbn o código de barras del libro';
COMMENT ON COLUMN Baphystore.book.id_category IS 'Llave foránea, numero de categoría';

CREATE TABLE Baphystore.category(
    id SERIAL NOT NULL, 
    nama_category varchar(50) NOT NULL, 
    Format varchar(10) NOT NULL, 
    CONSTRAINT pk_category PRIMARY KEY (id)
);
COMMENT ON TABLE Baphystore.category IS 'Entidad de categoría del libro';
COMMENT ON COLUMN Baphystore.category.id IS 'Llave primaria de la entidad categoría';
COMMENT ON COLUMN Baphystore.category.nama_category IS 'NoNombre de la categoría del libro';
COMMENT ON COLUMN Baphystore.category.Format IS 'Formato del libro (físico u online)';

CREATE TABLE Baphystore.client(
    id SERIAL NOT NULL, 
    type_document int4 NOT NULL, 
    document_number int8 NOT NULL, 
    firts_name varchar(50) NOT NULL, 
    second_name varchar(50), 
    first_surname varchar(50) NOT NULL, 
    second_surname varchar(50), 
    data_birth int4 NOT NULL, 
    id_users int4 NOT NULL, 
    CONSTRAINT pk_client PRIMARY KEY (id), 
    CONSTRAINT uk_client UNIQUE (type_document, document_number, id_users)
);
COMMENT ON TABLE Baphystore.client IS 'Entidad de cliente';
COMMENT ON COLUMN Baphystore.client.id IS 'Llave primaria de la entidad de cliente o usuario';
COMMENT ON COLUMN Baphystore.client.type_document IS 'tipo de documento del usuario';
COMMENT ON COLUMN Baphystore.client.document_number IS 'Numero de documento del usurio';
COMMENT ON COLUMN Baphystore.client.firts_name IS 'Primer nombre del usuario';
COMMENT ON COLUMN Baphystore.client.second_name IS 'Segundo nombre del usuario';
COMMENT ON COLUMN Baphystore.client.first_surname IS 'Primer apellido del usuario';
COMMENT ON COLUMN Baphystore.client.second_surname IS 'Segundo apellido del usuario';
COMMENT ON COLUMN Baphystore.client.data_birth IS 'Fecha de nacimiento del usuario';
COMMENT ON COLUMN Baphystore.client.id_users IS 'Llave foranea de la entidad usuarios';

CREATE TABLE Baphystore.client_book(
    id SERIAL NOT NULL, 
    id_client int4 NOT NULL, 
    id_book int4 NOT NULL, 
    stock int2 NOT NULL, 
    price float8 NOT NULL, 
    CONSTRAINT pk_seller_book PRIMARY KEY (id), 
    CONSTRAINT uk_seller_book UNIQUE (id_client, id_book)
);
COMMENT ON TABLE Baphystore.client_book IS 'Entidad de relación producto  - usuario';
COMMENT ON COLUMN Baphystore.client_book.id IS 'Llave primaria de la entidad usuario - libro';
COMMENT ON COLUMN Baphystore.client_book.id_client IS 'Llave primaria de la entidad de cliente';
COMMENT ON COLUMN Baphystore.client_book.id_book IS 'Llave primaria de la entidad de libro';
COMMENT ON COLUMN Baphystore.client_book.stock IS 'Cantidad de existencias de libros de cada usuario';
COMMENT ON COLUMN Baphystore.client_book.price IS 'Precio del libro';

CREATE TABLE Baphystore.Contact(
    id SERIAL NOT NULL, 
    url_whatsapp varchar(1000) NOT NULL, 
    url_facebook varchar(1000) NOT NULL, 
    url_instagram varchar(1000) NOT NULL, 
    id_client int4 NOT NULL, 
    CONSTRAINT pk_Contact PRIMARY KEY (id), 
    CONSTRAINT uk_contact UNIQUE (id_client)
);
COMMENT ON TABLE Baphystore.Contact IS 'Entidad de contacto de los usuarios';
COMMENT ON COLUMN Baphystore.Contact.id IS 'Llave primaria del contacto del usuario';
COMMENT ON COLUMN Baphystore.Contact.url_whatsapp IS 'Link o dirección url del WhatsApp del usuario';
COMMENT ON COLUMN Baphystore.Contact.url_facebook IS 'Link o dirección url del Facebook del usuario';
COMMENT ON COLUMN Baphystore.Contact.url_instagram IS 'Link o dirección url del Instagram del usuario';
COMMENT ON COLUMN Baphystore.Contact.id_client IS 'Llave foránea, id de cliente';

CREATE TABLE Baphystore.description(
    id SERIAL NOT NULL, 
    edition_year int4 NOT NULL, 
    number_page int4 NOT NULL, 
    condition varchar(10) NOT NULL, 
    size varchar(10) NOT NULL, 
    weight varchar(10), 
    review varchar(1000), 
    id_book int4 NOT NULL, 
    CONSTRAINT pk_description PRIMARY KEY (id), 
    CONSTRAINT uk_description UNIQUE (id_book)
);
COMMENT ON TABLE Baphystore.description IS 'Entidad de descripción del libro';
COMMENT ON COLUMN Baphystore.description.id IS 'Llave primaria de la entidad descripción';
COMMENT ON COLUMN Baphystore.description.edition_year IS 'Año de edición del libro';
COMMENT ON COLUMN Baphystore.description.number_page IS 'Número de páginas que contiene el libro';
COMMENT ON COLUMN Baphystore.description."condition" IS 'Condición del libro (nuevo - usado)';
COMMENT ON COLUMN Baphystore.description."size" IS 'Tamaño del libro (cm, GB, KB)';
COMMENT ON COLUMN Baphystore.description.weight IS 'Peso del libro';
COMMENT ON COLUMN Baphystore.description.review IS 'Reseña o sinopsis del libro';
COMMENT ON COLUMN Baphystore.description.id_book IS 'Llave foránea, numero de libro';

CREATE TABLE Baphystore.document_type(
    id SERIAL NOT NULL, 
    initials varchar(10) NOT NULL, 
    document_name varchar(50) NOT NULL, 
    CONSTRAINT pk_document_type PRIMARY KEY (id), 
    CONSTRAINT uk_document_type UNIQUE (initials, document_name)
);
COMMENT ON TABLE Baphystore.document_type IS 'Entidad Tipo de documento';
COMMENT ON COLUMN Baphystore.document_type.id IS 'Llave primaria de la entidad tipo de documento';
COMMENT ON COLUMN Baphystore.document_type.initials IS 'Siglas de los tipos de documentos de identidad (CC., Ti, Ni, etc.)';
COMMENT ON COLUMN Baphystore.document_type.document_name IS 'Nombre del documento de identidad de los usuarios (Cedula de ciudadanía, Tarjeta de identidad, Pasaporte, entre otros)';

CREATE TABLE Baphystore.users(
    id SERIAL NOT NULL, 
    email varchar(100) NOT NULL, 
    password varchar(100) NOT NULL, 
    number_phone varchar(11) NOT NULL, 
    address varchar(150) NOT NULL, 
    CONSTRAINT pk_user PRIMARY KEY (id), 
    CONSTRAINT uk_user UNIQUE (email, number_phone)
);
COMMENT ON TABLE Baphystore.users IS 'Entidad de Usuario';
COMMENT ON COLUMN Baphystore.users.id IS 'Llave primaria de la entidad usuario';
COMMENT ON COLUMN Baphystore.users.email IS 'Correo del usuario (@gmail.com, @outlook.com, etc.)';
COMMENT ON COLUMN Baphystore.users.password IS 'Contraseña del usuario';
COMMENT ON COLUMN Baphystore.users.number_phone IS 'Numero de telefono o contacto del usuario';
COMMENT ON COLUMN Baphystore.users.address IS 'Direccion o Ubicacion del usuario';

ALTER TABLE Baphystore.description ADD CONSTRAINT fk_book_desc FOREIGN KEY (id_book) REFERENCES Baphystore.book (id);
ALTER TABLE Baphystore.book ADD CONSTRAINT fk_category_book FOREIGN KEY (id_category) REFERENCES Baphystore.category (id);
ALTER TABLE Baphystore.Contact ADD CONSTRAINT fk_client_contact FOREIGN KEY (id_client) REFERENCES Baphystore.client (id);
ALTER TABLE Baphystore.client_book ADD CONSTRAINT fk_cliente_clibook FOREIGN KEY (id_client) REFERENCES Baphystore.client (id);
ALTER TABLE Baphystore.client ADD CONSTRAINT fk_document_client FOREIGN KEY (type_document) REFERENCES Baphystore.document_type (id);
ALTER TABLE Baphystore.client_book ADD CONSTRAINT fk_sebook_book FOREIGN KEY (id_book) REFERENCES Baphystore.book (id);
ALTER TABLE Baphystore.client ADD CONSTRAINT fk_users_client FOREIGN KEY (id_users) REFERENCES Baphystore.users (id);
