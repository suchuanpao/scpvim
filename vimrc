""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim 基本设置
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set shortmess=atI            " 启动的时候不显示那个援助乌干达儿童的提示
set number                     " 显示行号
set mouse=a                    " 设置鼠标
" set paste                    " 解决粘贴时格式散乱, 添加该功能将修改vim的插入模式，从而影响jedi的补全功能
set hlsearch                   " high light search, 将搜索的字符串反白的设定值
set incsearch                  " 设置搜索时一边输入一边显示效果
set tabstop=4                  " 设置tab宽度为4
set shiftwidth=4               " 表示每一级缩进的长度
set softtabstop=4              " 表示在编辑模式的时候按退格键的时候退回缩进的长度
" set expandtab                  " 设置tab替换为空格
"set noexpandtab                " 设置空格替换为tab
"%retab!                        " 加!是用于处理非空白字符之后的TAB，即所有的TAB，若不加!，则只处理行首的TAB。
set nocompatible               " 去掉vi一致性
set showcmd                    " 输入的命令显示出来，看的清楚些
set scrolloff=5                " 光标移动到buffer的顶部和底部时保持3行距离
set iskeyword+=_,$,@,%,#,-     " 带有如下符号的单词不要被换行分割
set smartindent                " 为C程序提供自动缩进
set nofoldenable               " 禁止代码折叠
"set nowrap                     " 禁止自动换行
set linebreak                  " 禁止自动换行时使用换行符
"设置vim列出命令tab补全,包括命令和命令参数
"当输入":+命令的一些字母" 后按Tab键时自动补全时行为为:
"  1.出现一个list，此时可进行并再次按Tab补全
"  2.跳至列表第一个选项或者自动补全当前输入
" vim默认行为没有步骤1，直接跳转第一个选项，而且不会显示整体列表，如下修改配置：
"set wildmode=list:longest,full
set wildmode=list:longest
set wildmenu 
" 显示中文帮助
if version >= 603
    set helplang=cn            " 显示中文帮助
    set encoding=utf-8         " 设置vim的编码方式
endif
syntax on                      " 开启语法高亮
let g:solarized_termcolors=256 " 设置solarized的配色为256色
set background=dark            " 设置背景颜色为黑色
colorscheme solarized          " 配置solarized配色方案
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=2               " 启动显示状态行(1),总是显示状态行(2)
" indent: 如果用了:set indent,:set ai 等自动缩进，想用退格键将字段缩进的删掉，必须设置这个选项。否则不响应。
" eol:如果插入模式下在行开头，想通过退格键合并两行，需要设置eol。
" start：要想删除此次插入前的输入，需设置这个
set backspace=indent,eol,start
set nobackup                   " 从不备份
set noswapfile                 " 不使用swp文件，注意，错误退出后无法恢复
set clipboard+=unnamed         " 共享剪贴板
" set autochdir                " 自动切换当前目录为当前文件所在的目录
" set list lcs=tab:\¦\ ,       " 设置tab 虚线对齐
set list                       " set list显示不可视字符 :set nolist不显示不可视字符
set listchars=tab:▸\ ,         " 显示tab符号为▸
set showmode                   " 显示当前操作模式
filetype plugin on             " 检测文件类型
filetype plugin indent on      " 载入文件类型对应的插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 安装的插件列表
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
Bundle 'rdnetto/YCM-Generator'
" Bundle 'Valloric/ycmd'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vimwiki插件配置
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'path_html': '~/vimwiki/html/',
    \ 'template_path': '~/vimwiki/template/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html'}]

" let g:vimwiki_camel_case = 0

