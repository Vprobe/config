runtime! debian.vim

"--> VUNDLE
" :BundleInstall - установит все плагины записанные в вашем .vimrc.
" :BundleInstall - также обновляет все плагины.
" Для удаления плагина, удалите его из вашего .vimrc (вы можете его закоментировать). Затем запустите :BundleClean.
" :BundleList - посмотреть список установленных плагинов можно при помощи команды
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Основной и обязательный!
Plugin 'gmarik/Vundle.vim'
Plugin 'xolox/vim-misc'
" Тема для Gvim
" Bundle 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'
" Дерево для навигации и табы к нему
Plugin 'scrooloose/nerdtree'
" Дерево классов
Plugin 'majutsushi/tagbar'
" Быстрая навигация по экрану
Plugin 'Lokaltog/vim-easymotion'
" Статусная строка
Plugin 'bling/vim-airline'
" Комментарии
Plugin 'tComment'
" Позволяет удобно работать с тегами
Plugin 'tpope/vim-surround'
" Сессии
Plugin 'xolox/vim-session'
" Проверка на ошибки
Plugin 'Syntastic'
" Поиск файлов в системе, а также показ всех последних запущенных файлов
Plugin 'ctrlp.vim'
" Для правки одинаковых имен
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Для работы с русской раскладкой, сменить цвет курсора не получилось
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"--> ОБЩИЕ НАСТРОЙКИ
"Синтаксис включен по умолчанию
syntax on
"Включаем распознавание типов файлов и типо-специфичные плагины
filetype on
filetype plugin on
filetype indent on
"Вырубаем режим совместимости с VI
set nocompatible
"Меняет title terminal
set title
"Нумерация
set number
"Подсветка непечатемых символов
set list
"Перенос строки, если она не влазит в размер окна терминала
set wrap
"Отображать непечатаемые символы
set listchars=eol:↲,trail:·,nbsp:↔,tab:\|→
"перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap=b,<,>,[,],l,h
"увеличить историю команд
set history=150
"отключение приветственного сообщения
set shortmess+=I

"--> ФОЛДИНГ ПО ОТСУПАМ
"включить фолдинг
set foldenable
"определять блоки на основе отступов
set foldmethod=indent
"уровень вложенности, если =1, то первый отступ будет открыть, а остальные закрыты
"если =0, то все возможные отступы будут свернуты
set foldlevel=100

" При копировании добавить в иксовый буфер
"nmap <yy> yy:silent .w !xclip&<CR>
"vmap <y> y:silent  w !xclip<CR>
"set clipboard=unnamed

"--> ПОДСВЕТКА ДЛИННЫХ СТРОК (в *.py файлах >79 для python)
"подсветить строку, которая вышла за пределы
"au BufWinEnter *.py let w:m1=matchadd('Search', '\%>79v.*', -1)
"подсвестить колонку черным цветом
autocmd FileType python setlocal colorcolumn=80

"--> ОТКРЫВАТЬ ФАЙЛ С МЕСТА ЗАКРЫТИЯ
"Опция запоминает позицию в документе и при повторном открытии файла
"отображает его не с начала, а с того места, где произошло закрытие
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

"--> ЦВЕТА И ОФОРМЛЕНИЕ
"Цветовая схема
colorscheme zarniwoop

"Поддержка цветов в терминале
set t_Co=256
"подсветка курсора
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
"подсветка нумерации
" hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
"разделитель между окнами будет без черточек
set fillchars=stl:\ ,stlnc:\ ,vert:│

"--> ПОИСК
"Игнорировать регистр
set ignorecase
"Использовать инкрементальный поиск
set incsearch
"подсветка поиска, которую можно выключить :noh
set hlsearch

"--> ВКЛЮЧАТЬ МЫШКУ В ТЕКСТОВОМ РЕЖИМЕ
set mouse=a

"--> СТАТУСНАЯ СТРОКА
set laststatus=2
"set statusline=%f%m%r\ [%Y]\ enc:%{&enc}\ %=\ line:%2l/%L\ col:%2c\ [%2p%%]\ [LEN=%L]
"Цвета statusline, если Vim запушен в Terminal
"hi StatusLine ctermbg=0 ctermfg=166
"Отображение выполняемой команды
set showcmd

"--> SWAP
"Все swap файлы будут помещаться в эту папку; отключать нежелательно т.к.
"используется редактором в качестве файла для восстановления после сбоев
set dir=~/.vim/swp
"Бекап создает копию файла до начала редактирования; можно отключить
set nobackup
"создает файлы <FILENAME>.un~, когда вы редактируете файл, что дает возможность отменять действия даже после того как файл был закрыт, а потом открыт
"set undofile

"--> ТАБУЛЯЦИЯ
"задать размер табуляции в четыре пробела(8 по умолчанию)
set ts=4
"заменять табуляцию пробелами
set expandtab
"регулирование ширины отступов(8 по умолчанию)
set shiftwidth=4
"удалит в начальном tab`е не 1 символ(пробел), а весь tab
set smarttab

"--> АББРЕВЕУТАРЫ
iab bang! #!/usr/bin/env python3
iab ifmain! if __name__ == "__main__":<CR>

