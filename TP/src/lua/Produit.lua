--[[

    File Name: 'Produit.lua'
    Name: 'Produit'

]]--


--> The class is created
function Produit(variete, type, calibre)
    --> Create object of the class
    local obj = {};

    --> Set variables of the objects
    obj.variete = variete;
    obj.type = type;
    obj.calibre = calibre;

    --> Functions
    function obj:getVariete()
        return obj.variete;
    end;

    function obj:getType()
        return obj.type;
    end;

    function obj:getCalibre()
        return obj.calibre;
    end;

    --> Return the object
    return obj;
end;