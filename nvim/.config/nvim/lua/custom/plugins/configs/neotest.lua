-- Neotest test runner configuration

local M = {}

function M.setup()
  require('neotest').setup({
    adapters = {
      require('neotest-jest')({
        jestCommand = "npm test --",
      }),
    }
  })
end

return M
