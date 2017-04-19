""""""""""""""""""""""""""my config"""""""""""""""""""""""""""""""""""
" 显示行号
set number
" 解决粘贴时格式散乱, 添加该功能将修改vim的插入模式，从而影响jedi的补全功能
" set paste 
" 搜索逐字符高亮
set hlsearch
set incsearch
" 设置tab替换为空格
" set expandtab
" 设置空格替换为tab
set noexpandtab
" 设置tab宽度为4
set tabstop=4
" 表示每一级缩进的长度
set shiftwidth=4
" 表示在编辑模式的时候按退格键的时候退回缩进的长度
set softtabstop=4      
" 加!是用于处理非空白字符之后的TAB，即所有的TAB，若不加!，则只处理行首的TAB。
%retab!
" 共享剪贴板  
set clipboard+=unnamed
" 设置鼠标
set mouse=a
" 去掉vi一致性
set nocompatible
" 开启显示功能
syntax on
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
" 禁止生成临时文件
set nobackup
set noswapfile

" 开启文件检测
filetype plugin on
" 打开插件检测
filetype plugin indent on    " required
" indent: 如果用了:set indent,:set ai 等自动缩进，想用退格键将字段缩进的删掉，必须设置这个选项。否则不响应。
" eol:如果插入模式下在行开头，想通过退格键合并两行，需要设置eol。
" start：要想删除此次插入前的输入，需设置这个
set backspace=indent,eol,start
" 设置打开文件，光标跳到上一次退出的地方
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" 设置tab 虚线对齐
" set list lcs=tab:\¦\ ,
" 设置tab 以▸代替
set list
set listchars=tab:▸\ ,
" 配置solarized配色方案
" colorscheme solarized
" 设置背景颜色为黑色
set background="black"
"""""""""""""""""""""""""vundle""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+= ~/suchp_familly/yum/env/vim/plugin
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"BundleList -列举出列表中(.vimrc中)配置的所有插件
"BundleInstall -安装列表中全部插件
"BundleInstall! -更新列表中全部插件
"BundleSearch foo -查找foo插件
"BundleSearch! foo -刷新foo插件缓存
"BundleClean -清除列表中没有的插件
"BundleClean! -清除列表中没有的插件
" 插件管理器
Bundle 'gmarik/vundle'
" vimwiki插件
Bundle 'vimwiki/vimwiki'
" python 输入插件
" Bundle 'davidhalter/jedi-vim'
" 文件列表tree插件
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
" 文件搜索插件==>配合nerdtree使用
Bundle 'ctrlpvim/ctrlp.vim'
" taglist插件， 将函数名和变量以列表的方式显示
Bundle 'vim-scripts/taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
" 补全插件
Bundle 'Valloric/YouCompleteMe'
" Bundle 'Valloric/ycmd'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags;
set autochdir
"默认打开Taglist 
let Tlist_Auto_Open=0
nmap tl :Tlist<cr>
:nmap <silent> <F9> <ESC>:Tlist<RETURN>
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口

""""""""""""""""""""""""""""""""" vimwiki""""""""""""""""""""""""""""""""""
" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'path_html': '~/vimwiki/html/',
    \ 'template_path': '~/vimwiki/template/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html'}]

let g:vimwiki_camel_case = 0

map <F4> <Plug>Vimwiki2HTML
map <S-F4> <Plug>VimwikiAll2HTML

let wiki_1 = {}
let wiki_1.path = '~/suchp_familly/yum/log/vimwiki/wiki_source' "path：指定你存放wiki源文件的目录
let wiki_1.path_html = '~/suchp_familly/yum/log/vimwiki/html/' "path_html：指定编译得到的HTML文件放到哪个目录
let wiki_1.template_path ='~/suchp_familly/yum/log/vimwiki/suchptemplate'     "是模板的路径
let wiki_1.template_default= 'suchptemplate' "指定默认的模板名称
let wiki_1.template_ext= '.html' "指定模板的后缀名
let wiki_1.nested_syntaxes = {'c': 'c','python': 'python', 'c++': 'cpp','java': 'java', 'bash': 'sh','txt': 'txt','sql': 'sql', 'xml': 'xml', 'css': 'css', 'javaScript': 'javascript', 'vim': 'vim', 'make': 'make'}
let wiki_1.auto_export = 0 "auto_export：每当保存wiki源文件时自动编译输出html,这个会让保存大词条比较慢

let wiki_2 = {}
let wiki_2.path = '~/suchp_familly/yum/log/vimwiki/mywiki/wiki_source' "path：指定你存放wiki源文件的目录
let wiki_2.path_html = '~/suchp_familly/yum/log/vimwiki/mywiki/html/' "path_html：指定编译得到的HTML文件放到哪个目录
let wiki_2.template_path ='~/suchp_familly/yum/log/vimwiki/mywiki/suchptemplate'     "是模板的路径
let wiki_2.template_default= 'suchptemplate' "指定默认的模板名称
let wiki_2.template_ext= '.html' "指定模板的后缀名
let wiki_2.nested_syntaxes = {'c': 'c','python': 'python', 'c++': 'cpp','java': 'java', 'bash': 'sh','txt': 'txt','sql': 'sql', 'xml': 'xml', 'css': 'css', 'javaScript': 'javascript', 'vim': 'vim', 'make': 'make'}
let wiki_2.auto_export = 0 "auto_export：每当保存wiki源文件时自动编译输出html,这个会让保存大词条比较慢

let g:vimwiki_list = [wiki_1,wiki_2]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*html exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头 
func SetTitle()
        "如果文件类型为.sh文件 
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    elseif &filetype == 'html'
        call setline(1, "<!DOCTYPE html>")
        call append(line("."),   "<!--***********************************************")
        call append(line(".")+1,   "    > FileName: ".expand("%"))
        call append(line(".")+2,   "    > Author: suchp")
        call append(line(".")+3,   "    > Mail: 291657954@qq.com")
        call append(line(".")+4,   "    > Create Time: ".strftime("%c"))
        call append(line(".")+5, "***********************************************-->")
        call append(line(".")+6, "<html>")
        call append(line(".")+7, "<head>")
        call append(line(".")+8, "<meta charset=\"UTF-8\">")
        call append(line(".")+9, "<title>".expand("%")."</title>")
        call append(line(".")+10, "</head>")
        call append(line(".")+11, "<body>")
        call append(line(".")+12, "hello world")
        call append(line(".")+13, "</body>")
        call append(line(".")+14, "</html>")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "        > File Name: ".expand("%"))
        call append(line(".")+1, "      > Author: suchuanpao")
        call append(line(".")+2, "      > Mail: 291657954@qq.com")
        call append(line(".")+3, "      > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef __".toupper(expand("%:r"))."_H__")
        call append(line(".")+7, "#define __".toupper(expand("%:r"))."_H__")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""nerdtree""""""""""""""""""""""""""""""""""""""
" 设置<F3>按键打开文件
map <F3> :NERDTreeToggle<CR>
" 设置没有打开文件时，自动关闭文件列表
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" 设置打开vim时，自动开启文件列表
" autocmd vimenter * NERDTree
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

""""""""""""""""""""""""""jedi config""""""""""""""""""""""""""""""""""""

" let g:jedi#completions_command = "<C-N>"
" let g:jedi#auto_vim_configuration = 1
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
""""""""""""""""""""""""" bufexplorer 插件使用""""""""""""""""""""""""""
" \be打开历史文件列表
" \bs水平新建历史文件列表窗口
" \bv垂直新建历史文件列表

""""""""""""""company vimrc config for strip tail space for line"""""""
set fencs=utf-8,cp936

" 删除行尾空格
nnoremap <leader>f :%s/\s\+$//<cr>

function! KRIndent()
    let c_space_errors = 0
    set fileformats=unix
    set textwidth=120
    set noexpandtab
    set shiftround
    set cindent
    set formatoptions=tcqlron
    set cinoptions=:0,l1,t0,g0
    syntax keyword cType u8 u16 u32 u64 s8 s16 s32 s64 off64_t
    highlight default link LinuxError ErrorMsg

    syntax match LinuxError / \+\ze\t/     " spaces before tab
    syntax match LinuxError /\s\+$/        " trailing whitespaces
    "syntax match LinuxError /\%121v.\+/    " virtual column 121 and more
    "autocmd BufWrite <buffer> :%s/\s\+$//e " 文件保存时，自动删除行尾空格
endfunction
if has("autocmd")
    autocmd FileType c,cpp,h,hh call KRIndent()
endif
endif
