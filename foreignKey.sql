!-- This SQL script creates a table named "comenzi" with a foreign key constraint

CREATE TABLE comenzi (
    id_comanda INT PRIMARY KEY,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES clienti(id_client)
);

