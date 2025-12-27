return {
  init_options = {
    ["language_server_phpstan.enabled"] = true,
    ["language_server_psalm.enabled"] = false,
    ["language_server_worse_reflection.inlay_hints.enable"] = false,
    ["indexer.exclude_patterns"] = {
      "/vendor/**/Tests/**/*",
      "/vendor/**/tests/**/*",
      "/vendor/composer/**/*",
    },
    ["symfony.enabled"] = true,
  },
}
