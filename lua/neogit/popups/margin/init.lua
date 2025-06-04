local popup = require("neogit.lib.popup")
local actions = require("neogit.popups.margin.actions")

local M = {}

function M.create()
  local p = popup
    .builder()
    :name("NeogitMarginPopup")
    :config("o", "neogit.status.order", {
      options = {
        { display = "", value = "" },
        { display = "topo", value = "topo" },
        { display = "author-date", value = "author-date" },
        { display = "date", value = "date" },
      },
    })
    :config("r", "neogit.status.refnames", {
      options = {
        { display = "true", value = "true" },
        { display = "false", value = "false" },
      },
    })
    :group_heading("Refresh")
    :action("g", "buffer", actions.refresh) -- Needs to be "G" if implementing graph as config
    :new_action_group("Margin")
    :action("L", "toggle visibility", actions.toggle_visibility)
    :action("l", "cycle style", actions.cycle_date_style)
    :action("d", "toggle details", actions.toggle_details)
    :action("x", "toggle shortstat", actions.toggle_shortstat)
    :build()

  p:show()

  return p
end

return M
