return {
  
  --[[
  -- 1. Nightfox theme (carbonfox dark + polybar pink)
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
          styles = {
            comments = "italic",
            keywords = "bold",
            functions = "bold",
            variables = "NONE",
          },
        },
        palettes = {
          carbonfox = {
            --bg0 = "#111111",   -- main background (polybar black)
	    bg0 = "#0a0a0a", 
            fg0 = "#ff79c6",   -- default foreground pink
            bg1 = "#121212",
            bg2 = "#1a1a1a",
            red = "#ff5555",
            green = "#50fa7b",
            blue = "#8be9fd",
            magenta = "#ff79c6",
            yellow = "#f1fa8c",
            cyan = "#8be9fd",
          }
        },
        groups = {
          all = {
            Identifier = { fg = "#ff79c6" },
            Statement = { fg = "#ff79c6" },
            Keyword = { fg = "#ff79c6" },
          },
        },
      })
      vim.cmd("colorscheme carbonfox")
    end,
  },
--]]
{
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,          -- load immediately for colorscheme
    priority = 1000,       -- high priority to load early
    config = function()
      vim.opt.background = "dark"   -- or "light" if you prefer the light variant
      vim.cmd.colorscheme("oxocarbon")
      vim.api.nvim_set_hl(0, "Normal", { bg = "#0d0d0d" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0d0d0d" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0d0d0d" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0d0d0d" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "#0d0d0d" })
    end,
  },


  -- 2. File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- 3. Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- 4. Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "oxocarbon",
          component_separators = '|',
          section_separators = '',
        }
      }
    end,
  },

  -- 5. Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  -- 6. Startup.nvim
  {
  "max397574/startup.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("startup").setup({
      theme = "dashboard",
    })
  end,
},


-- 7. LSP (C, Python, Lua)
{
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- servers table
    local servers = { "clangd", "pyright", "lua_ls" }

    for _, lsp in ipairs(servers) do
      -- lua_ls may need some special settings for Neovim API globals
      local settings = {}
      if lsp == "lua_ls" then
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          }
        }
      end

      vim.lsp.config(lsp, { capabilities = capabilities, settings = settings })
      vim.lsp.enable(lsp)
    end
  end,
},
-- 8. Completion (manual trigger only)
 {
   "hrsh7th/nvim-cmp",
   event = "InsertEnter",
   dependencies = {
     "hrsh7th/cmp-nvim-lsp",
   },
   config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
	autocomplete = false, -- disables automatic popup
      },

      preselect = cmp.PreselectMode.None, -- do not auto-select first item

      mapping = {
	["<C-Space>"] = cmp.mapping.complete(), -- manual trigger
	["<CR>"] = cmp.mapping.confirm({ select = false }), -- Enter does NOT auto-select
      },

      sources = {
	{ name = "nvim_lsp" },
      },
    })
  end,
},

-- Treesitter context for dynamic commentstring (required for proper TSX/JSX/etc. comments)
{
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    enable_autocmd = false,
  },
},

{
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = function(_, opts)
    opts.pre_hook = function(ctx)
      return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
    end
    opts.mappings = {
      basic = true,
      extra = true,
      extended = false,
    }
    return opts
  end,
}
}
