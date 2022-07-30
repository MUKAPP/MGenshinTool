require "import"
import "mods.muk"
import "mods.hutaoapi"

hutaoapi.login(function()
  hutaoapi.statistics.overview()
end)