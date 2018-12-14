-- rocket-launcher/rocket.lua
-- /lua require('rocket-launcher.rocket').start()

local pkg = {}
local module = ...
local maxDistance = 100
local stepSize = 0.5
local toLua
local tell
local singleton

function pkg.start()
  singleton()
  Events.on("SwingArmEvent"):call(function(event)
    local item = event.item
    if item and item.nbt and item.nbt.tag and item.nbt.tag.Wand == "rocket-launcher" then
      local p = event.player
      local start = p.pos + Vec3(0,p.eyeHeight,0) + p.lookVec * (math.max(1,p.motion:magnitude())*3)
      spell:execute([[/execute %s ~ ~ ~ lua require('%s').launch(%s,%s)]], p.name, module, toLua(start), toLua(p.lookVec))
      if event.player.gamemode ~= "creative" then
        item.count = item.count - 1
        if item.count <= 0 then
          event.player.mainhand = nil
        end
      end
    end
  end)
end

function pkg.launch(start,direction)
  spell.pos = start
  local count = maxDistance / stepSize
  for i=1,count do
    spell.pos = spell.pos + direction * stepSize
    if spell.block.material.solid then
      pkg.explode()
      break
    end
    if #Entities.find("@e[r=1]") > 0 then
      pkg.explode()
      break
    end
    pkg.particle()
    if i%3==0 then
      sleep(1)
    end
  end
end

function pkg.particle()
  spell:execute("/particle smoke ~ ~ ~ 0 0 0 0.01 100 force @a")
end

function pkg.explode()
  spell:execute([[/summon tnt]])
end

function toLua(vec)
  return string.format("Vec3(%s,%s,%s)", vec.x, vec.y, vec.z)
end

function tell(to, message, color)
  color = color or 'white'
  spell:execute([[
    /tellraw %s [{"text":"%s","color":"%s"}]
  ]], to, message, color)
end

function singleton()
  spell:execute([[/wol spell break byName "%s"]],module)
  spell.name = module
end

return pkg
