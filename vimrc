source ~/github/personal/dotfiles/packages.vim

set nocompatible
set hidden
set history=5000
set pastetoggle=<F5>
set incsearch
set mouse=a
set splitright
set splitbelow
set foldenable

" Customize the way that Vim handles tab-completion at the command prompt
set wildmenu
set wildmode=full

" Make backspace work like most other programs: set backspace=indent,eol,start
set backspace=2

" Show whitespace and tab
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Highlight all matches
set hlsearch

" Change filetype
autocmd Filetype yaml set filetype=ansible expandtab
autocmd BufRead,BufNewFile,BufEnter *.yaml.j2 set filetype=ansible expandtab
autocmd BufNewFile,BufRead Dockerfile* setf dockerfile

" For lightline.vim
set laststatus=2

" Ignore East Asian characters
set spelllang=en,cjk

" Highlight the currnet line and column
" See: https://medium.com/usevim/highlight-the-current-line-b6ff8af798c7
hi cursorline cterm=none term=none
set cursorline
highlight CursorLine guibg=#303000 ctermbg=235
highlight CursorColumn guibg=#303000 ctermbg=237

" Highlight the SpellBad
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red

" For NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" For groovy
autocmd BufNewFile,BufRead Jenkinsfile* setf groovy
autocmd FileType groovy setlocal ts=4 sts=4 sw=4 expandtab autoindent

" Mappings
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
noremap <F3> :set cursorcolumn!<CR>
inoremap <F3> <C-o>:set cursorcolumn!<CR>
cnoremap <F3> <C-c>:set cursorcolumn!<CR>
noremap <F4> :set list!<CR>
inoremap <F4> <C-o>:set list!<CR>
cnoremap <F4> <C-c>:set list!<CR>
nnoremap <CR><CR> :nohlsearch<CR>
noremap <Leader>n nzz
noremap <Leader>N Nzz
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-e> :ExpandTabAndRetab<CR>
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

" MarkdownPreview Config
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'

" preservim/nerdtree
let NERDTreeShowHidden=1

" preservim/vim-markdown
autocmd FileType markdown let b:sleuth_autoatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

" iamcco/markdown-preview.nvim
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1

" junegunn/limelight.vim
let g:limelight_conceal_ctermfg=244

" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 1700

" itchyny/vim-gitbranch
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Functions
function! SetExpandTabAndRetab()
    set expandtab
    retab
endfunction

" Commands
command! ExpandTabAndRetab call SetExpandTabAndRetab()

source ~/.vim/coc-config.vim
source ~/.vim/coc-extensions.vim
