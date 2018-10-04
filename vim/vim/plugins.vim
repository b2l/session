call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'

" Completion / Linting
Plug 'w0rp/ale'
Plug 'ervandew/supertab'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

Plug 'PotatoesMaster/i3-vim-syntax'

" Theme
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-airline'

Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-commentary' " Comment line/block... witch gcc, gc in visual, gcap for a paragraph
Plug 'tpope/vim-fugitive' " Git tools: Gblame, Gdiff, GStatus...
Plug 'tpope/vim-repeat' " add repeat with . to plugins
Plug 'tpope/vim-surround' " Surroung selection, word.. with something
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'


" Elixir Support 
Plug 'elixir-editors/vim-elixir'
Plug 'avdgaag/vim-phoenix'

" Javascript Support
Plug 'prettier/vim-prettier'
Plug 'flowtype/vim-flow'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
Plug 'Galooshi/vim-import-js', {'for': ['javascript', 'javascript.tsx'], 'do': 'yarn global add import-js@3.1.0'}


" Scss Support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" Web Support
Plug 'mattn/emmet-vim', { 'for': ['javascript','javascript.jsx' , 'css', 'scss', 'html', 'eex', 'mason'] }

call plug#end()
