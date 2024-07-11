vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.ffs = 'dos,unix'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
local filetype_tabstop = {lua=2, markdown=2} -- filetype毎のインデント幅
local usrftcfg = vim.api.nvim_create_augroup("UserFileTypeConfig", { clear = true})
vim.api.nvim_create_autocmd("FileType", {
  group = usrftcfg,
  callback = function (args)
    local ftts = filetype_tabstop[args.match]
    if ftts then
      vim.bo.tabstop = ftts
      vim.bo.shiftwidth = ftts
    end
  end
})

