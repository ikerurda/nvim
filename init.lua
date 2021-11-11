--
--  ░▀█▀░▒█▄░▒█░▀█▀░▀▀█▀▀░░░░▒█░░▒█░▀█▀░▒█▀▄▀█
--  ░▒█░░▒█▒█▒█░▒█░░░▒█░░░▄▄░░▒█▒█░░▒█░░▒█▒█▒█
--  ░▄█▄░▒█░░▀█░▄█▄░░▒█░░░▀▀░░░▀▄▀░░▄█▄░▒█░░▒█
--
--  Config file for NVIM. Created by Iker Urdaniz.
--
pcall(require, "impatient")

if require "iker.first_load"() then return end

-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader
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
