local M = {}

-- Function to save all the modified files
M.save_all_modified = function ()
  local saved_count = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
      local bufname = vim.api.nvim_buf_get_name(buf)

      -- Only save if the buffer has a filename
      if bufname ~= "" then
        vim.api.nvim_buf_call(buf, function ()
          vim.cmd("silent! write")
        end)
        saved_count = saved_count + 1
      end
    end
  end

  if saved_count > 0 then
    vim.notify(string.format("Se han guardado %d archivo(s)", saved_count), vim.log.levels.INFO)
  else
    vim.notify("No había archivos que guardar", vim.log.levels.INFO)
  end
end

-- Function to show a selectors of modified buffers using Telescope
M.show_modified_buffers = function ()
  -- First check if there is modified buffers
  local has_modified = false
  for _, buf in pairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
      has_modified = true
      break
    end
  end

  if not has_modified then
    vim.notify("No hay buffers modificados", vim.log.levels.INFO)
    return
  end

  local status_ok, telescope_ext = pcall(require, "utils.telescope_extensions")
  if status_ok then
    telescope_ext.modifier_buffers()
    return
  end

  local modifier_buffers = {}
  local display_items = {}

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
      local name = vim.api.nvim_buf_get_name(buf)
      if name == "" then name = "[Buffer Sin Nombre]" end

      table.insert(modifier_buffers,  buf)
      table.insert(display_items, name .. " [Modificado]")
    end
  end

  vim.ui.select(display_items, {
    prompt = "Buffers modificados:",
    format_item = function (item) return item end,
  }, function (choice, idx)
    if not choice then return end

    local selected_buf = modifier_buffers[idx]
    vim.api.nvim_win_set_buf(0, selected_buf)

    vim.ui.select({"Guardar", "No Guardar", "Guardar Todos"}, {
      prompt = "¿Que deseas hacer con este buffer?"
    }, function(action)
      if action == "Guardar" then
        vim.cmd("write")
        vim.defer_fn(function ()
          M.show_modified_buffers()
        end, 100)
      elseif action == "Guardar Todas" then
        M.save_all_modified()
      end
    end)
  end)

  -- -- Call Telescope with a filter to show only modified buffers
  -- telescope.buffers({
  --   sort_lastused = true,
  --   sort_mru = true,
  --   show_all_buffers = false,
  --   only_cwd = false,
  --   entry_maker = function (entry)
  --     if vim.bo[entry.bufnr].modified then
  --       return require("telescope.make_entry").gen_from_buffer()(entry)
  --     end
  --   end,
  --   attach_mappings = function (prompt_bufnr, map)
  --     local actions = require("telescope.actions")

  --     -- Add mapping to save the selected buffer
  --     map("i", "<C-s>", function ()
  --       local selection = require("telescope.actions.state").get_selected_entry()
  --       actions.close(prompt_bufnr)

  --       if selection then
  --         vim.api.nvim_win_set_buf(0, selection.bufnr)
  --         vim.cmd("write")
  --       end
  --     end)

  --     -- Add mapping to save all the modified buffers
  --     map("i", "<C-a>", function ()
  --       actions.close(prompt_bufnr)
  --       M.save_all_modified()
  --     end)

  --     return true
  --   end,
  --   bufnr_width = 4
  -- })
end

return M
