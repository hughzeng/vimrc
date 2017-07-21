set nocompatible " be iMproved, required
set backspace=indent,eol,start
filetype off   " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on " required

"自动缩进与C语言风格缩进
set autoindent 
set cindent
"不要用空格代替制表符
set noexpandtab
"在行和段开始处使用制表符
set smarttab
"显示行号
set number
"调整窗口高度宽度的快捷键
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>
nmap sp :split<CR>
nmap vs :vertical split<CR>
"缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4
"建议开启expandtab选项，会自动将tab扩展很空格，代码缩进会更美观
set expandtab 
set mouse=a "开启鼠标点击
set background=dark "背景使用黑色
set t_Co=256 "开启256色
"set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
syntax on "语法高亮
"colorscheme molokai
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 

#ycm
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '>>'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1 
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = 'python3'
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

"CTags的设定  
let Tlist_Show_One_File=1    
" 只展示一个文件的taglist
let Tlist_Sort_Type="name"    
"按照名称排序  
let Tlist_Use_Right_Window=1  
"在右侧显示窗口  
let Tlist_Compart_Format=1    
"压缩方式  
let Tlist_Exit_OnlyWindow=1  
"如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_File_Fold_Auto_Close=0  
"不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column=0    
"不要显示折叠树 
let Tlist_Ctags_Cmd='/usr/bin/ctags' 
let Tlist_Show_One_File=1 
"不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Auto_Open=1 
"打开代码时自动开启Tlist 
set tags=tags;  
set autochdir 

"NERDTree配置
nnoremap <silent> <C-F5> :NERDTree<CR>
let NERDChristmasTree=1  
let NERDTreeAutoCenter=1 
let NERDTreeChDirMode=2  "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDChristmasTree=1
let NERDTreeMouseMode=3 "单击打开文件夹
let NERDTreeWinSize=30 " 设置NERDTree子窗口宽度
let NERDTreeWinPos="left" "设置NERDTree子窗口位置
let NERDTreeShowHidden=0 "显示隐藏文件
let NERDTreeMinimalUI=1 "NERDTree子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1 "删除文件时自动删除文件对应buffer
autocmd BufRead * 25vsp ./"自动开启NerdTree
