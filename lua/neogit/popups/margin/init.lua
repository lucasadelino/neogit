local popup = require("neogit.lib.popup")
local actions = require("neogit.popups.margin.actions")

local M = {}

function M.create()
  local p = popup
    .builder()
    :name("NeogitMarginPopup")
    :config("o", "neogit.margin.order", {
      options = {
        { display = "", value = "" },
        { display = "topo", value = "topo" },
        { display = "author-date", value = "author-date" },
        { display = "date", value = "date" },
      },
    })
    :config("r", "neogit.margin.refnames", {
      options = {
        { display = "true", value = "true" },
        { display = "false", value = "false" },
      },
    })
    :group_heading("Refresh")
    :action("g", "buffer", actions.refresh) -- Needs to be "G" if implementing graph as config
    :config("L", "neogit.margin.show", {
      options = {
        { display = "true", value = "true" },
        { display = "false", value = "false" },
      },
    })
    :config("d", "neogit.margin.details", {
      options = {
        { display = "true", value = "true" },
        { display = "false", value = "false" },
      },
    })
    :config("l", "neogit.margin.style", {
      options = {
        { display = "relative_short", value = "relative_short" },
        { display = "relative_long", value = "relative_long" },
        { display = "iso-like", value = "iso-like" },
      },
    })
    :config("x", "neogit.margin.type", {
      options = {
        { display = "name_date", value = "name_date" },
        { display = "shortstat", value = "shortstat" },
      },
    })
    :build()

  p:show()

  return p
end

return M
