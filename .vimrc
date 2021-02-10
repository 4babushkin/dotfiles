
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif



call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории

Plug 'damage220/solas.vim' 
Plug 'vim-airline/vim-airline'
Plug 'jpalardy/vim-slime'
Plug 'ryanoasis/vim-devicons'
" Plug 'valloric/youcompleteme'
Plug 'scrooloose/syntastic'
Plug 'matze/vim-move'

" Plug 'scrooloose/nerdtree'

call plug#end() "Перестать это делать

" Установка добавленных плагинов
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


set nocompatible
filetype off
filetype plugin on
filetype plugin indent on
filetype plugin indent on



" выбираем цветовую схему
" colorscheme solarized
colorscheme solas
" Использовать больше цветов в терминале

" Задаем фон терминала, что влияет на подсветку
set background=dark



" обязательно!
set wrap
" Перенос строк по словам, а не по буквам
set linebreak
" Выключаем поддержку мыши при работе в терминале (для включения нужно устaновить mouse=a)
set mouse=a
" Включаем подсветку синтаксиса
syntax enable
" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана
set showcmd
" Показывать строку с позицией курсора
set ruler
" Показывать первую парную скобку после ввода второй
set showmatch
" Показывать строку вкладок всегда
set showtabline=2
" Показывать строку статуса всегда
set laststatus=2
set softtabstop=2
" Показывать имя буфера в заголовке терминала
set title
" Формат заголовка
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM
" Использовать диалоги вместо сообщений об ошибках
set confirm
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
" Включаем виртуальный звонок (мигание вместо спикера)
set visualbell
" Не выгружать буфер, когда переключаемся на другой файл
set hidden
" Включает отображение номеров строк
set number
" Включаем ‘умную’ автоматическую расстановку отступов
set smartindent
" Копирует отступ от предыдущей строки " наследовать отступы предыдущей строки
set autoindent
" Размер табуляции
set tabstop=2
" Размер сдвига при нажатии на клавиши «<" и «>"
set shiftwidth=2
" Включить подсветку невидимых символов
"set list
" всегда показывать строку статуса
set laststatus=2

" показывать относительные номера строк. Удобно тем, что можно легко переходить к нужной строке командой 10j, например
set rnu
" Подсветка текущей строки
set cursorline
" При вставке фрагмента сохраняет отступы
set pastetoggle=
" Включение автоматического перечитывания файла при изменении
set autoread
" установить keymap, чтобы по Ctrl+^ переключалась раскладка клавиатуры при вводе текста на русский и обратно внутри самого редактора
set keymap=russian-jcukenwin
" по умолчанию латинская раскладка
set iminsert=0
" разбивать окно горизонтально снизу
set splitbelow
" разбивать окно вертикально справа
set splitright
" Метод фолдинга — вручную (для обычных файлов)
" ,set foldmethod=manual
" Метод фолдинга — по синтаксису
" set foldmethod=syntax
" Опции авто-дополнения
set completeopt=longest,menuone

"-=Поиск=-
" Включаем подсветку выражения, которое ищется в тексте
set hlsearch
" Отключение подсветки найденных выражений
" set nohlsearch
" При поиске перескакивать на найденный текст в процессе набора строки (инкрементальный поиск)
set incsearch
" Если искомое выражения содержит символы в верхнем регистре — ищет с учётом регистра, иначе — без учёта
set smartcase
" Останавливать поиск при достижении конца файла
set nowrapscan
" Игнорировать регистр букв при поиске
set ignorecase
" В режиме поиска используется раскладка, заданная по умолчанию
set imsearch=-1
" по умолчанию латинская (английская) раскладка при поиске
set imsearch=0
" хранить больше истории команд
set history=128
" Размер истории для отмены правок
set undolevels=1000
" предлагать авто-дополнение на основе уже введённого регистра
set infercase

"-=Swap и backup=-
" Отключаем создание swap файлов
set noswapfile
" Все swap файлы будут помещаться в заданную директорию (туда скидываются открытые буферы)
set dir=~/.vim/swap/
" Отключаем создание бекапов (резервные копии файлов с окончанием «~" создаваться не будут)
set nobackup
" Если установлено set backup, то помещаются в этот каталог
set backupdir=~/.vim/
" -=Кодировки, горячие клавиши и прочее=-
if has("unix")
" использовать английскую локаль на любой системе
language en_US.UTF-8
endif

