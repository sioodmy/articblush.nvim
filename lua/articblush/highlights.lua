local M = {}
local hi = vim.api.nvim_set_hl
local config = require('articblush.config')

function M.highlight_all(colors, opts)
  local base_highlights = config.highlights_base(colors)
  for group, properties in pairs(base_highlights) do
    hi(0, group, { properties } )
  end
  local ntree = opts.nvim_tree or { contrast = false }
  if ntree.contrast == true then
    hi(0, 'NvimTreeNormal', { guibg = colors.contrast } )
    hi(0, 'NvimTreeNormalNC', { guibg = colors.contrast } )
    hi(0, 'NvimTreeEndOfBuffer', { guibg = colors.contrast, guifg = colors.contrast } )
    hi(0, 'NvimTreeEndOfBufferNC', { guibg = colors.contrast, guifg = colors.contrast } )
    hi(0, 'NvimTreeVertSplit', { guifg = colors.background, guibg = colors.background } )
  end
  if opts.italics.code == true then
    local tomkitalic = {
      'TSKeyword', 'TSConditional',
      'Keyword', 'TSKeywordFunction', 'Function',
      'Repeat', 'TSRepeat',
    }
    for _, item in ipairs(tomkitalic) do
      hi(0, item, { cterm = 'italic', gui = 'italic' } )
    end
  end
  if opts.italics.comments == true then
     local tomkitalic = {
       'TSComment', 'Comment'
     }
     for _, item in ipairs(tomkitalic) do
       hi(0, item, { cterm = 'italic', gui = 'italic' } )
     end
  end
end

return M
