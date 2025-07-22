-- Editor and performance options

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1

vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

local opt = vim.opt
opt.shell = "/bin/bash"
opt.shellcmdflag = "-c"
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.cursorline = true
opt.timeoutlen = 300
opt.completeopt = 'menu,menuone,noselect'
opt.showmode = false
opt.pumheight = 15
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.conceallevel = 2
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
opt.laststatus = 3
opt.cmdheight = 1
opt.showtabline = 2
opt.title = true
opt.titlestring = "Neovim - %F"
opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"

if vim.fn.has("unix") == 1 then
    opt.updatetime = 100
    opt.backup = false
    opt.writebackup = false
    if vim.fn.executable("xclip") == 1 then
        vim.g.clipboard = {
            name = "xclip",
            copy = {
                ["+"] = "xclip -selection clipboard",
                ["*"] = "xclip -selection primary",
            },
            paste = {
                ["+"] = "xclip -selection clipboard -o",
                ["*"] = "xclip -selection primary -o",
            },
        }
    end
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
