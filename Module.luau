local Modules, Game, Load, Error = {}, game, loadstring, error;
Modules.Repository = "";

function Modules:require(url)
    if Modules[url] then return Modules[url] end

    local Success, Result = pcall(function()
        return Load(Game:HttpGet(Modules.Repository .. url))
    end)

    if not Success then
        Error("Failed to load: " .. url .. "\n" .. Result)
    end

    Modules[url] = Result()
    return Modules[url]
end

return Modules
