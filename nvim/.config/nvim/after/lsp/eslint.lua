return {
  root_dir = require("lspconfig").util.root_pattern(
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json"
  ),
}
