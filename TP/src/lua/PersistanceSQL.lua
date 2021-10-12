--[[

    File Name: 'PersistanceSQL.lua'
    Name: 'PersistanceSQL'

]]--


--> Require
local luasql = require "luasql.mysql";

--> The class is created
function PersistanceSQL(ipBase, port, nomBaseDonnee)
    --> Variables
    local obj = {}; -- Create object of the class
    local request;

    --> Functions
    function obj:getPDO()
        local env = luasql.mysql();
        local conn = env:connect(nomBaseDonnee, 'root', '');

        return conn;
    end;

    function obj:rangerDansBase(object)
        --> Variables
        local PDO = self:getPDO();

        
        return 'rangerDansBase';
    end;

    function obj:chargerDepuisBase(id, classe)
        --> Variables
        classe = classe:lower(); --> Lowercase the class if needed
        request = self:getPDO():execute('SELECT * FROM ' .. classe .. ' WHERE id_' .. classe .. ' = ' .. id); -- Create SQL request
        result = request:fetch({}, 'a') -- Get every results indexed by field names
       
        --> Check if result is null or not
        if result ~= nil then
            return result;
        else
            return nil;
        end;
    end;

    --> Return the object
    return obj;
end;