let g:python3_host_prog = '/usr/local/Cellar/python/3.7.1/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')

" FZF
Plug '/Users/hobofan/.fzf'
Plug 'junegunn/fzf.vim'
" Use ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Solarized
Plug 'iCyMind/NeoSolarized'
" Display ident lines
Plug 'Yggdroot/indentLine'
autocmd Filetype json :IndentLinesDisable

"" Languageserver/client
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }

" Ctags (for better naviagtion in project)
" Plug 'ludovicchabant/vim-gutentags'
" let g:gutentags_cache_dir = '~/.cache/gutentags'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
" Autocomplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Jumping
Plug 'easymotion/vim-easymotion'
" Error/warning navigation
Plug 'tpope/vim-unimpaired'
" Ctag naviagtion
Plug 'majutsushi/tagbar'
" Automatic braces
Plug 'jiangmiao/auto-pairs'
" Toggling comments
Plug 'scrooloose/nerdcommenter'
" Linting
Plug 'w0rp/ale'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['typescriptreact'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fixers['python'] = ['black']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"" LANGUAGES / SYNTAX
" Javascript
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
" JSX
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
" Vue
Plug 'posva/vim-vue'
" Typescript
Plug 'leafgarland/typescript-vim'
" Rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
" let g:rustfmt_options = '--edition 2018'
" Solidity
Plug 'tomlion/vim-solidity'
" Godot
" Plug 'calviken/vim-gdscript3'

call plug#end()

let mapleader=" "

" set pwd to dir of current buffer
set autochdir
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ 'javascript': ['/Users/hobofan/.nvm/versions/node/v7.8.0/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:deoplete#enable_at_startup = 1

let g:NERDSpaceDelims = 1

colorscheme NeoSolarized
set termguicolors
set background=dark
set number

" ===== snippets default settings START
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-b>     <Plug>(neosnippet_expand_or_jump)
smap <C-b>     <Plug>(neosnippet_expand_or_jump)
xmap <C-b>     <Plug>(neosnippet_expand_target)

" ===== snippets default settings END

" ===== Folds START
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20
nnoremap , za

" Taken from https://github.com/pseewald/vim-anyfold/blob/0153540fed7ac14e2ee358bf103a3914dac074cd/autoload/anyfold.vim#L546
setlocal foldtext=MinimalFoldText()
function! MinimalFoldText() abort
    let fs = v:foldstart
    while getline(fs) !~ '\w'
        let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("  +  ", v:foldlevel)
    let lineCount = line("$")
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
    return line . expansionString . foldSizeStr . foldLevelStr
endfunction
" ===== Folds END

 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

"" Leader shortcuts
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>fa :Files
nnoremap <leader>ff :GFiles --cached --others --exclude-per-directory=.gitignore<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>ll :Lines<cr>
nnoremap <leader>lb :BLines<cr>

nnoremap <leader>vd :call LanguageClient#textDocument_definition()<CR> " d = definition
nnoremap <leader>vr :call LanguageClient#textDocument_rename()<CR> " r = rename
nnoremap <leader>vo :call LanguageClient#textDocument_references()<CR> " o = occurences
nnoremap <leader>vc :call LanguageClient#textDocument_completion()<CR> " c = completion

nmap ; <Plug>(easymotion-s2)
nnoremap <leader><tab> :b#<cr>
let g:NERDCreateDefaultMappings = 0
map <leader>cl <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
map <leader>cy <Plug>NERDCommenterYank('n', 'Yank')<Cr>

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" close deoplete popup without newline
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup() : "\<CR>"
endfunction

" reselect after indent
:vnoremap < <gv
:vnoremap > >gv

set expandtab
set shiftwidth=2
set softtabstop=2
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<
set list