" Кодировка по умолчанию
set encoding=utf-8
set termencoding=utf-8
" Формат файла по умолчанию
set fileformat=unix
" Формат файла, который влияет на окончания строк — будет перебирать в указанном порядке
set ffs=unix,dos,mac
" Список кодировок файлов для авто-определения
set fileencodings=utf-8,koi8-r,cp1251,cp866
" Показывать все возможные кандидаты для выбора при авто-завершении команд в командной строке
set wildmenu
set wcm=<TAB>
" вывести весь список сразу доступных вариантов, а затем перебором
set wildmode=list:longest,full

" Переключение кодировки чтения файла по <F7>
menu Encoding.Read.UTF8<TAB><F7> :e ++enc=utf8 <CR>
menu Encoding.Read.KOI8-R<TAB><F7> :e ++enc=koi8-r<CR>
menu Encoding.Read.CP1251<TAB><F7> :e ++enc=cp1251<CR>
menu Encoding.Read.CP866<TAB><F7> :e ++enc=cp866<CR>
map <F7> :emenu Encoding.Read.<TAB>

" Переключение кодировки сохранения файла по <F8>
menu Encoding.Write.UTF8<TAB><F8> :set fenc=utf8 <CR>
menu Encoding.Write.KOI8-R<TAB><F8> :set fenc=koi8-r<CR>
menu Encoding.Write.CP1251<TAB><F8> :set fenc=cp1251<CR>
menu Encoding.Write.CP866<TAB><F8> :set fenc=cp866<CR>
map <F8> :emenu Encoding.Write.

" По умолчанию проверка орфографии выключена (setlocal nospell). Меню для управления этими настройками по <F9>
menu SpellLang.nospell<TAB><F9>	:setlocal nospell <CR>
menu SpellLang.RU<TAB><F9>	:setlocal spell spelllang=ru_yo <CR>
menu SpellLang.EN<TAB><F9>	:setlocal spell spelllang=en_us <CR>

" также возможна одновременная проверка многоязычного документа
menu SpellLang.RU_EN<TAB><F9>	:setlocal spell spelllang=ru_ru,en_us <CR>
" словари при загрузке с сайта ftp://ftp.vim.org/pub/vim/runtime/spell/ будут ложиться в ~/.vim/spell, что редактор сам предложит при первой проверке орфографии
map <F9> :emenu SpellLang.<TAB>

" Сохранить файл по <F2>
nmap <F2> :w!<CR>
imap <F2> <Esc>:w!<CR>
vmap <F2> <Esc>:w!<CR>

" F3 - рекурсивный поиск по файлам (плагин grep.vim)
nnoremap <silent> <F3> :Rgrep<cr>
" Shift-F<F3> - добавление найденного к прошлым результатам поиска
nnoremap <silent> <S-F<F3>> :RgrepAdd<cr>
" Ctrl-F<F3> - поиск в открытых буферах

nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>


" Выйти из редактора по <F10>
nmap <F10> :q<CR>
imap <F10> <Esc>:q<CR>
vmap <F10> <Esc>:q<CR>
" Просмотр списка буферов по <F4>
nmap <F4> <Esc>:buffers<CR>
vmap <F4> <Esc>:buffers<CR>
imap <F4> <Esc><Esc>:buffers<CR>
" предыдущий буфер
map <F5> :bp<CR>
vmap <F5> <Esc>:bp<CR>i
imap <F5> <Esc>:bp<CR>i
" следующий буфер
map <F5> :bn<CR>
vmap <F6> <Esc>:bn<CR>i
imap <F6> <Esc>:bn<CR>i
" Переключение табов (вкладок) с помощью SHIFT+TAB и CTRL+TAB
map <S-TAB> :tabprevious<CR>
nmap <S-TAB> :tabprevious<CR>
imap <S-TAB> <Esc>:tabprevious<CR>i
map <C-TAB> :tabnext<CR>
nmap <C-TAB> :tabnext<CR>
imap <C-TAB> <Esc>:tabnext<CR>i
" Открытие\закрытие новой вкладки по CTRL+T и CTRL+W
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>a
nmap <C-w> :tabclose<CR>
imap <C-w> <Esc>:tabclose<CR>

" map <alt+n> to navigate through tabs
for c in range(1, 9)
  exec "set <A-".c.">=\e".c
  exec "map \e".c." <A-".c.">"

  let n = c - '0'
  exec "map <M-". n ."> ". n ."gt"
endfor

" nerdtree
let NERDTreeAutoDeleteBuffer = 1


" move
let g:move_key_modifier = 'C'

" youcompleteme
let g:ycm_server_python_interpreter='python'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Down>']


" airline
" let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget Search
hi EasyMotionTarget2First ctermfg=202 ctermbg=None cterm=None
hi EasyMotionTarget2Second ctermfg=202 ctermbg=None cterm=None

" session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_default_to_last = 1


" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


