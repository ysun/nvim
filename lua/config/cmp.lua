local types = require "cmp.types"
local str = require "cmp.utils.str"
      
local cmp = require('cmp')
    
-- lspkind
local lspkind = require "lspkind"
lspkind.init {
  symbol_map = {
    Text = "",
    Method = "ƒ",
    Function = "ﬦ",
    Constructor = "",
    Variable = "",
    Class = "",
    Interface = "ﰮ",
    Module = "",  
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",                
    Keyword = "",
    Snippet = "﬌",
    Color = "",
    File = "",
    Folder = "",
    EnumMember = "", 
    Constant = "",
    Struct = "",
  },
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping {
      i = cmp.mapping.confirm { select = true },
    },
    ["<Right>"] = cmp.mapping {
      i = cmp.mapping.confirm { select = true },
    },
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  sources = {                                                                                                                                                           
    -- 'crates' is lazy loaded                                                                                                                                          
    { name = "nvim_lsp" },                                                                                                                                              
    { name = "treesitter" },                                                                                                                                            
    { name = "vsnip" },                                                                                                                                                 
    { name = "path" },                                                                                                                                                  
    {                                                                                                                                                                   
      name = "buffer",                                                                                                                                                  
      option = {                                                                                                                                                        
        get_bufnrs = function()                                                                                                                                         
          return vim.api.nvim_list_bufs()                                                                                                                               
        end,                                                                                                                                                            
      },                                                                                                                                                                
    },                                                                                                                                                                  
    { name = "spell" },                                                                                                                                                 
  },
  formatting = {                                                                                                                                                        
    fields = {                                                                                                                                                          
      cmp.ItemField.Abbr,                                                                                                                                               
      cmp.ItemField.Kind,                                                                                                                                               
      cmp.ItemField.Menu,                                                                                                                                               
    },                                                                                                                                                                  
    format = lspkind.cmp_format {                                                                                                                                       
      mode = "symbol_text",                                                                                                                                             
      maxwidth = 60,                                                                                                                                                    
      before = function(entry, vim_item)                                                                                                                                
        vim_item.menu = ({                                                                                                                                              
          nvim_lsp = "ﲳ",                                                                                                                                               
          nvim_lua = "",                                                                                                                                               
          treesitter = "",                                                                                                                                             
          path = "ﱮ",                                                                                                                                                   
          buffer = "﬘",                                                                                                                                                 
          zsh = "",                                                                                                                                                    
          vsnip = "",                                                                                                                                                  
          spell = "暈",                                                                                                                                                 
        })[entry.source.name]                                                                                                                                           
                                                                                                                                                                        
        -- Get the full snippet (and only keep first line)
        local word = entry:get_insert_text()
        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
          word = vim.lsp.util.parse_snippet(word)
        end
        word = str.oneline(word)
        if
          entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
          and string.sub(vim_item.abbr, -1, -1) == "~"
        then
          word = word .. "~"
        end
        vim_item.abbr = word

        return vim_item
      end,
    },
  },
}

