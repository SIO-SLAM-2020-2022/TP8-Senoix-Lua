--[[

    File Name: 'Test.lua'
    Name: 'Test'

]]--


--> Require
require('PersistanceSQL');

--> The class is created
function Test()
    --> Create object of the class
    local obj = {};

    --> Variables
    local PersistanceSQL = PersistanceSQL('localhost', 3306, 'baseSenoix');

    --> Functions
    function obj:AfficheCommandesCarreClerc()
        local result = PersistanceSQL:chargerDepuisBase('carr15432', 'Commande');
        
        return print(string.format("ID: %s, PrixHT: %s €, Conditionnement: %s, Quantité: %s, Date de Conditionnement: %s, Date d'envoi: %s", result.id_commande, result.prixHT_commande, result.conditionnement_commande, result.quantite_commande, result.dateConditionnement_commande, result.dateEnvoi_commande));
    end;

    --> Return the object
    return obj;
end;