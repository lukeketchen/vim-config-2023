
vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Move text up and down
-- vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
-- vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
-- vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
-- vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
-- vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
-- vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- Add ctl s as save
vim.keymap.set("n", "<C-S>", ":update>CR>")
vim.keymap.set("v", "<C-S>", "<C-C>:update<CR>")
vim.keymap.set("i", "<C-S>", "<C-O>:update<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
