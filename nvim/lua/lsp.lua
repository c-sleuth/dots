capabilities = require("blink-cmp").get_lsp_capabilities()
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup { capabilities = capabilities }

lspconfig['tinymist'].setup {
    cmd = {'/home/me/.config/nvim/lsps/tinymist'},
    capabilities = capabilities
}

lspconfig['ols'].setup {
    cmd = {'ols'},
    capabilities = capabilities
}

lspconfig.v_analyzer.setup{
    cmd = {"/home/me/.config/v-analyzer/bin/v-analyzer"},
    capabilities = capabilities
}

-- lspconfig.pyright.setup{}
lspconfig.pylsp.setup{
    capabilities = capabilities
}

lspconfig.clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
})

lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
