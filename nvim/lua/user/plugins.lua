local packer = require("packer")



return packer.startup(function(use)
        -- Plugins go here!
        use "wbthomason/packer.nvim"            -- get autoupdates for packer
        use "preservim/nerdtree"                -- file manager
end)
