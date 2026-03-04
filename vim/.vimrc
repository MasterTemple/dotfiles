" Source: https://github.com/MasterTemple/dotfiles/blob/main/vim/.vimrc

" source computer-specific configuration files
" so ~/OneDrive\ -\ caci_caci/Documents/development/languages/vim/cmds.vim

" text coloring
syntax on
colorscheme koehler

" search
set ignorecase " I need this enabled to use smartcase
set smartcase
set hlsearch

" navigation
set autochdir

" line number
set rnu
set number!
set cursorline
set cursorlineopt=both
highlight CursorLineNr cterm=bold gui=bold ctermfg=red guifg=red

" use system clipboard by default
set clipboard=unnamed

" qf next/prev
nnoremap <A-n> :cnext<CR>zz
nnoremap <A-p> :cprev<CR>zz

" move current line up/down
nnoremap <A-k> :m .-2<CR>zz
nnoremap <A-j> :m .+1<CR>zz

" move visual selection up/down (gv: reselect; =gv: auto-indent; zz: center)
vnoremap <A-k> :m '<-2<CR>gv=gvzz
vnoremap <A-j> :m '>+1<CR>gv=gvzz

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent

" jk -> normal mode
inoremap jk <Esc>

" shift+y copies from the cursor to the end of the line (like shift+c, shift+d, ..)
nnoremap Y v$hy

" when hitting escape, clear highlighting
nnoremap <Esc> :noh<CR><Esc>

" always center cursor
nnoremap j jzz
nnoremap k kzz
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap j jzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" custom text objects
nnoremap di/ t/vT/d
nnoremap vi/ t/vT/
nnoremap yi/ t/vT/y
nnoremap ci/ t/vT/s
nnoremap da/ f/vF/d
nnoremap va/ f/vF/
nnoremap ya/ f/vF/y
nnoremap ca/ f/vF/s

nnoremap vi* t*vT*
nnoremap yi* t*vT*y
nnoremap ci* t*vT*s
nnoremap da* f*vF*d
nnoremap va* f*vF*
nnoremap ya* f*vF*y
nnoremap ca* f*vF*s

nnoremap vi` t`vT`
nnoremap yi` t`vT`y
nnoremap ci` t`vT`s
nnoremap da` f`vF`d
nnoremap va` f`vF`
nnoremap ya` f`vF`y
nnoremap ca` f`vF`s

nnoremap vi, t,vT,
nnoremap yi, t,vT,y
nnoremap ci, t,vT,s
nnoremap da, f,vF,d
nnoremap va, f,vF,
nnoremap ya, f,vF,y
nnoremap ca, f,vF,s

nnoremap di- t-vT-d
nnoremap vi- t-vT-
nnoremap yi- t-vT-y
nnoremap ci- t-vT-s
nnoremap da- f-vF-d
nnoremap va- f-vF-
nnoremap ya- f-vF-y
nnoremap ca- f-vF-s

nnoremap di_ t_vT_d
nnoremap vi_ t_vT_
nnoremap yi_ t_vT_y
nnoremap ci_ t_vT_s
nnoremap da_ f_vF_d
nnoremap va_ f_vF_
nnoremap ya_ f_vF_y
nnoremap ca_ f_vF_s

nnoremap di: t:vT:d
nnoremap vi: t:vT:
nnoremap yi: t:vT:y
nnoremap ci: t:vT:s
nnoremap da: f:vF:d
nnoremap va: f:vF:
nnoremap ya: f:vF:y
nnoremap ca: f:vF:s

nnoremap di+ t+vT+d
nnoremap vi+ t+vT+
nnoremap yi+ t+vT+y
nnoremap ci+ t+vT+s
nnoremap da+ f+vF+d
nnoremap va+ f+vF+
nnoremap ya+ f+vF+y
nnoremap ca+ f+vF+s

nnoremap di; t;vT;d
nnoremap vi; t;vT;
nnoremap yi; t;vT;y
nnoremap ci; t;vT;s
nnoremap da; f;vF;d
nnoremap va; f;vF;
nnoremap ya; f;vF;y
nnoremap ca; f;vF;s

nnoremap di% t%vT%d
nnoremap vi% t%vT%
nnoremap yi% t%vT%y
nnoremap ci% t%vT%s
nnoremap da% f%vF%d
nnoremap va% f%vF%
nnoremap ya% f%vF%y
nnoremap ca% f%vF%s

nnoremap di\\ t\\vT\\d
nnoremap vi\\ t\\vT\\
nnoremap yi\\ t\\vT\\y
nnoremap ci\\ t\\vT\\s
nnoremap da\\ f\\vF\\d
nnoremap va\\ f\\vF\\
nnoremap ya\\ f\\vF\\y
nnoremap ca\\ f\\vF\\s

nnoremap di# t#vT#d
nnoremap vi# t#vT#
nnoremap yi# t#vT#y
nnoremap ci# t#vT#s
nnoremap da# f#vF#d
nnoremap va# f#vF#
nnoremap ya# f#vF#y
nnoremap ca# f#vF#s

nnoremap di\| t\|vT\|d
nnoremap vi\| t\|vT\|
nnoremap yi\| t\|vT\|y
nnoremap ci\| t\|vT\|s
nnoremap da\| f\|vF\|d
nnoremap va\| f\|vF\|
nnoremap ya\| f\|vF\|y
nnoremap ca\| f\|vF\|s

nnoremap di. t.vT.d
nnoremap vi. t.vT.
nnoremap yi. t.vT.y
nnoremap ci. t.vT.s
nnoremap da. f.vF.d
nnoremap va. f.vF.
nnoremap ya. f.vF.y
nnoremap ca. f.vF.s
