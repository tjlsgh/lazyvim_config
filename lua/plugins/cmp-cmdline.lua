-- return {
--   {
--     "hrsh7th/cmp-cmdline",
--     event = "InsertEnter",
--     config = function()
--       local cmp = require("cmp")
--       local config = cmp.get_config()
--       table.insert(config.sources, {
--         name = "path",
--       })
--       table.insert(config.sources, {
--         name = "cmdline",
--         option = {
--           ignore_cmds = { "Man", "!" },
--         },
--       })
--       config.mapping = cmp.mapping.preset.cmdline()
--       -- `:` cmdline setup.
--       cmp.setup.cmdline(":", config)
--       -- `/` cmdline setup.
--       cmp.setup.cmdline("/", {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = {
--           { name = "buffer" },
--         },
--       })
--       cmp.setup(config)
--     end,
--   },
--
--   {
--     "dmitmel/cmp-cmdline-history",
--     event = "InsertEnter",
--     config = function()
--       local cmp = require("cmp")
--       local config = cmp.get_config()
--       table.insert(config.sources, {
--         name = "cmdline_history",
--       })
--       config.mapping = cmp.mapping.preset.cmdline()
--       cmp.setup.cmdline(":", config)
--       cmp.setup(config)
--     end,
--   },
-- }

return {
  "hrsh7th/cmp-cmdline",
  -- enabled = false,
  keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = function()
    local cmp = require("cmp")
    return {
      {
        type = "/",
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      },
      {
        type = ":",
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      },
    }
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    vim.tbl_map(function(val)
      cmp.setup.cmdline(val.type, val)
    end, opts)
  end,
}
