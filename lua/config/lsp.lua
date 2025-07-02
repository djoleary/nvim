local servers = {
  "clojure_lsp",
  "gopls",
  "helm_ls",
  "intelephense",
  "lua_ls",
  "nil_ls",
  "ocamllsp",
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
      vim.keymap.set("n", "gI", telescope.lsp_implementations, { desc = "[G]o to [I]mplementations" })
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
  end,
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
