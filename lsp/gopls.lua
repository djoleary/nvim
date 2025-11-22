return {
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        test = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = false,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = false,
        rangeVariableTypes = true,
      },
    },
  },
}
