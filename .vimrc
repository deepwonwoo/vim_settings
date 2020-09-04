" Use Vim settings, rather than Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line


"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'nanotech/jellybeans.vim'             " Theme
"Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'tmhedberg/SimpylFold'
Plugin 'rosenfeld/conque-term'              " Consoles as buffers
Plugin 'dense-analysis/ale'                 " syntex check
Plugin 'skywind3000/asyncrun.vim'           " 
Plugin 'ctrlpvim/ctrlp.vim'               "Ctrl + P for search file
Plugin 'ryanoasis/vim-devicons'            "  Nerdtree iconw
Plugin 'frazrepo/vim-rainbow'
Plugin 'preservim/nerdcommenter'            " comment multiple lines



"Plugin 'jiangmiao/auto-pairs'
"Plugin 'itchyny/lightline.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jeetsukumaran/vim-pythonsense'


call vundle#end()            " required
filetype plugin indent on    " required


set nu               " 왼쪽에 줄 번호를 표시
set mouse=a          " vim에서 마우스를 사용
set autoindent       " 자동으로 들여쓰기
set cursorline       " 커서가 있는 라인 강조
set ignorecase       " 검색 기능 사용 시 대소문자 무시
set ruler            " 오른쪽 하단에 현재 커서의 위치 표시
set title            " 열려 있는 파일을 창 타이틀에 표시
set encoding=utf-8


colorscheme jellybeans " 컬러 스킴 사용


" 창이동을 Ctrl+J,K,L,H
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" map은 normal모드와 visual모드, imap은 insert모드 단축키이다.
"=====================================================
""" Kite settings
"=====================================================
" insert the currently selected completion option with <Tab>
let g:kite_tab_complete=1
set completeopt+=menuone   " show the popup menu even when there is only 1 match
set completeopt+=noinsert  " don't insert any text until user chooses a match
set completeopt-=longest   " don't insert the longest common text
set completeopt+=preview
" autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg  " if vim beeps during completion




"=====================================================
""" NERDTree settings
"=====================================================
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
let NERDTreeQuitOnOpen=0 "the Nerdtree window will be close after a file is opend.
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" NerdTree를 Ctrl+N으로 키고 닫기 가능
map <C-N> <ESC>:NERDTreeToggle<CR> 
imap <C-N> <ESC>:NERDTreeToggle<CR>



"=====================================================
""" Conque settings
"=====================================================
nnoremap <F6> <ESC>:ConqueTermSplit bash<CR> 


"=====================================================
""" TagBar settings
"=====================================================
"let g:tagbar_autofocus=0
"let g:tagbar_width=42
"autocmd BufEnter *.py :call tagbar#autoopen(0)



"=====================================================
""" Ale settings
"=====================================================
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let b:ale_linters = ['flake8']
let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\   'ale#fixers#generic_python#BreakUpLongLines',
\   'yapf',
\]
nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
let g:ale_fix_on_save = 1


"=====================================================
""" Async settings
"=====================================================
augroup python_file
autocmd!
autocmd FileType python map <F5> :AsyncRun -mode=term -pos=bottom -rows=10 -raw python % <cr>
augroup END


"=====================================================
""" Simpley Fold settings
"=====================================================
" SimpleyFold plugin for python fold. Display docstirng when folded
let g:SimpylFold_docstring_preview = 1
" Enable folding with the spacebar
nnoremap <space> za




" <F9>를 눌러 python로 현재 버퍼를 실행할 수 있습니다.
nnoremap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<cr>
nmap <F10> :execute 'ConqueTermSplit ipython '.expand('%:p')<CR>