let wiki_1 = {}
let wiki_1.path = '~/suchp_familly/yum/log/vimwiki/wiki_source' "path：指定你存放wiki源文件的目录
let wiki_1.path_html = '~/suchp_familly/yum/log/vimwiki/html/' "path_html：指定编译得到的HTML文件放到哪个目录
let wiki_1.template_path ='~/suchp_familly/yum/log/vimwiki/suchptemplate'     "是模板的路径
let wiki_1.template_default= 'suchptemplate' "指定默认的模板名称
let wiki_1.template_ext= '.html' "指定模板的后缀名
let wiki_1.nested_syntaxes = {'c': 'c','python': 'python', 'c++': 'cpp','java': 'java', 'bash': 'sh','txt': 'txt','sql': 'sql', 'xml': 'xml', 'css': 'css', 'javaScript': 'javascript', 'vim': 'vim', 'make': 'make'}
let wiki_1.auto_export = 0 "auto_export：每当保存wiki源文件时自动编译输出html,这个会让保存大词条比较慢
let wiki_1.auto_toc=1  " 自动更新目录

let wiki_2 = {}
let wiki_2.path = '~/suchp_familly/yum/log/vimwiki/mywiki/wiki_source' "path：指定你存放wiki源文件的目录
let wiki_2.path_html = '~/suchp_familly/yum/log/vimwiki/mywiki/html/' "path_html：指定编译得到的HTML文件放到哪个目录
let wiki_2.template_path ='~/suchp_familly/yum/log/vimwiki/mywiki/suchptemplate'     "是模板的路径
let wiki_2.template_default= 'suchptemplate' "指定默认的模板名称
let wiki_2.template_ext= '.html' "指定模板的后缀名
let wiki_2.nested_syntaxes = {'c': 'c','python': 'python', 'c++': 'cpp','java': 'java', 'bash': 'sh','txt': 'txt','sql': 'sql', 'xml': 'xml', 'css': 'css', 'javaScript': 'javascript', 'vim': 'vim', 'make': 'make'}
let wiki_2.auto_export = 0 "auto_export：每当保存wiki源文件时自动编译输出html,这个会让保存大词条比较慢
let wiki_2.auto_toc=1  " 自动更新目录

let g:vimwiki_toc_header = '目录'             " 插入 = 目录 =时，自动生成目录
let g:vimwiki_table_auto_fmt=1                " default 1, 开启table自动格式化
let g:vimwiki_html_header_numbering=1         " default 0, 0关闭标题编号，1一级标题开始编号，2从二级标题开始标号
let g:vimwiki_html_header_numbering_sym='.'   " 编号后紧接的符号
let g:vimwiki_list = [wiki_1,wiki_2]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Taglist(ctags)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"         " 按照名称排序
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1          "不同时显示多个文件的tag，只显示当前文件的
let Tlist_File_Fold_Auto_Close = 1   " 不要关闭其他文件的tags
let Tlist_Exit_OnlyWindow = 1        "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1       "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open=0                "默认打开Taglist
let Tlist_Compart_Format = 1         " 压缩方式
let Tlist_Exist_OnlyWindow = 1       " 如果只有一个buffer，kill窗口也kill掉buffer
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
set tags=tags;                       "设置tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" nerd tree插件
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif " 设置没有打开文件时，自动关闭文件列表
" autocmd vimenter * NERDTree                  " 设置打开vim时，自动开启文件列表
" let loaded_nerd_tree=1                       " 不使用NerdTree脚本
" let NERDChristmasTree=1                      " 让Tree把自己给装饰得多姿多彩漂亮点
" let NERDTreeCaseSensitiveSort=1              " 排序时是否大小写敏感
" let NERDTreeChDirMode=0                      " 确定是否改变Vim的CWD
" let NERDTreeHighlightCursorline=1            " 是否高亮显示光标所在行
" let NERDTreeHijackNetrw=0                    " 是否使用:edit命令时打开第二NerdTree
" let NERDTreeBookmarksFile=0                  " 指定书签文件
" let NERDTreeMouseMode=1                      " 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
" let NERDTreeQuitOnOpen=1                     " 打开文件后是否关闭NerdTree窗口
" let NERDTreeShowFiles                        " 是否默认显示文件
" let NERDTreeSortOrder                        " 排序规则
" let NERDTreeStatusline                       " 窗口状态栏
" let NERDTreeWinPos                           " 窗口位置（'left' or 'right'）
" let NERDTreeAutoCenterThreshold              " 与NERDTreeAutoCenter配合使用
let NERDTreeShowLineNumbers=1                  " 是否默认显示行号
let NERDTreeAutoCenter=1                       " 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeShowHidden=1                       " 是否默认显示隐藏文件
let NERDTreeWinSize=31                         " 设置窗口宽
let g:nerdtree_tabs_open_on_console_startup=1  " 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']     " 默认的“无视”文件
let NERDTreeShowBookmarks=1                    " 是否显示书签列表
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" YouCompleteMe插件配置 --补全插件
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =====================================.ycm_extra_conf文件的配置==========================
" 此选项指定配置文件的后备路径,如果没有找到配置文件，则使用该配置文件
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 当此选项设置为1时，YCM会询问是否加载.ycm_extra_conf.py文件。这是为了防止您没有写的.ycm_extra_conf.py文件执行恶意代码。
let g:ycm_confirm_extra_conf = 0
" 略复杂，上官网查
" let g:ycm_extra_conf_globlist = []
" 此选项的值将传送至.ycm_extra_conf文件中的FlagsForFile()函数。
" let g:ycm_extra_conf_vim_data = []
" ========================================================================================

