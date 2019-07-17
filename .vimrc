
" 基本設定 -----------------------------------------------------------
set fenc=utf-8		" 文字コードをUFT-8に設定
set nobackup		" バックアップファイルを作らない
set noswapfile		" スワップファイルを作らない
set autoread		" 編集中のファイルが変更されたら自動で読み直す
set hidden			" バッファが編集中でもその他のファイルを開けるように
set showcmd			" 入力中のコマンドをステータスに表示する
set mouse=a			" マウスモード有効
set pumheight=10    " 補完メニューの高さを10に設定する
set matchtime=1     " 対応する括弧にカーソルが飛ぶ時間を0.1に設定する(0.1の1倍)
set iminsert=2      " インサートモードから抜けると自動的にIMEをオフにする
set laststatus=2    " ステータス行を常に表示
set cmdheight=2     " メッセージ表示欄を2行確保

" キーバインド系 -----------------------------------------------------------
"Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>   <C-w>><CR>
nnoremap <S-Right>  <C-w><<CR>
nnoremap <S-Up>     <C-w>-<CR>
nnoremap <S-Down>   <C-w>+<CR>

"入力モード中のCtrl + j をEscとみなす
inoremap <C-j> <Esc>

"マッピングYを、行末までのヤンクにする
nnoremap Y y$

"数字のインクリメント、デクリメントを+ - にする
nnoremap + <C-a>
nnoremap - <C-x>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc> 

"==== C,C++設定 =====
"c,cppファイルをF4でコンパイルする
autocmd filetype cpp nnoremap <F4> :!g++ % -std=gnu++1y -O2 -o %:r <CR> 
autocmd filetype c   nnoremap <F4> :!g++ % -std=gnu++1y -O2 -o %:r <CR> 

"c,cppファイルをF5でコンパイルして実行までする
autocmd filetype cpp nnoremap <F5> :!g++ % -std=gnu++1y -O2 -o %:r ; ./%:r <CR> 
autocmd filetype c   nnoremap <F5> :!g++ % -std=gnu++1y -O2 -o %:r ; ./%:r <CR> 

"F6で実行だけする
autocmd filetype cpp nnoremap <F6> :!./%:r <CR> 
autocmd filetype c   nnoremap <F6> :!./%:r <CR> 

"==== Python設定 =====


" 見た目系 -----------------------------------------------------------
set number						  " 行番号を表示
set cursorline					  " 現在の行を強調表示
"set cursorcolumn				  " 現在の行を強調表示（縦）
set virtualedit=onemore			  " 行末の1文字先までカーソルを移動できるように
set smartindent					  " インデントはスマートインデント
"set visualbell					  " ビープ音を可視化
set showmatch					  " 括弧入力時の対応する括弧を表示
set laststatus=2				  " ステータスラインを常に表示
set wildmode=list:longest		  " コマンドラインの補完
set clipboard=unnamedplus		  " クリップボードの有効化

syntax enable					  " シンタックスハイライトの有効化

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~ 

" Tab系 -----------------------------------------------------------
"set list                        " 不可視文字の可視化
"set listchars=tab:▸             " 不可視文字を可視化(タブが「▸-」と表示される)
"set listchars=tab:             " 不可視文字を可視化(タブが「▸-」と表示される)
"set listchars=trail:-,eol:↲
set expandtab 					" Tab文字を半角スペースにする
set tabstop=4 					" 行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=4 				" 行頭でのTab文字の表示幅

" 検索系 -----------------------------------------------------------
set ignorecase					" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase					" 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch					" 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan					" 検索時に最後まで行ったら最初に戻る
set hlsearch					" 検索語をハイライト表示


" その他 -----------------------------------------------------------
"vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"プラグインが実際にインストールされるディレクトリ
let s:dein_path = expand('~/.vim/dein')

"dein.vim本体
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github からclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  "execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
  execute 'set runtimepath^=' . s:dein_repo_path
endif

"設定開始
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let g:config_dir  = expand('~/.vim/dein/userconfig')
  let s:toml        = g:config_dir . '/plugins.toml'
  let s:lazy_toml   = g:config_dir . '/plugins_lazy.toml'

  " TOML 読み込み
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
"設定終了

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" インストールされていないプラグインがあればインストールする
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------


" NERDTree の設定 -------------------------------------------------------------
" ディレクトリ表示の設定
let NERDTreeNodeDelimiter = "\t"
let g:NERDTreeGlyphReadOnly = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

"vim起動時にNERDTreeを自動起動させる
"autocmd VimEnter * execute 'NERDTree'

" F9 で NERDTree を起動
nnoremap <silent> <F9> :NERDTreeToggle<CR>

" F10 で NERDTree を起動
nnoremap <silent> <F8> :TrinityToggleAll<CR>

