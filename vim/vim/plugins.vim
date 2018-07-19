call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'joereynolds/deoplete-minisnip' " Snippets completion with deoplete
Plug 'joereynolds/vim-minisnip' " Snippets

Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Raimondi/delimitMate'

Plug 'PotatoesMaster/i3-vim-syntax'

" Theme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-airline' " Status bar

Plug 'epmatsw/ag.vim' " The silver searcher 'ag' search
Plug 'pbrisbin/vim-mkdir'
Plug 'sjl/gundo.vim' " Awesome undo, press F5
Plug 'calleerlandsson/pick.vim' " Fuzzy finder
Plug 'tpope/vim-abolish' " words variation, alias for typo words in all form, substitute with multiple form (singular, plural), and change case
Plug 'tpope/vim-commentary' " Comment line/block... witch gcc, gc in visual, gcap for a paragraph
Plug 'tpope/vim-dispatch' " Send command to the system, run them in a tmux split and open a vim buffer with the result when it's done
Plug 'tpope/vim-fugitive' " Git tools: Gblame, Gdiff, GStatus...
Plug 'tpope/vim-repeat' " add repeat with . to plugins
Plug 'tpope/vim-speeddating' " Handle date nicely, use <C-a>, <C-x> to increment/decrement dates
Plug 'tpope/vim-surround' " Surroung selection, word.. with something
Plug 'tpope/vim-unimpaired'

" Linter/fixer

" Elixir Support 
Plug 'elixir-editors/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'slashmili/alchemist.vim'

" Javascript Support
" Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' }
Plug 'wokalski/autocomplete-flow'
Plug 'prettier/vim-prettier'
Plug 'flowtype/vim-flow'
Plug 'mxw/vim-jsx'

" Scss Support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" Web Support
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'css', 'scss', 'html', 'eex', 'mason'] }

" Python Support
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Markdown Support
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

call plug#end()
