-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/render-markdown.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/render-markdown.lua

-- https://github.com/MeanderingProgrammer/markdown.nvim
--
-- When I hover over markdown headings, this plugins goes away, so I need to
-- edit the default highlights
-- I tried adding this as an autocommand, in the options.lua
-- file, also in the markdownl.lua file, but the highlights kept being overriden
-- so the only way I was able to make it work was loading it
-- after the config.lazy in the init.lua file lamw25wmal

return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  -- Moved highlight creation out of opts as suggested by plugin maintainer
  -- There was no issue, but it was creating unnecessary noise when ran
  -- :checkhealth render-markdown
  -- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/138#issuecomment-2295422741
  opts = {
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = false,
    },
    checkbox = {
      enabled = true,
      render_modes = false,
      bullet = false,
      left_pad = 0,
      right_pad = 1,
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
        scope_highlight = nil,
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
        scope_highlight = nil,
      },
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        unchecked = { raw = '[ ]', rendered = '󰄱 ', highlight = 'RenderMarkdownUnchecked', scope_highlight = nil },
        checked = { raw = '[x]', rendered = '󰱒 ', highlight = 'RenderMarkdownChecked', scope_highlight = nil },
      },
    },
    html = {
      -- Turn on / off all HTML rendering
      enabled = true,
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = false,
      },
    },
    -- Add custom icons lamw26wmal
    link = {
      enabled = true,
      image = vim.g.neovim_mode == "skitty" and "" or "󰥶 ",
      custom = {
        youtu = { pattern = "youtu%.be", icon = "󰗃 " },
      },
    },
    heading = {
      enabled = true,
      sign = false,
      position = 'overlay',
      left_margin = 0,
      left_pad = 0,
      right_pad = 0,
      width = 'full',
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },
    code = {
      -- if I'm not using yabai, I cannot make the color of the codeblocks
      -- transparent, so just disabling all rendering 😢
      style = "none",
    },
    indent = {
      enabled = false,
    },
  },
}
