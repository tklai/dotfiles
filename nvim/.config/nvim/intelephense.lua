return {
  settings = {
    intelephense = {
      files = {
        exclude = {
          "**/.git/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/vendor/**/{Tests,tests}/**",
          "**/vendor/**/vendor/**",
        },
      },
    },
  },
}
