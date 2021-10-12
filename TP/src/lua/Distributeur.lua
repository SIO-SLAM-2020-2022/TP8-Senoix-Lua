--[[

    File Name: 'Distributeur.lua'
    Name: 'Distributeur'

]]--


--> Require
require "PersistanceSQL";

--> The class is created
function Distributeur(id, nom)
    --> Create object of the class
    local obj = {};

    --> Set variables of the objects
    obj.id = id;
    obj.nom = nom;
    --obj.lesCommandes = {};

    --> Functions
    function obj:getID()
        return obj.id;
    end;

    function obj:getNom()
        return obj.nom;
    end;

    function obj:getCommandes()
        --> Variable
        local PDO = PersistanceSQL('127.0.0.1', 3306, 'baseSenoix'):getPDO();
        local request = PDO:execute('SELECT * FROM Commande JOIN Distributeur WHERE FK_id_distributeur = id_distributeur;');
        local result = request:fetch({}, 'a');

        --> Return object
        return Commande(result.id_commande, result.prixHT_commande, result.conditionnement_commande, result.quantite_commande, result.dateConditionnement_commande, tostring(result.dateEnvoi_commande))
    end;

    function obj:getCommandesEnCours()
        --> Variables
        local PDO = PersistanceSQL('127.0.0.1', 3306, 'baseSenoix'):getPDO();
        local request = PDO:execute('SELECT * FROM Commande JOIN Distributeur WHERE FK_id_distributeur = id_distributeur AND dateEnvoi_commande IS NULL;');
        local result = request:fetch({}, 'a');
        local commandes_obj_tbl = {};

        --> Add every commands in the table
        while result do
            commandes_obj_tbl[#commandes_obj_tbl + 1] = Commande(result.id_commande, result.prixHT_commande, result.conditionnement_commande, result.quantite_commande, result.dateConditionnement_commande, tostring(result.dateEnvoi_commande))
            result = request:fetch(result, 'a');
        end;

        --> Return object
        return commandes_obj_tbl;
    end;

    --> Return the object
    return obj;
end;