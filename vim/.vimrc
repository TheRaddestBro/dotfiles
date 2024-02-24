:filetype on
:autocm FileType c,cpp :set cindent
syntax on
:set number
:set relativenumber
:set numberwidth=5
colorscheme slate 

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
