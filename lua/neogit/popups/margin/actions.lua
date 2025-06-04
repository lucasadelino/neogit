local M = {}

local state = require("neogit.lib.state")

function M.toggle_visibility()
  local visibility = state.get({ "margin", "visibility" }, false)
  local new_visibility = not visibility
  state.set({ "margin", "visibility" }, new_visibility)
end

function M.cycle_date_style()
  local styles = { "relative_short", "relative_long", "local_datetime" }
  local current_index = state.get({ "margin", "date_style" }, #styles)
  local next_index = (current_index % #styles) + 1 -- wrap around to the first style

  state.set({ "margin", "date_style" }, next_index)
end

function M.toggle_details()
  local details = state.get({ "margin", "details" }, false)
  local new_details = not details
  state.set({ "margin", "details" }, new_details)
end

function M.toggle_shortstat()
  local shortstat = state.get({ "margin", "shortstat" }, false)
  local new_shortstat = not shortstat
  state.set({ "margin", "shortstat" }, new_shortstat)
end

function M.refresh()
  local status = require("neogit.buffers.status")
  if status.is_open() then
    status.instance():dispatch_refresh(nil, "user_refresh")
  end
end

return M
