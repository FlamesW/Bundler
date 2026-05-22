local Modules, Game, Load, Error, Tostring, Os_Clock = {}, game, loadstring, error, tostring, os.clock;
Modules.Repository = ""; Modules.Debug = false;

function Modules:require(url)
    if Modules[url] then return Modules[url] end
    local StartTime = Os_Clock()

    local Success, Result = pcall(function()
        local Destination = Modules.Repository .. url

        Destination = Destination .. "?nocache=" .. tostring(Os_Clock())
        return Load(Game:HttpGet(Destination))
    end)

    if not Success then
        Error("Failed to load: " .. url .. "\n" .. Result)
    end

    Modules[url] = Result()
    
    if Modules.Debug then
        local LoadTime = Os_Clock() - StartTime
        print(string.format("[Module] Loaded %s in %.4fs", url, LoadTime))
    end
    
    return Modules[url]
end

return Modules