"--> ГОРЯЧИЕ КНОПКИ
"disable F1
imap <F1> :noh<cr>
nmap <F1> :noh<cr>
"выход из файла без подтверждения
nnoremap <F3> :q!<CR>
"запустить в python3 текущий файл
nnoremap <F4> :w!<CR>:!php -f %:p<CR>
"Вызов WILDMENU
map <F5> :emenu my.<Tab>
"запустить проверку файла на pep8
" nnoremap <F8> :w!<CR>:!pep8 %:p<CR>

let mapleader = ","
" обрезать все лишние пробелы в текущем файле
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"редактировать текущее слово
nnoremap <leader>c ciw<Esc>
"изменять хвост текущего слова
nnoremap <leader>l cw
" открыть новый вертикальный сплит
nnoremap <leader>w <C-w>v<C-w>l
" передвижение по сплитам
nnoremap <C-j> <C-w>h
nnoremap <C-l> <C-w>l
" обернуть строчку в print()
nnoremap <leader>f Iprint(<Esc>eA)<Esc>
" переключить язык в vim
imap <leader>m <C-^>
" смена режима не через esc
" inoremap jj <ESC>
" вставка в начало и конец текущей строки
nnoremap <leader>o [pli<space><ESC>
nnoremap <leader>p a<space><ESC>]p

"--> TCOMMENT
"закомментировать строку
map cc <c-_><c-_>
"закомментировать абзац
map cx <c-_>p
"комментарий с тройными кавычками
nnoremap cd I"""<CR><Esc>eA<space><CR>"""<Esc>0kA

" TAGBAR НАСТРОЙКИ
map <F6> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

"--> PLUGIN NERDTREE
"вызов NERDtree
nmap <F9> :NERDTree<cr>
vmap <F9> <esc>:NERDTree<cr>
imap <F9> <esc>:NERDTree<cr>
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.pyo$']
"NERDtree по умолчанию показывает закладки
let NERDTreeShowBookmarks=1
"позиционирование NERDtree
"let NERDTreeWinPos = 'right'
"закрывает NERD в том случае, если мы закрыли последний файл
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"если файл питоновский, то nerdtree появится на всех табах, а также будет сохранять свою структуру
autocmd FileType python let g:nerdtree_tabs_open_on_console_startup=1

"--> НАСТРОЙКА OMNICOMLETION ДЛЯ PYTHON (а так же для js, html и css)
" autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompletS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"Следующая опция отвечает за отключение меню подсказок omni
"set completeopt=menu

"--> МЕНЮ WILDMENU
set wildmenu
set wcm=<Tab>
"Включить\выключить подсветку непечатаемых символов 
menu my.list :set list<CR>
menu my.nolist :set nolist<CR>
"Включить\выключить нумерацию строк
menu my.number :set number<CR>
menu my.nonumber :set nonumber<CR>
"Включить\выключить режим PASTE
menu my.paste :set paste<CR>
menu my.nopaste :set nopaste<CR>
"Подсветка синтаксиса
menu my.syntax :sy on<CR>
menu my.nosyntax :sy off<CR>
"Включаем перенос строк
menu my.wrap :set wrap<CR>
menu my.nowrap :set nowrap<CR>
"в режиме виртуального редактирования курсор может двигаться не только по тексту, а где угодно
menu my.ve :set ve=all<CR>
menu my.nove :set ve= <CR>
"смена кодировок
menu my.cp1251 :e ++enc=cp1251<CR>
menu my.utf-8 :e ++enc=utf-8<CR>

" НАСТРОЙКИ VIM-AIRLINE
" let g:airline_theme='bubblegum'
" let g:airline_powerline_fonts = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = ''
"let g:airline_section_a = ''
"let g:airline_section_b = '%f%m%r% '
"let g:airline_section_c = ''
let g:airline_section_x = '%{&enc}'
let g:airline_section_y = ''
let g:airline_section_z = 'line:%2l/%L col:%2c [%2p%%]'
" табы в стиле airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#tab_nr_type = 1
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#left_sep = '▶'
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'

" BUFFERS
" This allows buffers to be hidden if you've modified a buffer.
set hidden
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"--> SYNTASTIC
"включить плагин
let g:syntastic_enable_signs=1
"чем проверять ошибки
let g:syntastic_python_checkers = ['php', '']
"показывать ошибки от всех чекеров указаных в списке выше(а не только от одного)
let g:syntastic_aggregate_errors = 1

"--> EASYMOTION
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"--> CTRLP
let g:ctrlp_map = '<c-o>'
" по умолчанию окно с последними файлами, с которыми работал
let g:ctrlp_cmd = 'CtrlPMRU'
" режим поиска (не вникал к чему он)
let g:ctrlp_working_path_mode = 'ra'
" смена биндов для плагина
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("k")': ['<c-k>', '<up>'],
  \ 'PrtSelectMove("j")': ['<c-j>', '<down>'],
  \ }

"--> SESSION
let g:session_directory = "~/.vim/session"
let g:session_autoload = "yes"
let g:session_autosave = "no"
" запомнить все буфферы
set sessionoptions+=buffers
nnoremap <leader>so :OpenSession!
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"--> MULTIPLE-CURSOR
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-q>'
" let g:multi_cursor_prev_key='<C-a>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


