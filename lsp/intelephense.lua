-- license to be placed in $HOME/intelephense/licence.txt
return {
  settings = {
    intelephense = {
      environment = {
        phpVersion = "8.3",
      },
      codeLens = {
        references = { enable = true },
        implementations = { enable = true },
        usages = { enable = true },
        overrides = { enable = true },
        parent = { enable = true },
      },
      inlayHints = {
        returnTypes = true,
        parameterTypes = true,
      },
    },
  },
}
