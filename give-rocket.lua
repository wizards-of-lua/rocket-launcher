-- rocket-launcher/give-rocket.lua
-- /lua require('rocket-launcher.give-rocket').register()
-- /lua require('rocket-launcher.give-rocket').giveRocket()

local pkg = {}
local module = ...

function pkg.register()
  Commands.register("give-rocket",string.format([[
    require('%s').giveRocket(...)
  ]],module), "/give-rocket [<player>] [<count>]", 1)
end

function pkg.giveRocket(arg1,arg2)
  local player = spell.owner.name
  local num = 1
  if tonumber(arg1) then
    num = tonumber(arg1)
  elseif arg1 then
    player = arg1
    if arg2 then
      num = tonumber(arg2)
    end
  end

  spell:execute([[/give %s minecraft:arrow %s 0 
    {Wand:"rocket-launcher",display:{Name:"Rocket Launcher",Lore:["Look at your target and swing this wand"]},ench:[{id:99,lvl:1}]}
  ]], player, num)
end

return pkg
