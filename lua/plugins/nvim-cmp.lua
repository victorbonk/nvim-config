return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet engine and nvim-cmp source
    -- 'L3MON4D3/LuaSnip',
    -- 'saadparwaiz1/cmp_luasnip'

    -- Completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function ()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          -- require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Complete with Ctrl-n (like Vim's default completion)
        ["<C-n>"] = cmp.mapping.confirm({ select = true }),
        
        -- Navigate the completion menu
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        
        -- Invoke completion
        ["<C-Space>"] = cmp.mapping.complete(),
        
        -- Close completion window
        ["<C-e>"] = cmp.mapping.abort(),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' }
      }),
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['ts_ls'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['vuels'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['volar'].setup {
      capabilities = capabilities
    }

  end,
  event = "InsertEnter"
}
