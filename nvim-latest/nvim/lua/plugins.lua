return {
	-- blink
	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	},

	-- colorscheme tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	--gruvbox colorscheme

	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts ={}}, 

	-- markdown
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		opts = {
			code = {
				position = 'left',
				language_border = '█',
				border = 'thick',
				width = 'full',
			}

		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	},

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup{
				options = { 
					theme = "palenight",
					section_separators = { left = '', right = ''},
					component_separators = { left = '|', right = '|'},
				},
				sections = {
					lualine_c = {
						{ 'filename', path = 3 },
					},
					lualine_x = {'fileformat', 'filetype'},
				},
			}
		end
	},

	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	--latex
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_forward_search_on_start = false
			vim.g.vimtex_compiler_latexmk = {
				aux_dir = "/home/pacifist/.texfiles/",
				out_dir = "/home/pacifist/.texfiles/",
			}
		end
	},

	--fuzzy finder
	{
		'nvim-telescope/telescope.nvim', version = '*',
		opts = {
			defaults = {
				file_ignore_patterns = {
					".git",
					".cache",
					".texfiles",
				},

			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			dependencies = {
				'nvim-lua/plenary.nvim',
				-- optional but recommended
				{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			}
		},
	},

}