" 设置此选项为1,将强制YCM始终将相对路径解释为与Vim当前工作目录相关。(执行vim的目录)
let g:ycm_filepath_completion_use_working_dir = 1
" 控制用户在触发基于标识符的完成建议之前需要键入的字符数。
let g:ycm_min_num_of_chars_for_completion = 2
" 控制补全列表最大字符宽度，0表示没有限制
let g:ycm_min_num_identifier_candidate_chars = 2
" 为0将关闭特殊字符触发补全(例如 . 或者 ->)，但仍然可以使用vim自带的补全<C-N>进行补全
let g:ycm_auto_trigger = 0
" 此选项控制用于主动语义补全的按键。
let g:ycm_key_invoke_completion = '<C-Space>'
" 控制Vim打开哪些文件类型(详见：h filetype)自动启动YCM插件。
let g:ycm_filetype_whitelist = { '*': 1}
" 控制Vim打开哪些文件类型(详见：h filetype)禁止启动YCM插件。
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}
" 控制Vim打开哪些文件时，YCM插件的补全不起作用
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'gitcommit': 1
    \}

" 当此选项设置为1时，YCM将将updatetime Vim选项更改为2000（请参阅：h updatetime）。
" 这可能与您拥有的其他插件（但不太可能）相冲突。 updatetime选项是在Vim的CursorHold(h CursorHold)事件触发之前必须等待的毫秒数。
" let g:ycm_allow_changing_updatetime = 1

" 当此选项设置为1时，即使在注释中输入内容，YCM也会显示补全菜单。
let g:ycm_complete_in_comments = 1
" 在C系列文件中非常有用，其中键入#include" 将触发文件名补全的开始。如果关闭此选项，则在这种情况下也将关闭文件名完成。
let g:ycm_complete_in_strings = 1
" 当此选项设置为1时，YCM的标识符也将从字符串和注释中收集标识符。 否则，注释和字符串中的文本将被忽略。
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 当此选项设置为1时，YCM的标识符也将从标签文件中收集标识符。
" 要检查的标签文件列表从检查标签Vim选项的tagfiles() Vim函数中检索。(有关详细信息，请参阅：h tags。)
" The only supported tag format is the Exuberant Ctags format.
" The format from "plain" ctags is NOT supported. Ctags needs to be called with the '--fields=+l' option
" because YCM needs the language:<lang> field in the tags output.
" See the FAQ(常见问题解答) for pointers if YCM does not appear to read your tag files.
let g:ycm_collect_identifiers_from_tags_files = 1

" 当此选项设置为1时，YCM的标识符将会将其标识符数据库与您正在编写的编程语言的关键字进行比对。
" 由于关键字是从文件类型的Vim语法文件中提取的，所以可能不会收集所有关键字，具体取决于语法文件的写法。
" 通常至少95％的关键字被成功提取。
" let g:ycm_seed_identifiers_with_syntax = 1

" 指定使用python2/python3解释器
let g:ycm_server_python_interpreter = 'python'
" 此选项配置ycm使用的python解释器所在的路径
let g:ycm_python_binary_path = '/usr/bin/python'

