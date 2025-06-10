local M = {}

M.unsaved_files = function ()
  local count = 0

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified then
      count = count + 1
    end
  end

  if count > 0 then
    return '󰏫 ' .. count
  else
    return ''
  end
end

M.open_unsaved_buffers = function ()
  local status_telescope_ext, telescope_ext = pcall(require, "utils.telescope_extensions")
  if status_telescope_ext then
    telescope_ext.modified_buffers()
    return
  end

  local status_ok, telescope = pcall(require, "telescope.builtin")
  if status_ok then
    telescope.buffers()
  else
    vim.cmd("buffers")
  end
end

return M
