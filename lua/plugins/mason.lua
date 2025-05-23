return {
  "mason-org/mason.nvim",
	dependencies = { 'williamboman/mason-lspconfig.nvim' },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end
}
