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

-- Check if packer is installed and do it otherwise
require "iker.first_load"

-- This should be set early in the config so that other plugins can use it
vim.g.mapleader = " "

-- Turn off builtin plugins I don't use
require "iker.disable_builtin"

-- Setup plugins and LSP configuration
require "iker.plugins"
require "iker.lsp"

-- Setup mappings, vim options, and autocommands
require "iker.mappings"
require "iker.options"
require "iker.au"
