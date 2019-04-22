
   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   Plugin 'tpope/vim-fugitive'
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}

   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList       - lists configured plugins
   " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
   " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line

Plugin 'taglist.vim'
Plugin 'NERD_tree-Project'
Plugin 'The-NERD-tree'
Plugin 'SuperTab'


set nocompatible
set backspace=indent,eol,start

source ~/.vim/autoload/custom.vim

"NERDTree default setting
let NERDTreeWinPos="right"

"TagList default setting
let Tlist_Exit_OnlyWindow = 1

"ctags
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction


set tabstop=4
set shiftwidth=4
colorscheme asmanian_blood 

" " 设置行尾空格高亮显示
highlight WhitespaceEOL ctermbg=red guibg=red 
match WhitespaceEOL /\s\+$/



"keyboard mapping
nnoremap <F6> :call UpdateCtags()<CR>
nnoremap <F7> :TlistToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>
inoremap ( ()<ESC>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i

