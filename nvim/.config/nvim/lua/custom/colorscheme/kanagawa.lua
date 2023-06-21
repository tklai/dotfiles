local kanagawa = vim.F.npcall(require, "kanagawa")
if not kanagawa then
  return
end

kanagawa.setup({
  dimInactive = true,
  overrides = function(colors)
    local overrides = {}

    -- Telescope
    if vim.F.npcall(require, "telescope") then
      overrides = vim.tbl_extend("force", overrides, {
        TelescopeNormal = {
          bg = colors.theme.ui.bg,
        },
        TelescopeSelection = {
          bg = colors.theme.ui.bg,
        },
        TelescopeBorder = {
          fg = colors.theme.ui.bg,
          bg = colors.theme.ui.bg,
        },
        TelescopePromptBorder = {
          fg = colors.theme.ui.bg,
          bg = colors.theme.ui.bg,
        },
        TelescopePromptNormal = {
          fg = colors.theme.ui.fg,
          bg = colors.theme.ui.bg,
        },
        TelescopePromptPrefix = {
          fg = colors.palette.autumnRed,
          bg = colors.theme.ui.bg,
        },
        TelescopePromptTitle = {
          fg = colors.theme.ui.float.bg,
          bg = colors.theme.syn.number,
        },
        TelescopePreviewTitle = {
          fg = colors.theme.ui.float.bg,
          bg = colors.theme.diag.ok,
        },
        TelescopePreviewNormal = {
          fg = colors.theme.ui.fg,
          bg = colors.theme.ui.bg_m1,
        },
        TelescopePreviewBorder = {
          fg = colors.theme.ui.bg_m1,
          bg = colors.theme.ui.bg_m1,
        },
        TelescopeResultsTitle = {
          fg = colors.theme.ui.float.bg,
          bg = colors.theme.syn.fun,
        },
        TelescopeResultsNormal = {
          fg = colors.theme.ui.fg,
          bg = colors.theme.ui.bg_m2,
        },
        TelescopeResultsBorder = {
          fg = colors.theme.ui.bg_m2,
          bg = colors.theme.ui.bg_m2,
        },
      })
    end

    -- Illuminate
    if vim.F.npcall(require, "Illuminate") then
      overrides = vim.tbl_extend("force", overrides, {
        IlluminatedWordText = {
          bg = colors.theme.ui.bg_m1,
        },
        IlluminatedWordRead = {
          bg = colors.theme.ui.bg_m1,
        },
        IlluminatedWordWrite = {
          bg = colors.theme.ui.bg_m1,
        },
      })
    end

    return overrides
  end,
  background = {
    dark = "wave",
    light = "lotus",
  },
})

vim.cmd.colorscheme("kanagawa")
