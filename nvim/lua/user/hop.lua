local hop = require('hop')
local direction = require('hop.hint').HintDirection

hop.setup({
    jump_on_sole_occurance = true,
    case_insensitive = true,
    uppercase_labels = true
})

vim.keymap.set('n', '<leader>s', ":HopWord<CR>", {remap = true, silent = true})

--[[
vim.keymap.set('', '<leader>j', function()
   hop.hint_char1({ direction = direction.AFTER_CURSOR}) 
end, {remap = true})

vim.keymap.set('', '<leader>k', function()
   hop.hint_char1({ direction = direction.BEFORE_CURSOR}) 
end, {remap = true})
--]]
