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

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

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
      vim.keymap.set("n", "<leader>ih", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle [I]nlay [H]ints" })
    end

    if client:supports_method("textDocument/codeLens") then
      vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { desc = "[C]ode [L]ens" })

      local code_lens_group = vim.api.nvim_create_augroup("LspCodeLens", { clear = true })
      vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold", "BufEnter" }, {
        buffer = bufnr,
        group = code_lens_group,
        callback = function()
          vim.lsp.codelens.enable()
        end,
      })
      vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        buffer = bufnr,
        group = code_lens_group,
        callback = function()
          vim.lsp.codelens.enable(false)
        end,
      })
    end

    if client:supports_method("textDocument/linkedEditingRange") then
      vim.lsp.linked_editing_range(true, { client_id = client.id })
    end

    if client:supports_method("textDocument/documentHighlight") then
      local document_highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
      vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold" }, {
        buffer = bufnr,
        group = document_highlight_group,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMoved" }, {
        buffer = bufnr,
        group = document_highlight_group,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end
  end,
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
