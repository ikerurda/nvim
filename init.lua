--
--  ░▀█▀░▒█▄░▒█░▀█▀░▀▀█▀▀░░░░▒█░░▒█░▀█▀░▒█▀▄▀█
--  ░▒█░░▒█▒█▒█░▒█░░░▒█░░░▄▄░░▒█▒█░░▒█░░▒█▒█▒█
--  ░▄█▄░▒█░░▀█░▄█▄░░▒█░░░▀▀░░░▀▄▀░░▄█▄░▒█░░▒█
--
--  Config file for NVIM. Created by Iker Urdaniz.
--
require "impatient"

if require "iker.first_load"() then return end

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader
vim.g.mapleader = " "

-- Setup vim options, autocommands and mappings
require "iker.options"
require "iker.au"
require "iker.mappings"

-- Turn off builtin plugins I do not use
require "iker.disable_builtin"

-- Setup plugins and LSP configuration
require "iker.plugins"
require "iker.lsp"