" 此选项置1,ycm插件和ycm服务器关闭后，仍然保留日志文件
" let g:ycm_keep_logfiles = 0

" 此选项配置ycm插件的Ycm服务记录的日志信息的级别('debug','info','warning', 'error', 'critical')
" let g:ycm_log_level = 'info'

" 当设置为1时，打开C＃文件时，OmniSharp服务器将自动启动（每次Vim会话一次）。
" let g:ycm_auto_start_csharp_server = 1
" 当设置为1时，OmniSharp服务器将在关闭Vim时自动停止。
" let g:ycm_auto_stop_csharp_server = 1

" 当g：ycm_auto_start_csharp_server设置为1时，指定OmniSharp服务器侦听的端口。当设置为0时，使用OS提供的未使用的端口。
" let g:ycm_csharp_server_port = 0
" 保留选项(详情上官网)
" let g:ycm_csharp_insert_namespace_expr = ''
" ==============================youcomplete preview===================================
" 打开此选项，将在顶部的预览窗口存放被补全信息的详细信息
" 例如，如果当前的完成是函数名，它将显示窗口中的完整函数原型和所有函数重载
let g:ycm_add_preview_to_completeopt = 1
" 当此选项设置为1时，YCM将在用户接受提供的完成字符串后自动关闭预览窗口。
let g:ycm_autoclose_preview_window_after_completion = 1
" 当此选项设置为1时，YCM将在用户离开插入模式后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 1
" ========================================================================
" 此选项控制用于选择补全字符串的按键:['<TAB>', '<Down>', '<Enter>']
let g:ycm_key_list_select_completion = ['<TAB>']
" 此选项控制用于向上选择补全的字符串的按键
let g:ycm_key_list_previous_completion = ['<S-TAB>']

" 此选项控制用于补全的触发器，比如字符按键['.', '->']，也可以是正则表达式。
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go,html' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" omnicompletion补全引擎可能因为YCM的缓存原因没有正确补全，取消此选项将不再从缓存中获取补全
" let g:ycm_cache_omnifunc = 1
" 默认为 1 的情况下，YCM将查询UltiSnips插件，以获取snippet触发器的可能补全。
" let g:ycm_use_ultisnips_completer = 0

" 使用Goto系列命令时，此选项控制以何种方式打开新文件，设为 'samebuffer'时，若当前缓冲没有保存，则以horizontal-split方式打开新文件
" [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab' ]
" let g:ycm_goto_buffer_command = 'same-buffer'

" 定义待补全的文件的最大大小（以Kb为单位）。如果此选项设置为0，则不会检查您打开的文件的大小。
" let g:ycm_disable_for_files_larger_than_kb = 1000

