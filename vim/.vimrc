" Source: https://gist.github.com/MasterTemple/f05e825a405fdd87b685562c67d69f10#file-vimrc

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

" line number
set rnu
set number!

" tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2

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
