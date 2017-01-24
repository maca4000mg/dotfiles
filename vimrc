"set nocompatible
set number
set hlsearch
"set visualbell
" tabの代わりにスペースを入力
set expandtab
set autoindent
set shiftwidth=4
"set smartindent
" for birdstar src
set tabstop=8
set softtabstop=4
set noswapfile
" コマンドラインに使われる画面上の行数
set cmdheight=1
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
set statusline=%<%f\
"%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cursorline

" 左右のカーソル移動で行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

" スクロールの余裕を確保する
set scrolloff=2

" 行を折り返し表示しない
set nowrap

" カラムラインを表示する
"set colorcolumn=80

set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 特殊文字表示設定
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
" 全角スペース表示
"function! ZenkakuSpace()
"               highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse
"guifg=DarkMagenta
"       endfunction
"
"if has('syntax')
"               augroup ZenkakuSpace
"               autocmd!
"               autocmd ColorScheme       * call ZenkakuSpace()
"               autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
"               augroup END
"               call ZenkakuSpace()
"endif


" 常に拡張正規表現を使用
nnoremap / /\v



""""""""from http://qiita.com/muran001/items/3080c4816b7c2e65e40b""""""""""""""

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
 "   call neobundle#rc(expand('~/.vim/bundle'))
    call neobundle#begin(expand('~/.vim/bundle'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'
"call unite#set_profile('default', 'context', {'ignorecase':1})
"call unite#custom#profile('default', 'context', {
"    \ 'ignorecase': 1,
"    \ 'smartcase' : 1,
"    \ })
"call unite#custom#profile('default', 'ignorecase', 1)
let g:unite_enable_start_insert=1
let g:unite_source_history_yan_enable=1
let g:unite_source_file_mru_limit=100
nnoremap <silent> ,f :<C-u>Unite file<CR>
nnoremap <silent> ,r :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>
nnoremap <silent> ,t :<C-u>Unite tab<CR>

" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'will133/vim-dirdiff' ---> install NG.
NeoBundle 'soramugi/auto-ctags.vim'
"NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'junegunn/fzf'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

call neobundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

syntax on
"set background=dark
"colorscheme solarized

"マウス使用有効化
"memo: Shift＋マウスボタン同時押下で，マウス無効時と同じ操作が可能．
set mouse=a
set ttymouse=xterm2

" 外部grep設定
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -ni

" 折りたたみ有効化
set foldmethod=syntax

" ESC連打で検索ハイライトを消去
nnoremap <ESC><ESC> :nohlsearch<CR>

" ファイルオープン時，カーソル位置を復元
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g `\"" | endif

" TeraTerm向け 日本語入力切替設定
" 挿入モードに入る時，前回の挿入モード時のIME状態を復元
set t_SI+=[<r
" 挿入モードを出る時，現在のIME状態を保存
"set t_EI+=[<s[<0t
" 挿入モードを出る時，IME状態＝無効を保存
set t_EI+=[<0t[<s
" vim終了時，IME状態＝無効を保存
set t_te+=[<0t[<s
set timeoutlen=100

