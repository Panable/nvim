return {
  "epwalsh/obsidian.nvim",
  version = "*", -- use latest release
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required
    "nvim-lua/plenary.nvim",
    -- Recommended for completion
    "hrsh7th/nvim-cmp",
    -- Recommended for picker/search
    "nvim-telescope/telescope.nvim",
    -- Recommended for syntax
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Configure your vault(s) here
    workspaces = {
      {
        name = "notes",
        path = "~/dev/Obsidian/Vault/",
      },
    },

    -- Daily notes configuration
    daily_notes = {
      folder = "Dailies",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
      template = nil, -- Set to a template name like "daily.md" if you want
    },

    -- Completion settings
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Key mappings
    mappings = {
      -- Follow link with gf
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle checkbox
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action: follow link or toggle checkbox
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- Where to put new notes (in vault root)
    new_notes_location = "current_dir",

    -- Note ID format (Zettelkasten style)
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Wiki link style
    preferred_link_style = "wiki",

    -- Frontmatter handling
    disable_frontmatter = false,

    -- Templates
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
      },
    },

    -- Open URLs in browser (Linux)
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,

    -- Open images (Linux)
    follow_img_func = function(img)
      vim.fn.jobstart({ "xdg-open", img })
    end,

    -- Picker configuration
    picker = {
      name = "telescope.nvim",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },

    -- Sort search results by modified time (newest first)
    sort_by = "modified",
    sort_reversed = true,

    -- UI and syntax highlighting
    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      -- Checkbox icons (requires Nerd Font)
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    -- Image/attachment handling
    attachments = {
      img_folder = "attachments",
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
}
