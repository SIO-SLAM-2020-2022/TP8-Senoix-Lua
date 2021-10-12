--[[

    File Name: 'GestionCommandes.lua'
    Name: 'GestionCommandes'

]]--


--> Require
require "PersistanceSQL";

--> The class is created
function GestionCommandes()
    --> Create object of the class
    local obj = {};

    --> Functions
    function obj:getDistributeur(id)
        --> Variables
        local SQL = PersistanceSQL('127.0.0.1', 3306, 'baseSenoix');
        local unDistributeur = SQL:chargerDepuisBase(id, 'Distributeur');

        --> If nil then return nil
        if unDistributeur ~= nil then
            local distributeur = Distributeur(unDistributeur.id, unDistributeur.nom);
            return distributeur;
        else
            return nil;
        end;
    end;

    function obj:XmlNonLivrees(unDistributeur)
        --> Set vars
        local XML;
        local enCours = unDistributeur:getCommandesEnCours();

        --> Create XML
        XML = '<?xml version="1.0" encoding="UTF-8"?>' .. "\n";
        XML = XML .. '<commandes idDistributeur="' .. unDistributeur:getID() .. '" xmnls:xlink="http://www.w3.org/1999/xlink">' .. "\n";

        --> Foreach Loop
        for k, v in pairs(enCours) do
            XML = XML .. '  ' .. v:XMLCommande() .. "\n";
        end;

        --> End the XML
        XML = XML .. '</commandes>' .. "\n";

        --> Return XML
        return XML;
    end;

    --> Return the object
    return obj;
end;