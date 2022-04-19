local telescope = require("telescope")

telescope.load_extension "file_browser"

telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.95,
      prompt_position = 'bottom',
      width = 0.95,
      preview_cutoff = 5,
      preview_height = 0.6,
      scroll_speed = 1,
    },
    file_ignore_patterns = { ".cache/", "%.o", "%.so", "%.a", "%.ko", "%.tar.gz" },
    mappings = {
      i = {
        ["<C-Up>"] = require "telescope.actions".preview_scrolling_up,
        ["<C-Down>"] = require "telescope.actions".preview_scrolling_down,
      },
      n = {
        ["<C-Up>"] = require "telescope.actions".preview_scrolling_up,
        ["<C-Down>"] = require "telescope.actions".preview_scrolling_down,
      },
    }
  },
})

local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}

_G.my_project_files = function()
	local ok = pcall(require"telescope.builtin".git_files, default_options)
	if not ok then require"telescope.builtin".find_files(default_options) end
end

map("n", "fg", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", default_options)
--map("n", "fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", default_options)
map("n", "<C-\\>s", "<cmd>Telescope lsp_references<CR>", default_options)
map("n", "ff", "<cmd>call v:lua.my_project_files()<CR>", default_options)
