local opt = vim.opt

-- line number
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- ui
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

-- clipboard
opt.clipboard = "unnamedplus"

-- split
opt.splitright = true
opt.splitbelow = true

-- mouse
opt.mouse = "a"

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- บังคับให้ระบบรองรับการอ่านรหัสภาษา UTF-8 สมบูรณ์แบบ
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

-- ปรับให้การจัดหน้าไม่ตัดคำตรงกลางสระภาษาไทยที่ลอยอยู่
vim.opt.wrap = true
vim.opt.linebreak = true
