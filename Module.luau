local Modules, Game, Load, Error, Tostring, Os_Clock, String_Format = {}, game, loadstring, error, tostring, os.clock, string.format;
Modules.Repository = ""; Modules.Debug = false;

function Modules:require(url)
    if Modules[url] then return Modules[url] end
    local StartTime = Os_Clock()

    local Success, Result = pcall(function()
        local Destination = Modules.Repository .. url

        Destination = Destination .. "?nocache=" .. Tostring(Os_Clock())
        return Load(Game:HttpGet(Destination))
    end)

    if not Success then
        Error("Failed to load: " .. url .. "\n" .. Result)
    end

    Modules[url] = Result()
    
    if Modules.Debug then
        warn(String_Format("[Module]: Loaded [%s] in %.3fs", url, Os_Clock() - StartTime))
    end
    
    return Modules[url]
end

return Modules
