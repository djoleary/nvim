local servers = {
  "clojure_lsp",
  "gdscript",
  "gopls",
  "helm_ls",
  "htmx-lsp",
  "intelephense",
  "lua_ls",
  "nil_ls",
  "ocamllsp",
  "sqls",
  "svelte",
  "ts_ls",
  "yamlls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    local bufnr = args.buf

    local telescope = require("telescope.builtin")

    -- Formatting handled by conform.nvim

    if client:supports_method("textDocument/codeAction") then
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
    end

    if client:supports_method("textDocument/rename") then
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
    end

    if client:supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "[G]o to [D]efinition" })
    end

    if client:supports_method("textDocument/references") then
      vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "[G]o to [R]eferences" })
    end

    if client:supports_method("textDocument/implementation") then
      vim.keymap.set("n", "gi", telescope.lsp_implementations, { desc = "[G]o to [I]mplementations" })
    end

    if client:supports_method("textDocument/documentSymbol") then
      vim.keymap.set("n", "<leader>ls", telescope.lsp_document_symbols, { desc = "[L]ist [S]ymbols" })
    end

    if client:supports_method("workspace/symbol") then
      vim.keymap.set(
        "n",
        "<leader>lw",
        telescope.lsp_dynamic_workspace_symbols,
        { desc = "[L]ist [W]orkspace Symbols" }
      )
    end

    if client:supports_method("textDocument/prepareTypeHierarchy") then
      vim.keymap.set("n", "<leader>th", vim.lsp.buf.typehierarchy, { desc = "[T]ype[H]ierarchy" })
    end

    if client:supports_method("textDocument/inlayHint") then
      local enable_inlay_hints = function()
        vim.lsp.inlay_hint.enable(true, { bufnr })
      end

      local disable_inlay_hints = function()
        vim.lsp.inlay_hint.enable(false, { bufnr })
      end

      local inlay_hint_group = vim.api.nvim_create_augroup("LspInlayHint", { clear = true })
      vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold", "BufEnter" }, {
        buffer = bufnr,
        group = inlay_hint_group,
        callback = enable_inlay_hints,
      })
      vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        buffer = bufnr,
        group = inlay_hint_group,
        callback = disable_inlay_hints,
      })
    end

    if client:supports_method("textDocument/codeLens") then
      vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { desc = "[C]ode [L]ens" })

      local enable_code_lens = function()
        vim.lsp.codelens.refresh()
        local lenses = vim.lsp.codelens.get(bufnr)
        vim.lsp.codelens.display(lenses, bufnr, client.id)
      end

      local disable_code_lens = function()
        vim.lsp.codelens.clear(client.id, bufnr)
      end

      local code_lens_group = vim.api.nvim_create_augroup("LspCodeLens", { clear = true })
      vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold", "BufEnter" }, {
        buffer = bufnr,
        group = code_lens_group,
        callback = enable_code_lens,
      })
      vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        buffer = bufnr,
        group = code_lens_group,
        callback = disable_code_lens,
      })
    end
  end,
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
