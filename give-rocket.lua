-- rocket-launcher/give-rocket.lua
-- /lua require('rocket-launcher.give-rocket').register()
-- /lua require('rocket-launcher.give-rocket').giveRocket()

local pkg = {}
local module = ...
local USAGE = "/give-rocket [<player>] [<count>]"
local showError
local tell

function pkg.register()
  Commands.register("give-rocket",string.format([[
    require('%s').giveRocket(...)
  ]],module), USAGE, 1)
end

function pkg.giveRocket(arg1,arg2)
  local player = nil
  if spell.owner then
    player = spell.owner.name
  end
  local num = 1
  if tonumber(arg1) then
    num = tonumber(arg1)
  elseif arg1 then
    player = arg1
    if arg2 then
      num = tonumber(arg2)
    end
  end
  if not player then
    showError("Usage: "..USAGE)
    return
  end
  spell:execute([[/give %s minecraft:arrow %s 0 
    {Wand:"rocket-launcher",display:{Name:"Rocket Launcher",Lore:["Look at your target and swing this wand"]},ench:[{id:99,lvl:1}]}
  ]], player, num)
end

function showError(message, ...)
  local n = select('#', ...)
  if n>0 then
    message = string.format(message, ...)
  end
  tell(spell.owner.name, message, 'red')
end

function tell(to, message, color)
  color = color or 'white'
  spell:execute([[
    /tellraw %s [{"text":"%s","color":"%s"}]
  ]], to, message, color)
end

return pkg
