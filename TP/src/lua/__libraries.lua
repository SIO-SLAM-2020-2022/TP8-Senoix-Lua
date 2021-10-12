--[[

    File Name: '__libraries.lua'
    Name: 'Libraries'

]]--


--> Collect every keys
local function collect_keys(t, sort)
	local _k = {};
	for k in pairs(t) do
		_k[#_k + 1] = k;
	end;

	table.sort(_k, sort);
    
	return _k;
end;

--> Sort the table
local function sortedPairs(t, sort)
	local keys = collect_keys(t, sort);
	local i = 0;
	return function()
		i = i + 1;
		if keys[i] then
			return keys[i], t[keys[i]];
		end;
	end;
end;

--> Self var_dump function (not exist in lua)
function table_dump(tbl)
    --> Check if it's a table
    if type(tbl) == 'table' then
        --> Variables
        local str = '\n = { \n';
        local isFunc = false;

        --> Loop (like foreach) for every values in the table
        for k, v in sortedPairs(tbl) do
            --> Check if it's a function 
            isFunc = string.sub(tostring(v), 0, 8) == 'function' and true or false;
            
            --> If not a function, then modify the 'str' variable
            if not isFunc then
                if type(k) ~= 'number' then k = '"' .. k .. '"'; end;
                str = str .. '  [' .. k .. '] = ' .. table_dump(v) .. ',\n';
            end;
        end;

        --> Return the finished 'str' variable and close the table 'form'
        return print(str .. '}');
    else
        --> just return the table. ex: "table: 0x505039"
        return tostring(tbl);
    end;
end;