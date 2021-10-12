--
--  Class: Distributeur
--
CREATE TABLE Distributeur (
    id_distributeur VARCHAR(50),
    nom_distributeur VARCHAR(30),

    PRIMARY KEY (id_distributeur)
);

INSERT INTO Distributeur VALUES ('carr15432', 'Carreclerc');


--
--  Class: Commande
--
CREATE TABLE Commande (
    id_commande INT AUTO_INCREMENT,
    prixHT_commande FLOAT,
    conditionnement_commande VARCHAR(50),
    quantite_commande INT,
    dateConditionnement_commande DATE,
    dateEnvoi_commande DATE,
    FK_id_distributeur VARCHAR(50),
    FK_id_produit INT,
    
    FOREIGN KEY FK_id_distributeur REFERENCES Distributeur(id_distributeur), 
    FOREIGN KEY FK_id_produit REFERENCES Produit(id_produit),
    PRIMARY KEY (id_commande)
);

INSERT INTO Commande VALUES(1, 10.99, 'Filet 1KG', 50, '2012-05-09', NULL, 'carr15432', 1);
INSERT INTO Commande VALUES(2, 20.99, 'Filet 5KG', 50, '2009-05-09', NULL, 'carr15432', 2);


--
--  Class: Produit
--
CREATE TABLE Produit (
    id_produit INT AUTO_INCREMENT,
    variete_produit VARCHAR(50),
    type_produit VARCHAR(50),
    calibre_produit INT,

    PRIMARY KEY (id_produit)
);

INSERT INTO Produit VALUES(1, 'Mayette', 'Fraiche Entière', 2);
INSERT INTO Produit VALUES(2, 'Parisienne', 'Cerneaux', 1);