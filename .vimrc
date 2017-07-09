" ==============================
" ==========通用配置
" ==============================
set fenc=utf-8  " 设定默认解码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set nowrap  " 禁止折行
set nobackup	" 禁止备份文件
set wildmenu    " 增强命令行补全
set autoread	" 文件修改后自动载入
set noswapfile	" 禁止生成swap文件
set nocompatible    " 非vi兼容模式
set noerrorbells    " 关闭错误信息响铃
set novisualbell    " 关闭错误信息闪烁
set history=100	" 设置命令历史行数
set textwidth=100	" 设置超过100字符折行
set scrolloff=4	" 光标移动到顶部和底部时各保持4行距离
set shortmess=atI   " 启动时不显示援助乌干达儿童的提示界面
set clipboard+=unnamed  " 共享外部剪贴板
set formatoptions+=mM	" 正确处理中文字符的拆行和拼接
autocmd! bufwritepost .vimrc source ~/.vimrc "保存.vimrc文件后会自动调用新的.vimrc
" autocmd! bufwritepost .vimrc source % "保存.vimrc文件后会自动调用新的.vimrc
" ==============================
" ==========字体配置
" ==============================
" 在终端配置中进行相关设置
" ==============================
" ==========界面配置
" ==============================
set ruler " 开启状态栏标尺，显示光标当前位置
set number  " 开启行号显示
set showcmd " 状态栏显示当前所执行的指令
set showmatch   " 高亮显示匹配的括号
set matchtime=1 " 短暂跳转到匹配括号的时间
set cmdheight=1 " 设定命令行的高度（行数）为1
set laststatus=2    " 总是显示状态栏（默认值为1，无法显示状态栏）
set guioptions+=m   " 隐藏菜单栏
set guioptions+=t   " 隐藏工具栏
set fillchars=vert:\ ,stl:\ ,stlnc:\    " 在被分割的窗口间显示空白，便于阅读
set cursorline  " 突出显示当前行
set cursorcolumn    " 突出显示当前列
" highlight CursorLine cterm=bold ctermbg=NONE ctermfg=NONE
" highlight CursorColumn cterm=bold ctermbg=NONE ctermfg=NONE
" colorscheme torte	" 配色方案
" ==============================
" ==========语法配置
" ==============================
syntax on   " 开启语法高亮
syntax enable
set cindent " 自动缩进,使用C样式缩进
set autoindent  " 继承前一行的缩进方式
set smartindent " 为C程序提供自动缩进
" ==============================
" ==========按键配置
" ==============================
" set list	" 显示tab键
" set listchars=tab:>-,trail:-
set smarttab    " 在行和段开始处使用制表符
set noexpandtab " 禁止将制表符扩展为空格键
set tabstop=4   " 设定tab键长度为4
set shiftwidth=4    " 设定<<和>>命令移动时的宽度为4
set softtabstop=4   " 按退格健时一次删掉4个空格
set iskeyword+=@,#,$,%,-,_  " 带有如下符号的词句不被换行分割
" ==============================
" ==========搜索配置
" ==============================
set magic   " 设置魔术，正则表达式
set hlsearch    " 高亮显示搜索到的词句
" set nohlsearch    " 禁止高亮显示
set incsearch   " 逐字高亮显示搜索的词句
set nowrapscan  " 禁止在文件两端循环搜索内容
set ignorecase  " 搜索时忽略词句中的大小写字母
set smartcase   " 包含一个以上大写字母时仍保持对大小写敏感
" ==============================
" ==========折叠配置
" ==============================
set foldenable  " 开启折叠功能
" set nofoldenable " 启动时禁止折叠
set foldlevel=4    " 设置折叠层数
set foldcolumn=1    " 左侧折叠层次显示宽度
set foldmethod=indent   " 设置语法折叠
" set foldopen=all	" 光标遇到折叠时自动打开
" set foldclose=all	" 光标移开折叠时自动关闭
" 其他折叠方法：
" expr  使用表达式定义折叠
" diff  对没有更改的文本进行折叠
" manual    手工折叠
" indent    使用缩进表示折叠
" syntax    使用语法定义折叠
" marker    使用标记进行折叠，默认标记是{[(和)]}
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" ==============================
" ==========环境配置
" ==============================
" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
    else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
" ==============================
" ==========AutoCmd
" ==============================
if has("autocmd")
    filetype on	" 检测文件类型
	filetype indent on	" 为特定文件类型载入相关缩进文件
	filetype plugin on	" 为特定文件类型载入相关插件文件
	" filetype plugin indent on
    " 括号自动补全
    func! AutoClose()
        :inoremap ' ''<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ( ()<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap [ []<ESC>i
        :inoremap ] <c-r>=ClosePair(']')<CR>
        :inoremap { {}<ESC>i
        :inoremap } <c-r>=ClosePair('}')<CR>
    endf
    func! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
    " Auto close quotation marks for PHP, Javascript, etc, file
    au FileType php,javascript,c,cpp exe AutoClose()
endif
