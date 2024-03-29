vim.cmd("let g:vsnip_filetypes = {}")

local cmp_setup, cmp = pcall(require, "cmp")
local lspkind = require('lspkind')

if not cmp_setup then
	return
end

cmp.setup({
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
			ellipsis_char = '...',
			before = function(entry, vim_item)
				return vim_item
			end
		})
		-- format = function(entry, vim_item)
		-- 	if entry.source.name == "html-css" then
		-- 		vim_item.menu = entry.completion_item.menu
		-- 	end
		-- 	return vim_item
		-- end
	},
	experimental = {
		ghost_text = false
	},

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lsp_signature_help" },
		-- {
		-- 	name = "html-css",
		-- 	option = {
		-- 		max_count = {}, -- not ready yet
		-- 		enable_on = {
		-- 			"html"
		-- 		},                                   -- set the file types you want the plugin to work on
		-- 		file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
		-- 		style_sheets = {
		-- 			-- example of remote styles, only css no js for now
		-- 			"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
		-- 			"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
		-- 			"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		-- 		}
		-- 	}
		-- },
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end
			}
		},
	}),

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.score,
			cmp.config.compare.exact,
			require "cmp-under-comparator".under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
