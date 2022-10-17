local lint = require('lint')

lint.linters_by_ft = {
   markdown = {'vale'},
   cpp = {'clang-tidy'},
   python = {'flake8'},
   nix = {'nix'},
   bash = {'shellcheck'},
   fish = {'shellcheck'},
   zsh = {'shellchecl'},
   lua = {'luacheck'},
   vint = {'vint'},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
   callback = function()
      lint.try_lint()
   end
})

