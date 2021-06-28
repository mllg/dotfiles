" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/michel/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/michel/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/michel/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/michel/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/michel/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["editorconfig-vim"] = {
    config = { '\27LJ\1\2Z\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0' },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  move = {
    config = { "\27LJ\1\2π\2\0\0\6\0\17\0 4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\3\0007\0\4\0\16\1\0\0%\2\5\0%\3\6\0%\4\a\0003\5\b\0>\1\5\1\16\1\0\0%\2\5\0%\3\t\0%\4\n\0003\5\v\0>\1\5\1\16\1\0\0%\2\f\0%\3\6\0%\4\r\0003\5\14\0>\1\5\1\16\1\0\0%\2\f\0%\3\t\0%\4\15\0003\5\16\0>\1\5\1G\0\1\0\1\0\1\fnoremap\1\22<Plug>MoveBlockUp\1\0\1\fnoremap\1\24<Plug>MoveBlockDown\6v\1\0\1\fnoremap\1\21<Plug>MoveLineUp\n<C-k>\1\0\1\fnoremap\1\23<Plug>MoveLineDown\n<C-j>\6n\20nvim_set_keymap\bapi\18move_map_keys\6g\bvim\0" },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/move"
  },
  neogit = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/neogit"
  },
  nordbuddy = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/nordbuddy"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\1\2∆\2\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\b\14ultisnips\1\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\nvsnip\1\tcalc\2\15treesitter\2\tpath\2\1\0\f\17autocomplete\2\19source_timeout\3»\1\fenabled\2\ndebug\1\14preselect\venable\19max_abbr_width\3d\21incomplete_delay\3ê\3\19max_menu_width\3d\19max_kind_width\3d\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\1\2Ê\2\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\b\0003\3\3\0003\4\4\0:\4\5\0033\4\6\0:\4\a\3:\3\t\0023\3\n\0003\4\v\0:\4\f\3:\3\r\2:\2\15\1>\0\2\1G\0\1\0\16textobjects\1\0\0\vselect\fkeymaps\1\0\5\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aia\21@parameter.inner\aic\17@class.inner\1\0\1\venable\2\tswap\1\0\0\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  r = {
    config = { "\27LJ\1\2›\2\0\0\6\0\19\0!4\0\0\0007\0\1\0'\1\0\0:\1\2\0'\1\0\0:\1\3\0'\1\1\0:\1\4\0%\1\6\0:\1\5\0'\1\0\0:\1\a\0'\1\0\0:\1\b\0'\1\0\0:\1\t\0004\1\0\0007\1\n\0017\1\v\1%\2\f\0%\3\r\0%\4\14\0003\5\15\0>\1\5\0014\1\0\0007\1\n\0017\1\v\1%\2\16\0%\3\r\0%\4\17\0003\5\18\0>\1\5\1G\0\1\0\1\0\1\fnoremap\1\21<Plug>RDSendLine\6n\1\0\1\fnoremap\1\26<Plug>RDSendSelection\n<A-r>\6v\20nvim_set_keymap\bapi\24r_indent_align_args\15R_openhtml\14R_openpdf\15horizontal\16R_nvimpager\28rout_follow_colorscheme\18R_applescript\rR_assign\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/opt/r"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-cdroot"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-cdroot"
  },
  ["vim-devtools-plugin"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-devtools-plugin"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-endwise"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-startify"] = {
    config = { "\27LJ\1\2¡\1\0\0\3\0\a\0\0154\0\0\0007\0\1\0002\1\4\0003\2\3\0;\2\1\0013\2\4\0;\2\2\0013\2\5\0;\2\3\1:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0G\0\1\0\27startify_change_to_dir\1\0\1\6r\16~/.Rprofile\1\0\1\6f\31~/.config/fish/config.fish\1\0\1\6n\28~/.config/nvim/init.vim\23startify_bookmarks\6g\bvim\0" },
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/michel/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: move
time([[Config for move]], true)
try_loadstring("\27LJ\1\2π\2\0\0\6\0\17\0 4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\3\0007\0\4\0\16\1\0\0%\2\5\0%\3\6\0%\4\a\0003\5\b\0>\1\5\1\16\1\0\0%\2\5\0%\3\t\0%\4\n\0003\5\v\0>\1\5\1\16\1\0\0%\2\f\0%\3\6\0%\4\r\0003\5\14\0>\1\5\1\16\1\0\0%\2\f\0%\3\t\0%\4\15\0003\5\16\0>\1\5\1G\0\1\0\1\0\1\fnoremap\1\22<Plug>MoveBlockUp\1\0\1\fnoremap\1\24<Plug>MoveBlockDown\6v\1\0\1\fnoremap\1\21<Plug>MoveLineUp\n<C-k>\1\0\1\fnoremap\1\23<Plug>MoveLineDown\n<C-j>\6n\20nvim_set_keymap\bapi\18move_map_keys\6g\bvim\0", "config", "move")
time([[Config for move]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\1\2¡\1\0\0\3\0\a\0\0154\0\0\0007\0\1\0002\1\4\0003\2\3\0;\2\1\0013\2\4\0;\2\2\0013\2\5\0;\2\3\1:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\6\0G\0\1\0\27startify_change_to_dir\1\0\1\6r\16~/.Rprofile\1\0\1\6f\31~/.config/fish/config.fish\1\0\1\6n\28~/.config/nvim/init.vim\23startify_bookmarks\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\1\2Ê\2\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\b\0003\3\3\0003\4\4\0:\4\5\0033\4\6\0:\4\a\3:\3\t\0023\3\n\0003\4\v\0:\4\f\3:\3\r\2:\2\15\1>\0\2\1G\0\1\0\16textobjects\1\0\0\vselect\fkeymaps\1\0\5\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aia\21@parameter.inner\aic\17@class.inner\1\0\1\venable\2\tswap\1\0\0\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2∆\2\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\b\14ultisnips\1\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\nvsnip\1\tcalc\2\15treesitter\2\tpath\2\1\0\f\17autocomplete\2\19source_timeout\3»\1\fenabled\2\ndebug\1\14preselect\venable\19max_abbr_width\3d\21incomplete_delay\3ê\3\19max_menu_width\3d\19max_kind_width\3d\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
try_loadstring('\27LJ\1\2Z\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0', "config", "editorconfig-vim")
time([[Config for editorconfig-vim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType r ++once lua require("packer.load")({'r'}, { ft = "r" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'r'}, { ft = "rmd" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/michel/.local/share/nvim/site/pack/packer/opt/r/ftdetect/r.vim]], true)
vim.cmd [[source /home/michel/.local/share/nvim/site/pack/packer/opt/r/ftdetect/r.vim]]
time([[Sourcing ftdetect script at: /home/michel/.local/share/nvim/site/pack/packer/opt/r/ftdetect/r.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
