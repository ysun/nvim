require('telescope').setup({
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

map("n", "fg", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", default_options)
map("n", "fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", default_options)
map("n", "ff", "<cmd>Telescope find_files<CR>", default_options)
map("n", "gg", "<cmd>Telescope live_grep<CR>", default_options)
map("n", "fb", "<cmd>Telescope buffers<CR>", default_options)
map("n", ";;", "<cmd>Telescope help_tags<CR>", default_options)

