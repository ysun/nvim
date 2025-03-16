-- 使用 utf8 编码
vim.g.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
-- 禁止折行显示文本
vim.o.wrap = true
-- 光标移动的时候始终保持上下左右至少有 8 个空格的间隔
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 相对行号 方便进行数字范围的操作
vim.o.number = true
vim.o.relativenumber = false
-- 高亮显示光标所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线
vim.wo.colorcolumn = "80"
-- 使用空格替代 tab
vim.bo.expandtab = false
-- NORMAL 模式下 >> << 和 INSERT 模式下 CTRL-T CTRL-D 的缩进长度
vim.o.shiftround = true
-- 1 个 tab 移动 8 个空格
vim.o.shiftwidth = 8
-- 1 个 tab 显示为 8 个空格
vim.o.tabstop = 8
vim.bo.tabstop = 8
-- INSERT 模式下 1 个 tab 代表 8 个空格
vim.bo.softtabstop = 8
-- 新行对齐当前行
vim.bo.autoindent = true
vim.bo.smartindent = true
-- 搜索大小写不敏感 而在包含大写的时候让搜索变成大小写敏感
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索结果不高亮显示
vim.o.hlsearch = true
-- 输入的同时搜索
vim.g.incsearch = true
-- 命令行高设置为 2 行
vim.o.cmdheight = 2
-- 当文件被外部程序修改的时候 自动加载修改后的内容
vim.g.autoread = true
vim.bo.autoread = true
-- 光标在行首的时候，使用左右方向键可以跳转到上一行或下一行
-- vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的 buffer
vim.o.hidden = true
-- 开启鼠标支持 - 仅在normal 和 virtual mode下
vim.o.mouse = "nv"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- 缩短 swap file 的更新时间间隔
vim.o.updatetime = 300
-- 设置快捷键触发的等待时间
vim.o.timeoutlen = 500
-- 分隔窗口的时候 新窗口从下面或者右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全但是不会自动选中
vim.o.completeopt = "menu,menuone,noselect,noinsert"
-- 补全增强
vim.o.wildmenu = true
-- 补全最多 10 行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不需要 vim 的模式提示
vim.g.showmode = false
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 把空格显示成一个点
vim.o.list = false
vim.o.listchars = "space:·"
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.g.ff = unix

TabnineEnable = false

local function opts(desc)
    return { desc = 'nvim: ' .. desc }
end

vim.keymap.set("n", "<C-j>t", "<cmd>ChatGPT<CR>", opts('Open ChatGPT'))
vim.keymap.set("i", "<C-j>t", "<cmd>ChatGPT<CR>", opts('Open ChatGPT'))
vim.keymap.set("n", "<C-j>c", "<cmd>ChatGPTCompleteCode<CR>", opts('CompleteCode by ChatGPT'))
vim.keymap.set("i", "<C-j>c", "<cmd>ChatGPTCompleteCode<CR>", opts('CompleteCode by ChatGPT'))
vim.keymap.set("n", "<C-j>r", ':ChatGPTRun -<tab>', opts('ChatGPTRun'))
vim.keymap.set("v", "<C-j>r", ':ChatGPTRun -<tab>', opts('ChatGPTRun'))

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- vim.g.copilot_proxy = 'http://proxy-us.xxx.com:914'
vim.g.copilot_proxy = os.getenv("https_proxy")
vim.g.copilot_proxy_strict_ssl = false

-- vim.cmd [[colorscheme onedark]]