" ======================youcomplete 诊断功能设置==========================
" 开启Vim语法诊断功能，该选项只支持c家族语言，如果此项开启，那么c家族语言自带的补全无效(冲突)
" 可以单独打开或关闭诊断UI的特定部分（如沟槽符号，文本突出显示，诊断回声和自动位置列表种群）。 有关详细信息，请参阅下面的其他选项。
" let g:ycm_show_diagnostics_ui = 1
" 语法错误行的提示符号
" let g:ycm_error_symbol = '>>'
" 语法警告行的提示符号
" let g:ycm_error_symbol = '>*'
" 设置此选项时，YCM将在Vim的槽中将图标放在语法错误的行上。 关闭它也将关闭YcmErrorLine和YcmWarningLine突出显示。
let g:ycm_enable_diagnostic_signs = 1
" 设置此选项时，YCM将突出显示与线上存在的诊断相关的文本区域（如果有）。
let g:ycm_enable_diagnostic_highlighting = 0
" 当设置此选项时，当您将光标移动到该行时，YCM将回显当前行上诊断的文本。 如果FixIt可用于当前诊断，则会添加（FixIt）。
let g:ycm_echo_current_diagnostic = 1
" 此选项控制YCM将呈现哪些诊断。
"  “regex”：接受一个字符串正则表达式。 标志在诊断文本中找到的与正则表达式匹配的文本（被视为不区分大小写的）。
"  “level”：接受字符串等级，“警告”或“错误”。标志在诊断文本中找到的同级别的代码。
" let g:ycm_filter_diagnostics = {
" \ "java": {
" \      "regex": [ ".*taco.*", ... ],
" \      "level": "error",
" \      ...
" \    }
" \ }
" 当设置此选项时，YCM将在每次获取新的诊断数据时自动填充位置列表。(请参阅：Vim中的帮助位置列表)
let g:ycm_always_populate_location_list = 1
" 设置此选项时：YcmDiags将在强制编译后自动打开位置列表，并使用诊断数据填充列表。
let g:ycm_open_loclist_on_ycm_diags = 1
" 此选项控制在文件中检测到错误或警告时向用户显示的最大诊断数。
" let g:ycm_max_diagnostics_to_display = 30
" 此选项控制用于用户的光标与诊断对齐时用于显示完整诊断文本的键映射
" let g:ycm_key_detailed_diagnostics = '<leader>d'
" ========================================================================
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" YCM-Generator插件 --生成.ycm_extra_conf配置文件
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 生成youcompleteme的.ycm_extra_conf配置文件
" :YcmGenerateConfig
" 生成color-code的颜色配置文件
" :CCGenerateConfig
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" bufexplorer 插件配置及使用 --> 管理打开的文件
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" \be打开历史文件列表
" \bs水平新建历史文件列表窗口
" \bv垂直新建历史文件列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 新文件标题
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*html exec ":call SetTitle()"
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
""定义函数SetTitle，自动插入文件头
func SetTitle()
    " 获取文件名
    " expand("%:r")
    " 获取文件名后缀
    " expand("%:e")
    let l=0
    let anno_h=''
    let anno_t=''
    let anno=''
    " 插入头
    if &filetype == 'sh'
        let l+=1 | call setline(l, '#!/bin/bash')
        let anno='#'
    elseif &filetype == 'python'
        let l+=1 | call setline(l, '#!/usr/bin/env python')
        let l+=1 | call setline(l, '# coding=utf-8')
        let anno='#'
    elseif &filetype == 'ruby'
        let l+=1 | call setline(l, '#!/usr/bin/env ruby')
        let l+=1 | call setline(l, '# encoding: utf-8')
        let anno='#'
    elseif &filetype == 'html'
        let l+=1 | call setline(l, '<!DOCTYPE html>')
        let anno_h='<!--'
        let anno_t='-->'
        let anno=' '
    else
        let anno_h='/*'
        let anno_t='*/'
        let anno=' '
    endif
    " 版权声明
    let l+=1 | call setline(l, anno_h)
    let l+=1 | call setline(l, anno.'*  '.expand("%").'  '.strftime("%y-%m-%d"))
    let l+=1 | call setline(l, anno.'*  Copyright (C) '.strftime("%y").'  Chuanpao Su')
    let l+=1 | call setline(l, anno.'*')
    let l+=1 | call setline(l, anno.'*  This program is free software: you can redistribute it and/or modify')
    let l+=1 | call setline(l, anno.'*  it under the terms of the GNU General Public License as published by')
    let l+=1 | call setline(l, anno.'*  the Free Software Foundation, either version 3 of the License, or')
    let l+=1 | call setline(l, anno.'*  (at your option) any later version.')
    let l+=1 | call setline(l, anno.'*')
    let l+=1 | call setline(l, anno.'*  This program is distributed in the hope that it will be useful,')
    let l+=1 | call setline(l, anno.'*  but WITHOUT ANY WARRANTY; without even the implied warranty of')
    let l+=1 | call setline(l, anno.'*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the')
    let l+=1 | call setline(l, anno.'*  GNU General Public License for more details.')
    let l+=1 | call setline(l, anno.'*')
    let l+=1 | call setline(l, anno.'*  You should have received a copy of the GNU General Public License')
    let l+=1 | call setline(l, anno.'*  along with this program.  If not, see <http://www.gnu.org/licenses/>.')
    let l+=1 | call setline(l, anno.'*')
    let l+=1 | call setline(l, anno.'*')
    let l+=1 | call setline(l, anno.'************************************************************************')
    let l+=1 | call setline(l, anno.'*      FileName: '.expand("%e"))
    let l+=1 | call setline(l, anno.'*')
    let l+=1 | call setline(l, anno.'*        Author: Chuanpao Su')
    let l+=1 | call setline(l, anno.'*       Version: 1.0')
    let l+=1 | call setline(l, anno.'*   Description: ----')
    let l+=1 | call setline(l, anno.'*          Mail: suchuanpao@outlook.com')
    let l+=1 | call setline(l, anno.'*        Create: '.strftime("%Y-%m-%d %H:%M:%S"))
    let l+=1 | call setline(l, anno.'* Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    let l+=1 | call setline(l, anno.'*  ')
    let l+=1 | call setline(l, anno.'***********************************************************************'.anno_t)
    let l+=1 | call setline(l, '')
    let l+=1 | call setline(l, '')
    " 内容
    if &filetype == 'sh'
        let l+=1 | call setline(l, 'SCP_CREATE_DIR(){')
        let l+=1 | call setline(l, '    DIR=$1')
        let l+=1 | call setline(l, '    if [ "$DIR" == "" ];then')
        let l+=1 | call setline(l, '        exit 1')
        let l+=1 | call setline(l, '    fi')
        let l+=1 | call setline(l, '    mkdir -p $DIR')
        let l+=1 | call setline(l, '}')
        let l+=1 | call setline(l, 'if [ "$SUCHP_HOME" = "" ]; then')
        let l+=1 | call setline(l, '    SUCHP_HOME=$HOME/suchp_familly')
        let l+=1 | call setline(l, 'fi')
        let l+=1 | call setline(l, '')
        let l+=1 | call setline(l, 'SCP_PREFIX=$SUCHP_HOME')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_PREFIX')
        let l+=1 | call setline(l, 'SCP_YUM=$SCP_PREFIX/yum')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_YUM')
        let l+=1 | call setline(l, 'SCP_YUM_ENV=$SCP_YUM/env')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_YUM_ENV')
        let l+=1 | call setline(l, 'SCP_YUM_SCRIPTS=$SCP_YUM/scripts')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_YUM_SCRIPTS')
        let l+=1 | call setline(l, 'SCP_YUM_CODE=$SCP_YUM/code')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_YUM_CODE')
        let l+=1 | call setline(l, 'SCP_YUM_LOG=$SCP_YUM/log')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_YUM_LOG')
        let l+=1 | call setline(l, 'SCP_GITHUB=$SCP_PREFIX/github')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_GITHUB')
        let l+=1 | call setline(l, 'SCP_TOOLS=$SCP_PREFIX/tools')
        let l+=1 | call setline(l, 'SCP_CREATE_DIR $SCP_TOOLS')
        let l+=1 | call setline(l, '')
        let l+=1 | call setline(l, 'exit 0')

    elseif &filetype == 'python'
        let l+=1 | call setline(l, 'import sys')
        let l+=1 | call setline(l, 'import os')
        let l+=1 | call setline(l, '')

    elseif &filetype == 'html' || &filetype == 'htm'
        let l+=1 | call setline(l, '<html>')
        let l+=1 | call setline(l, '<head>')
        let l+=1 | call setline(l, '<meta charset="utf-8">')
        let l+=1 | call setline(l, '<title>'.expand("%")."</title>")
        let l+=1 | call setline(l, '</head>')
        let l+=1 | call setline(l, '<body>')
        let l+=1 | call setline(l, 'hello world')
        let l+=1 | call setline(l, '</body>')
        let l+=1 | call setline(l, '</html>')

    elseif expand("%:e") == 'cpp'
        let l+=1 | call setline(l, '#include<iostream>')
        let l+=1 | call setline(l, 'using namespace std;')
        let l+=1 | call setline(l, '')
        let l+=1 | call setline(l, 'int main(int argc, char *argv[])')
        let l+=1 | call setline(l, '{')
        let l+=1 | call setline(l, '    cout<<"hello world!"<<end;"')
        let l+=1 | call setline(l, '}')

    elseif &filetype == 'c'
        let l+=1 | call setline(l, '#include<stdio.h>')
        let l+=1 | call setline(l, '')
        let l+=1 | call setline(l, 'int main(int argc, char *argv[])')
        let l+=1 | call setline(l, '{')
        let l+=1 | call setline(l, '    printf("hello world!\n");')
        let l+=1 | call setline(l, '}')
    endif

    if expand("%:e") == 'h' || expand("%:e") == 'hpp'
        let l+=1 | call setline(l, '#ifndef __'.toupper(expand("%:r"))."_H__")
        let l+=1 | call setline(l, '#define __'.toupper(expand("%:r"))."_H__")
        let l+=1 | call setline(l, '#endif')
    endif
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 自定义函数
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 获取当前文件名
" let fliename = expand("%")
" 更新文件的修改时间
func UpdateLastModifiedDate()
    let l = search('Last Modified', 'nc')
    if l != 0
        call setline(l, substitute(getline(l), '\<\d.*', ''.strftime("%Y-%m-%d %H:%M:%S"), ''))
    endif
endfunc
" 行首Tab转空格
function HeadTab2Space()
    " 获取当前文件的总行数
    let file_lines=line("$")
    for i in range(file_lines)
        let ch_line=getline(i)
        let j=0
        let spaces=''
        " \"符号不会对内容进行转义
        while ch_line[j] == "\t"
            let j+=1
            let spaces=spaces.'    '
        endwhile
        "替换\t为四个空格
        call setline(i, substitute(ch_line, '^\t\{'.j.'\}', spaces, ''))
    endfor
endfunction
" 行首空格转Tab
function HeadSpace2Tab()
    " 获取当前文件的总行数
    let file_lines=line("$")
    for i in range(file_lines)
        let ch_line=getline(i)
        let j=0
        let tabs=""
        while ch_line[j] == ' '
            let j+=1
            if j%4==0
                let tabs=tabs."\t"
            endif
        endwhile
        "替换四个空格为tab
        let j=j-j%4
        if j>=4
            call setline(i, substitute(ch_line, '^ \{'.j.'\}', tabs, ''))
        endif
    endfor
endfunction
"C，C++ 按F5编译运行
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'html'
        exec "!firefox %"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 自定义功能, 按键映射
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 空格转Tab
nnoremap <leader>a<Tab> :set noexpandtab\|%retab!<CR>
nnoremap <leader><Space><Tab> :call HeadSpace2Tab()<CR>
" Tab转空格
nnoremap <leader>n<Tab> :set expandtab\|%retab!<CR>
nnoremap <leader><Tab><Space> :call HeadTab2Space()<CR>
" YouCompleteMe代码跳转快捷键
nnoremap <leader>dd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" YouCompleteMe代码跳转到声明
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
" YouCompleteMe代码跳转到定义
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
" 语法诊断
nnoremap <F7> :YcmForceCompileAndDiagnostics <CR>
" <F9> 开关Tlist
nmap tl :Tlist<cr>
nnoremap <silent> <F9> <ESC>:Tlist<RETURN>
" <F3>开关NERDTree快捷键
map <F3> :NERDTreeToggle<CR>
map <leader>t :NERDTreeToggle<CR>
" vimwiki命令
map <F2> <Plug>Vimwiki2HTML
map <S-F2> <Plug>VimwikiAll2HTML
" 删除行尾空格
nnoremap <leader>f :%s/\s\+$//<cr>
"实现多个vim终端之间的复制,原理非常简单,就是利用一个文件来作中转。
"用zw来copy，在另外的终端上用zr来贴。
nmap zr :r $HOME/.vimxfer<CR>
nmap zw :'a,.w! $HOME/.vimxfer<CR>
vmap zr c<esc>:r $HOME/.vimxfer<CR>
vmap zw :w! $HOME/.vimxfer<CR>
" 修改文件最后修改的时间
autocmd BufWrite *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*html exec ":call UpdateLastModifiedDate()"
" 生成.ycm_extra_conf文件
nnoremap <Leader>ygc :YcmGenerateConfig<CR>
" 设置打开文件，光标跳到上一次退出的地方
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 公司要求必须添加的设置(\f 删除末尾空格和4字节宽度的空格对齐)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fencs=utf-8,cp936

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
