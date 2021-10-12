--[[

    File Name: 'Commande.lua'
    Name: 'Commande'

]]--


--> The "class" is created
function Commande(id, prixHT, conditionnement, quantite, dateConditionnement, dateEnvoi)
    --> Create object of the class
    local obj = {};

    --> Set variables of the objects
    obj.id = id;
    obj.prixHT = prixHT;
    obj.conditionnement = conditionnement;
    obj.quantite = quantite;
    obj.dateConditionnement = dateConditionnement;
    obj.dateEnvoi = dateEnvoi;

    --> Functions
    function obj:getID()
        return obj.id;
    end;

    function obj:getPrixHT()
        return obj.prixHT;
    end;

    function obj:getConditionnement()
        return obj.conditionnement;
    end;
    
    function obj:getQuantite()
        return obj.quantite;
    end;

    function obj:getDateConditionnement()
        return obj.dateConditionnement;
    end;

    function obj:getDateEnvoi()
        return obj.dateEnvoi;
    end;

    function obj:EnCours()
        if self.dateEnvoi == nil then
            return true;
        else
            return false;
        end;
    end;

    function obj:XMLCommande()
        --> Variables
        local PDO = PersistanceSQL('127.0.0.1', 3306, 'baseSenoix'):getPDO();
        local request = PDO:execute('SELECT * FROM Commande JOIN Produit WHERE FK_id_produit = id_produit AND id_commande=' .. self:getID() .. ';');
        local result = request:fetch({}, 'a');
        local produit = Produit(result.variete_produit, result.type_produit, result.calibre_produit);

        --> XML
        local XML = '<commande id="' .. self:getID() .. '">' .. "\n";
        
        XML = XML .. '      <produit variete="' .. produit:getVariete() .. '" type="' .. produit:getType() .. '" calibre="' .. produit:getCalibre() .. '"/>' .. "\n";
        XML = XML .. '      <conditionnement type="' .. self:getConditionnement() .. '"/>' .. "\n";
        XML = XML .. '      <quantite>' .. self:getQuantite() .. '</quantite>' .. "\n";
        XML = XML .. '      <date_conditionnement>' .. self:getDateConditionnement() .. '</date_conditionnement>' .. "\n";
        XML = XML .. '      <date_envoi>' .. tostring(self:getDateEnvoi()) .. '</date_envoi>' .. "\n";
        XML = XML .. '  </commande>';

        return XML;
    end;

    --> Return the object
    return obj;
end;