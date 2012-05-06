"-------------------------------------------------------------------------------
" plugin
"-------------------------------------------------------------------------------
set nocompatible
filetype off
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'scrooloose/nerdtree'

"-------------------------------------------------------------------------------
" plugin
"-------------------------------------------------------------------------------
" nerdtree
nnoremap <F6> :NERDTreeToggle<Enter>


"-------------------------------------------------------------------------------
" basics
"-------------------------------------------------------------------------------
filetype plugin indent on
set scrolloff=5                  " スクロール時の余白
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set expandtab                    " タブをスペースに
syntax on

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a

set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加

"-------------------------------------------------------------------------------
" statusline
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示
"カーソルが何行目の何列目に置かれているかを表示する
set ruler
"ステータスラインに文字コードと改行文字を表示する
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %l,%c%v%8p
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %l,%c%v%8p
endif

"入力モード時、ステータスラインのカラーを変更
augroup inserthook
autocmd!
autocmd insertenter * highlight statusline guifg=#ccdc90 guibg=#2e4340
autocmd insertleave * highlight statusline guifg=#2e4340 guibg=#ccdc90
augroup end

"-------------------------------------------------------------------------------
" apperance
"-------------------------------------------------------------------------------
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight zenkakuspace cterm=underline ctermfg=lightblue guibg=darkgray
match zenkakuspace /　/

" カーソル行をハイライト
set cursorline
" 最後に閉じた行
autocmd bufreadpost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal! g'\"" |
\ endif

"-------------------------------------------------------------------------------
" indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
set paste        " ペースト時にautoindentを無効に
"set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

" softtabstopはtabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，bsにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

"-------------------------------------------------------------------------------
" search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
" escの2回押しでハイライト消去
nmap <esc><esc> :nohlsearch<cr><esc>
" hit wordを画面中央に
nnoremap n nzz
nnoremap n nzz
nnoremap * *zz
nnoremap # #zz

"-------------------------------------------------------------------------------
" move
"-------------------------------------------------------------------------------
" カーソル位置の単語をyankする
nnoremap vy vawy
" 矩形選択で自由に移動する
set virtualedit+=block
" ビジュアルモード時vで行末まで選択
vnoremap v $h
" 全選択
noremap <c-a> ggvg

"-------------------------------------------------------------------------------
" encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd bufreadpost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif


