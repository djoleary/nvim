vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local max_filesize = 100 * 1024 -- 100 KiB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > max_filesize then
      -- Native fallback for large files
      vim.treesitter.stop(args.buf)
      vim.bo[args.buf].syntax = "on" -- Fallback to traditional regex highlighting
    else
      -- Start Treesitter
      pcall(vim.treesitter.start, args.buf)
      -- Enable Indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      -- Enable Folds
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
    end
  end,
})
