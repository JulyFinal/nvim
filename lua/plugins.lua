local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- 你的插件列表...
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
      default_url_format = "https://ghproxy.com/https://github.com/%s",
    },
  },
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
  },
    
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)