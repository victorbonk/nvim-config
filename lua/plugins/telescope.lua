return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                          , branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
	config = function ()
		local builtin = require('telescope.builtin')

    function get_project_root() 
      local current_file = vim.fn.expand('%:p')
      local current_dir = vim.fn.fnamemodify(current_file, ':h')
      -- Use lsp to determine project root
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_active_clients({bufnr = bufnr})
      return clients[1] and clients[1].config.root_dir or current_dir
    end

    -- Find files from the current file's project root
		vim.keymap.set('n', '<leader>ff', function()
      local project_root = get_project_root();
      builtin.find_files({ cwd = project_root })
    end, { desc = 'Telescope find files' })

    -- Grep from the current file's project root
    vim.keymap.set('n', '<leader>fg', function()
      local project_root = get_project_root();
      builtin.grep_string({ cwd = project_root, search = vim.fn.input("Grep > ") })
    end, { desc = 'Telescope grep string' })
	end
}
