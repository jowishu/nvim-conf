set nocompatible " be iMproved, required
filetype on " required

call plug#begin('~/.config/nvim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-powerline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'luochen1990/rainbow' " Rainbow Parentheses Improved
Plug 'flazz/vim-colorschemes'
Plug 'farmergreg/vim-lastplace'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'nickhutchinson/vim-cmake-syntax'
Plug 'vim-scripts/taglist.vim'
Plug 'leafgarland/typescript-vim' " syntax
Plug 'Shougo/vimshell.vim'
Plug 'rhysd/vim-clang-format'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimlab/split-term.vim'
Plug 'rust-lang/rust.vim'
Plug 'chiphogg/vim-prototxt'
Plug 'tell-k/vim-autopep8'
call plug#end()

filetype plugin indent on " required
let mapleader=","
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Wq :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
set incsearch " 实时搜索
set noignorecase " 搜索时大小写不敏感
set nocompatible " 关闭兼容模式
set backspace=indent,eol,start
set wildmenu " 开启vim自带补s
set wildmode=longest:list,full
set mouse=a " 开启鼠标控制vim
set number " 显示行号
set nobackup " 设置不要backup文件
set noswapfile " 设置不要swap文件
set colorcolumn=80
set autoread "自动读取buffer变更
set display =lastline " show as much as possible of the last line
set showmode " show current mode in command line
set showcmd " show already typed keys when more are expected.
set splitbelow " open new windows below the current window
set splitright " open new windows right of the current window
set wrapscan " searches wrap around end of file
set report=0 " always report changed lines
set synmaxcol=200 " only highlight the first 200 columns
set wrap    " 折行
" 配色
colorscheme distinguished
set background=dark

" 状态栏
set laststatus=2 " 总是显示状态栏
set ruler " 显示光标当前位置
set cursorline " 高亮显示当前行
set hlsearch " 高亮显示搜索结果

" 语法高亮
syntax enable " 开启语法高亮
syntax on " 允许使用指定语法高亮配色方案替换默认方案

" cpp stl highlight " vim-cpp-enhanced-highlight
syntax keyword cppSTLtype initializer_list  

" 缩进
filetype indent on " 自适应不同语言的智能缩进
set expandtab " 将制表拓展为空格
set tabstop=2 " 设置编辑是制表占用的空格
set shiftwidth=2 " 设置格式化是制表占用的空格
set softtabstop=2 " 连续数量的空格视为制表
let g:indent_guides_enable_on_vim_startup=1 " 随vim自启动
let g:indent_guides_start_level=2 " 从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1 " 色块宽度
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 代码折叠
set foldmethod=indent " 基于缩进尽心代码折叠, 操作: za打开或关闭折叠
set nofoldenable " 启动vim是关闭代码折叠
set showmode
set showcmd
set scrolloff=3 " 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set showmatch " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set autochdir " 自动切换工作目录
set noerrorbells " 出错时不发出声响

" NERDTree
map <C-e> :NERDTreeToggle<CR> " ctrl-e触发NERDTree

"" ycm
let g:ycm_key_invoke_completion = '<C-a>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_warning_symbol = '!'
let g:ycm_error_symbol = 'x'
map<C-k> :pyf ~/.local/clang/share/clang/clang-format.py<CR>
nnoremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-x> :YcmCompleter FixIt<CR>
let g:ycm_confirm_extra_conf=0

"" vim-clang-format
nnoremap <C-f> :ClangFormat<CR>

" UltiSnips
" 解决与 YCM 插件的冲突
" let g:UltiSnipsExpandTrigger="<C-j>"
" let g:UltiSnipsJumpForwardTrigger="<C-j>"
" let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:rbpt_colorpairs = [
\ ['brown', 'RoyalBlue3'],
\ ['Darkblue', 'SeaGreen3'],
\ ['darkgray', 'DarkOrchid3'],
\ ['darkgreen', 'firebrick3'],
\ ['darkcyan', 'RoyalBlue3'],
\ ['darkred', 'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown', 'firebrick3'],
\ ['gray', 'RoyalBlue3'],
\ ['black', 'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue', 'firebrick3'],
\ ['darkgreen', 'RoyalBlue3'],
\ ['darkcyan', 'SeaGreen3'],
\ ['darkred', 'DarkOrchid3'],
\ ['red', 'firebrick3'],
\ ]

" map wq
:command WQ wq
:command Wq wq
:command W w
:command Q q

"" rainbow
let g:rainbow_active = 1
let g:rbpt_max = 16

" statusline
if has('statusline')
set laststatus=2
set statusline=%<%f\
set statusline+=%w%h%m%r
set statusline+=\ [%{&ff}/%Y]
set statusline+=\ [%{getcwd()}]
set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

" vim-lastplace
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Taglist
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口
map <silent> <C-l> :TlistToggle<CR> " Ctrl-t触发TagList
set tags=tags;/

" Don't indent namespace and template
function! CppNoNamespaceAndTemplateIndent()
  let l:cline_num = line('.')
  let l:cline = getline(l:cline_num)
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    let l:pline_num = prevnonblank(l:pline_num - 1)
    let l:pline = getline(l:pline_num)
  endwhile

  let l:retv = cindent('.')
  let l:pindent = indent(l:pline_num)
  if l:pline =~# '^\s*template\s*\s*$'
    let l:retv = l:pindent
  elseif l:pline =~# '\s*typename\s*.*,\s*$'
    let l:retv = l:pindent
  elseif l:cline =~# '^\s*>\s*$'
    let l:retv = l:pindent - &shiftwidth
  elseif l:pline =~# '\s*typename\s*.*>\s*$'
    let l:retv = l:pindent - &shiftwidth
  elseif l:pline =~# '^\s*namespace.*'
    let l:retv = 0
  endif
  return l:retv
endfunction

if has("autocmd")
  autocmd BufEnter *.{cc,cxx,cpp,h,hh,hpp,hxx} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()
endif

" vim cpp enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" vim cmake highlighting
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake

nmap w[ :vertical resize -3<CR>
nmap w[ :vertical resize +3<CR>
nmap <C-m>  :tabnew %<CR>
nmap <C-c>  :tabc<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" vim gitgutter
let g:gitgutter_max_signs = 2000

autocmd BufRead,BufNewFile *.h,*.cpp,*.hpp,*.cc setfiletype cpp
autocmd BufRead,BufNewFile *.rs setfiletype rust
autocmd FileType cpp setlocal spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" json format
nmap <C-s> :%!jq '.'<CR>

let g:vmt_auto_update_on_save = 0
let g:rustfmt_autosave = 1
let g:ycm_rust_src_path='~/code/rust/rust-lang/src/'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
inoremap <leader>; <C-x><C-o>

" vim autopep8
let g:autopep8_disable_show_diff=1
let g:autopep8_indent_size=4
let g:autopep8_aggressive=1
map <leader>f :Autopep8<CR>
