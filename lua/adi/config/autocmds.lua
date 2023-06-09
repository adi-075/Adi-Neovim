local mygroup = vim.api.nvim_create_augroup("vimrc", { clear = true })

-- reload config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "**/lua/adi/config/*.lua",
  callback = function()
    local filepath = vim.fn.expand("%")

    dofile(filepath)
    vim.notify("Configuration reloaded \n" .. filepath, nil, {
      title = "autocmds.lua",
    })
  end,
  group = mygroup,
  desc = "Reload config on save",
})

-- Auto Format File on Save
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})
