--                          o8o
-- ooo. .oo.  oooo    ooo oooo  ooo. .oo.  .oo.
-- `888P"Y88b  `88.  .8'  `888  `888P"Y88bP"Y88b
--  888   888   `88..8'    888   888   888   888
--  888   888    `888'     888   888   888   888
-- o888o o888o    `8'     o888o o888o o888o o888o
--
--  Config files for NEOVIM. Created by Iker Urdaniz.
--
pcall(require, "impatient")

-- Install packer if needed
require "iker.first_load"

-- Turn off builtin plugins I don't use
require "iker.disable_builtin"

-- Setup vim options and autocommands
require "iker.options"
require "iker.au"

-- Setup plugins, LSP configuration and mappings
require "iker.plugins"
require "iker.lsp"
require "iker.mappings"
