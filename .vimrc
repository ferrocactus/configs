execute pathogen#infect()
Helptags
filetype plugin indent on
syntax on

noremap <space> <Nop>
let mapleader = " "

" theme
colorscheme gruvbox
set background=dark
hi Normal ctermbg=none
highlight NonText ctermbg=none
highlight Visual cterm=bold ctermbg=DarkGray ctermfg=NONE
highlight Pmenu ctermfg=226 ctermbg=23 guifg=#ffff00 guibg=#005F5F
" Set syntax for extensionless files to dosini
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=dosini| endif

" Restart at same location upon opening file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" general options
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set number
set incsearch
set hlsearch
set colorcolumn=81
set splitbelow
set completeopt=longest,menuone

" nerd tree mapping
map <C-n> :NERDTreeToggle<CR>
" select all
map <C-a> ggVG
map! <C-a> <Esc>ggVG
" Tab navigation
nnoremap <C-left>   :tabprevious<CR>
nnoremap <C-right>  :tabnext<CR>
nnoremap <C-down>   :tabm -1<CR>
nnoremap <C-up>     :tabm +1<CR>
nnoremap <C-t>      :tabnew<CR>:source ~/.vimrc<CR>
inoremap <C-left>   <Esc>:tabprevious<CR>i
inoremap <C-right>  <Esc>:tabnext<CR>i
inoremap <C-down>   :tabm -1<CR>
inoremap <C-up>     :tabm +1<CR>
inoremap <C-t>      <Esc>:tabnew<CR>:source ~/.vimrc<CR>
nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CRr
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" remove trailing whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" one-shot compile
autocmd filetype cpp nnoremap <leader>k :w <bar> !g++ -ulimit -Wall -Wno-unused-result -Wno-unused-variable -std=c++17 % -o run && ./run <CR>
autocmd filetype cpp nnoremap <leader>r :w <bar> !./run <CR>
autocmd filetype py nnoremap <leader>k :w <bar> !python % <CR>

" auto comment
autocmd FileType cpp setlocal commentstring=//\ %s

" airline theme
let g:airline_theme='powerlineish'
let g:airline_section_c = '%F' " Full filepath

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

"save as root from within vim using :Sw
command! -nargs=0 Sw w !sudo tee % > /dev/null
" start terminal same dir
map <leader>cc :silent !{termite& -d `pwd`}<CR>
" yessss
imap jk <Esc>

"snippets
noremap <C-K> <Nop>
noremap <C-J> <Nop>
noremap <C-L> <Nop>
let g:ycm_use_ultisnips_completer = 1
let g:UltiSnipsSnippetsDir = $HOME."/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger = "<C-K>"
let g:UltiSnipsJumpForwardTrigger = "<C-L>"
let g:UltiSnipsJumpBackwardTrigger = "<C-J>"
let g:UltiSnipsEditSplit = "vertical"

"formatting
"noremap <buffer> <C-I> :Autoformat<CR>
let g:autopep8_cmd = $HOME."/code/py3.7/bin/autopep8"
autocmd FileType python noremap <buffer> <C-I> :call Autopep8()<CR>
let g:autopep8_max_line_length=80
let g:autopep8_indent_size=4
let g:autopep8_disable_show_diff=1
"let g:autopep8_on_save = 1
"rust
let g:rustfmt_autosave = 1
"c++
"let g:clang_format#auto_format = 1
autocmd FileType c,cpp,objc nnoremap <buffer><C-I> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><C-I> :ClangFormat<CR>

"latex options
let s:extfname = expand("%:e")
if s:extfname ==? "tex"
    let g:tex_flavor = "latex"
    set wrap lbr
    "move along wrapped lines
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj

    " put \begin{} \end{} tags tags around the current word
    "map  <C-B>          bi\begin{<End>}<CR>]]<ESC>ko
    "map! <C-B>          <ESC>bi\begin{<End>}<CR>]]<ESC>ko
    map  <C-B>          ^d$a\begin{<ESC>po]]<ESC>ko
    map! <C-B>          <ESC>^d$a\begin{<ESC>po]]<ESC>ko
    "let g:ycm_key_list_select_completion=['<C-J>']
    "let g:ycm_key_list_previous_completion=['<C-K>']

    let g:vimtex_mappings_enabled = 0
    let g:vimtex_delim_stopline = 50
    let g:LatexBox_split_type = "new"
    " qpdfview will highlight changes
    let g:vimtex_view_general_viewer = 'qpdfview'
    let g:vimtex_view_general_options
                \ = '--unique @pdf\#src:@tex:@line:@col'
    let g:vimtex_view_general_options_latexmk = '--unique'
    " unset space function to make localleader easier
    noremap <space> <Nop>
    let maplocalleader = " "
    let g:vimtex_complete_smart_case = 1
    let g:vimtex_complete_ignore_case = 1
    let g:vimtex_complete_close_braces = 1
    imap ]]       <plug>(vimtex-delim-close)
    nmap <localleader>l <plug>(vimtex-compile)
    nmap <localleader>s <plug>(vimtex-stop)
    nmap <localleader>v <plug>(vimtex-view)
    nmap <localleader>t <plug>(vimtex-toc-toggle)

    "autocompletion for latex
    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif
    let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
endif

"Configure the cursor to become a thin line when in insert mode
"and block when in normal mode
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' |
                \   silent execute '!echo -ne "\e[6 q"' | redraw! |
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[4 q"' | redraw! |
                \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" move lines up or down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>

" backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
