-- rocket-launcher/startup.lua

spell:execute([[/lua require('rocket-launcher.rocket').start()]])

require('rocket-launcher.give-rocket').register()
