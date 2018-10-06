# The Rocket Launcher Spell Pack

This spell pack is a [Wizards of Lua](http://www.wizards-of-lua.net) add-on that adds a rocket launcher to the Minecraft game.

The rocket launcher is a special arrow that can can shoot rockets into the direction you are looking at.
Just look at your target and swing it.

You can give this spell pack a try at our alpha server: ```mc.wizards-of-lua.net:30200```

## How to Install?
This spell pack is dependent on [Minecraft Forge](http://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.12.2.html) 
and the [Wizards of Lua Modification](https://minecraft.curseforge.com/projects/wizards-of-lua/files), version 2.5.0 or later.

These are the steps to install and run the Claiming Heads on your Minecraft Server:

1. **Install Minecraft Forge**

     Well, you should already know how to do that.
2. **Install Wizards of Lua**

     Download the JAR file containing the latest Version of 
     [Wizards of Lua Modification](https://minecraft.curseforge.com/projects/wizards-of-lua/files) and place it
     into the `mods` directory of your Minecraft server.
     
3. **Install The Rocket Launcher Spell Pack**

    Download the JAR file containing the latest Version of 
    [The Rocket Launcher Spell Pack](https://minecraft.curseforge.com/projects/rocket-launcher-spell-pack/files) and place it
    into the `mods` directory of your Minecraft server.
    
4. **Restart the Server**

## Playing Instructions
### How to Get a Magic Wand?
#### By Vanilla Command
Just execute the following Minecraft command:
```
/give @p minecraft:arrow 1 0 {Wand:"rocket-launcher",display:{Name:"Rocket Launcher",Lore:["Look at your target and swing this wand"]},ench:[{id:99,lvl:1}]}
```
#### Or By Spell Pack Command
```
/give-rocket @p
```
