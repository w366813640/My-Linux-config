" 在 markdown 中间编辑 table
let g:table_mode_corner='|'

" 调节 window 大小
let g:winresizer_start_key = 'ca'
" If you cancel and quit window resize mode by `q` (keycode 113)
let g:winresizer_keycode_cancel = 113

" 默认 markdown preview 在切换到其他的 buffer 或者 vim
" 失去焦点的时候会自动关闭 preview
let g:mkdp_auto_close = 0
" 书签选中之后自动关闭 quickfix window
let g:bookmark_auto_close = 1

" ctrl + ] 查询 cppman
" 如果想让该快捷键自动查询 man，将Cppman 替换为 Cppman!
autocmd FileType c,cpp noremap <C-]> <Esc>:execute "Cppman " . expand("<cword>")<CR>

" 让光标自动进入到popup window 中间
let g:git_messenger_always_into_popup = v:true

" 设置默认的 pdf 阅览工具
let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_conceal_default = 0
let g:tex_conceal = "" " 关闭所有隐藏设置

" 因为 telescope-coc 没有实现 outline，所以只能靠 telescope-heading.nvim 实现
func! Outline()
  if expand("%:e") ==# "md"
    exec "Telescope heading"
  else
    exec "Telescope coc document_symbols"
  endif
endf

" 实现一键运行各种文件，适合非交互式的，少量的代码，比如 leetcode
func! QuickRun()
  exec "w"
  let ext = expand("%:e")
  if ext ==# "md"
    exec "MarkdownPreview"
  elseif ext ==# "lua"
    exec "source %"
  else
    exec "RunCode"
  endif
endf

let g:vista_sidebar_position = "vertical topleft"
let g:vista_default_executive = 'coc'
let g:vista_finder_alternative_executives = 'ctags'

let g:floaterm_keymap_prev   = '<C-p>'
let g:floaterm_keymap_new    = '<C-n>'
let g:floaterm_keymap_toggle = '<C-t>'

" 使用 f/F 来快速移动
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
" nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=pink
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

let g:git_messenger_no_default_mappings = v:true

" 使用 gx 在 vim 中间直接打开链接
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" 不要让进入 vim 的时候光标在 nvim-tree 中，所以默认关闭 bookmarks
let g:auto_session_pre_save_cmds = ["NvimTreeClose", "BookmarkSave.vim-bookmarks"]
let g:auto_session_pre_restore_cmds = ["BookmarkLoad .vim-bookmarks"]

let g:bookmark_save_per_working_dir = 1
let g:bookmark_no_default_key_mappings = 1
