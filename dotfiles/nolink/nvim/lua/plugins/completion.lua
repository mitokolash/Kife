return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip", dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets", }, },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require "cmp"
      local lspkind = require "lspkind"
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
	formatting = {
	  format = lspkind.cmp_format({
	    mode = 'symbol',
	    maxwidth = { menu = 50, abbr = 50 },
	    ellipsis_char = '...'
	  })
	},

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

	  ["<Tab>"] = function(fallback)
	    if cmp.visible() then
	      cmp.select_next_item()
	    else
	      fallback()
	    end
	  end,

	  ["<S-Tab>"] = function(fallback)
	    if cmp.visible() then
	      cmp.select_prev_item()
	    else
	      fallback()
	    end
	  end,

          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
