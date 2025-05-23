local git = require("neogit.lib.git")
local popup = require("neogit.lib.popup")
local config = require("neogit.config")
local actions = require("neogit.popups.margin.actions")

local M = {}

function M.create()
  local order_entry = git.config.get("neogit.status.order")
  local order = order_entry:is_set() and order_entry.value or "date"

  local p = popup
    .builder()
    :name("NeogitMarginPopup")
    :config("n", "neogit.status.max_commits")
    :config("o", "neogit.status.order", {
      options = {
        { display = "", value = "" },
        { display = "topo", value = "topo" },
        { display = "author-date", value = "author-date" },
        { display = "date", value = "date" },
      },
    })
    :switch("g", "graph", "Show graph", {
      enabled = true,
      internal = true,
      incompatible = { "reverse" },
      dependent = { "color" },
    })
    :switch_if(
      config.values.graph_style == "ascii" or config.values.graph_style == "kitty",
      "c",
      "color",
      "Show graph in color",
      { internal = true, incompatible = { "reverse" } }
    )
    :config("r", "neogit.status.refnames", {
      options = {
        { display = "true", value = "true" },
        { display = "false", value = "false" },
      },
    })
    :group_heading("Refresh")
    :action("g", "buffer", actions.refresh)
    :new_action_group("Margin")
    :action("L", "toggle visibility", actions.toggle_visibility)
    :action("l", "cycle style", actions.cycle_date_style)
    :action("d", "toggle details", actions.toggle_details)
    :action("x", "toggle shortstat", actions.log_current)
    :build()

  p:show()

  return p
end

return M
