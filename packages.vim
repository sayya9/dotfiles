" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" General enhancements
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'nelstrom/vim-visual-star-search'

" Custom textobjects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" Ansible
Plug 'chase/vim-ansible-yaml'

" Terraform
Plug 'hashivim/vim-terraform'

" File system explorer
Plug 'preservim/nerdtree'

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Dim paragraphs above and below the active paragraph
Plug 'junegunn/limelight.vim'

" Briefly highlight which text was yanked
Plug 'machakann/vim-highlightedyank'

" Display the branch name in the statusline
Plug 'itchyny/vim-gitbranch'

" Initialize plugin system
call plug#end()
