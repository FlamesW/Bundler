### Example Usage:
```lua
local Modules = loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamesW/Bundler/refs/heads/home/Module.luau"))()
Modules.Repository = "https://raw.githubusercontent.com/YourName/Project/"
Modules.Debug = true

getgenv().require = function(url)
    return Modules:require(url)
end

local Scripts = {
    ["Loader"] = "main/Loader.lua",
    ["Utils"] = "main/Utils.lua",
    ["Config"] = "main/Config.lua",
    ["Weapons"] = "game/weapons.lua",
    ["Players"] = "game/players.lua",
}

local Req = {}
for Module, Src in pairs(Scripts) do
    Req[Module] = require(Src)
end

-- // Usage
Req.Loader:start()
Req.Utils:help()
Req.UI:create()
print(Req.Config.version)
```
