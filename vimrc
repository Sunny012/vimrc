 "/*************************************************************************
 "     > File Name: .vimrc
 "     > Author: wwz
 "     > Mail: wwz5251@outlook.com 
 "     > Created Time: 2018年04月25日 星期三 10时13分41秒
 "************************************************************************/

"#####################  Vundle Set  ######################"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'
Bundle 'vim-scripts/OmniCppComplete'
Plugin 'dyng/ctrlsf.vim'

Bundle 'https://github.com/vim-airline/vim-airline.git'
Bundle 'vim-airline/vim-airline-themes'

Bundle 'https://github.com/majutsushi/tagbar.git'

Bundle 'https://github.com/vim-scripts/SuperTab.git'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'

Bundle 'Yggdroot/LeaderF'
Bundle 'https://github.com/skywind3000/asyncrun.vim.git'
Bundle 'terryma/vim-multiple-cursors'


call vundle#end()            " required
filetype plugin indent on    " required

"#####################  VIM_AirLine Set  ########################"
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"#####################  NerdComment Set  ########################"
let mapleader=","
nmap cc ,cc<CR>
nmap cs ,cs<CR>
nmap ca ,ca<CR>

"#####################  NerdTree Set  ########################"
map <F2> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree     "open a NERDTree automatically when vim starts up

"open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1          
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

"##################### CtrlSf ##################"
"let g:ctrlsf_ackprg = ''
let g:ctrlsf_position = "right"
nmap <S-F> <Plug>CtrlSFPrompt -R -I '<c-r><c-w>' ./
let g:ctrlsf_auto_preview = 1
nmap <C-F> /<c-r><c-w>

let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_winsize = '30%'

let g:ctrlsf_mapping = {
         \ "popen": "e",
         \ "popenf": "e",
         \ }

"######################  TagBar&Ctags&Cscope Set ########################"
nnoremap <F3> :TagbarToggle<CR>
let g:tagbar_width=30   
let g:tagbar_ctags_bin='/usr/bin/ctags'          "the path of ctagsa
let g:tagbar_right=1                             "set tagbar is right    
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
set cscopequickfix=s-,c-,d-,i-,t-,e-
"open a tagbar when vim startup
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  

"##################### For Srech Fun ############################"
nn <F4> :AsyncRun rg <c-r><c-w> --vimgrep -o -g "{*.*}"
nn <silent><F4>c :AsyncRun rg <c-r><c-w> --vimgrep -o -g "{*.c}"<CR>

"###################### Basic Set #########################"
set nu                            "display Line Number

"remap h j k l
nnoremap i k
nnoremap k j
nnoremap j h

syntax on                     "Syntax Highlight

"set foldenable                    "Enable fold
"set foldmethod=manual  
"set nowrap                        "forbid code fold
"set foldmethod=indent
"set foldmethod=syntax    

set autoindent                    "set automatically indent
set cindent
set smartindent                   "set smart indent

set expandtab                     "expand '\t' to ''
set tabstop=4                     "set tab width 4
set softtabstop=4                 "uniform indent width of 4
set shiftwidth=4

set cursorline                    "highlight the current line
set cursorcolumn                  "high the current lumn

set nocp

"">>>wwz-start190401   -Del
""set lines=50     Delete them because it could cause my interface messy in ALiYun linux server
""set columns=140
""<<<wwz-end

set backspace=indent,eol,start

"nmap save & quit 
nmap w  :w<CR>  
nmap q  :q<CR>
nmap wq :wq<CR>

"remap some shortcutkey
nmap <c-t> :bn<CR>
nmap <c-c> :copen<CR>
let g:Lf_ShortcutF = '<C-P>'

"buffer cperate remap
let g:miniBufExplMaoCtabSwitchBufs=1

"newly build .c,.h,.sh,.java file,insert Header-information automatically.  
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetFileTitle()"
""define function SetTitle，automatically insert header
func SetFileTitle()   
"#########################  The file type is '.sh'  ###########################"
  
    if &filetype == 'sh'   
  
        call setline(1,"\#########################################################################")   
  
        call append(line("."), "\# File Name: ".expand("%"))   
  
        call append(line(".")+1, "\# Author: wwz")   
  
        call append(line(".")+2, "\# mail: wwz5251@outlook.com")   
  
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))   
  
        call append(line(".")+4, "\#########################################################################")   
  
        call append(line(".")+5, "\#!/bin/bash")   
  
        call append(line(".")+6, "")   
  
    else   
  
        call setline(1, "/*************************************************************************")   
  
        call append(line("."), "    > File Name: ".expand("%"))   
  
        call append(line(".")+1, "    > Author: wwz")   
  
        call append(line(".")+2, "    > Mail: wwz5251@outlook.com ")   
  
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))   
  
        call append(line(".")+4, " ************************************************************************/")   
  
        call append(line(".")+5, "")  
  
    endif  

"####  the file type is '.cpp' ####"
    if &filetype == 'cpp'  
  
        call append(line(".")+6, "#include<iostream>")  
  
        call append(line(".")+7, "using namespace std;")  
  
        call append(line(".")+8, "")  
  
    endif  

"#### the file type is '.c'  ####"
    if &filetype == 'c'  
  
        call append(line(".")+6, "#include<stdio.h>")  
  
        call append(line(".")+7, "")  
  
    endif  
  
    "#the cursor locate the end of file after insert header
    autocmd BufNewFile * normal G  
endfunc   



map <F6> :call Do_CsTag()<cr>  
func! Do_CsTag()  
    let dir = getcwd()  
    if ( DeleteFile(dir, "tags") )   
        return   
    endif  
    if ( DeleteFile(dir, "cscope.files") )   
        return   
    endif  
    if ( DeleteFile(dir, "cscope.out") )   
        return       
    endif  


    if(executable('ctags'))
        ilent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."  
    endif  
        
    if(executable('cscope') && has("cscope") )  
        if(g:isWin)  
            silent! execute "!find . -iname '*.[ch]' -o -name '*.cpp' > cscope.files"  
        endif  
        silent! execute "!cscope -b"  
        execute "normal :"  
        if filereadable("cscope.out")  
            execute "cs add cscope.out"  
        endif  
    endif  
    execute "redr!"  
endfunc


