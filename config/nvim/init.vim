
" turn on mouse
set mouse=a
" tab spacing
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
set autoindent

"remap leader key to space for convenience
let mapleader = "\<Space>"

" some completion configurations
set wildmenu
set wildmode=longest:full,full

" set compund line numbering
set number relativenumber

" Faster motions with <Shift>
noremap H 5h
noremap L 5l
noremap J 3j
noremap K 3k
noremap W 3w
noremap B 3b

" tabs
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <silent>+ :tabe .<CR>
nnoremap <silent>- :tabc<CR>

" C-s to save
nnoremap <Leader><C-s> :write
inoremap <C-s> <C-o>:w<CR>

"remap U to redo
nnoremap U <C-r>

" <Space>y to copy to clipboard, <Space>p to paste from clipboard, <Space>d to cut to clipboard
noremap <Leader>y "+y
noremap <Leader>d "+d
noremap <Leader>p "+p
" <Space>Y to copy to end of line to clipboard (Y yank to end of line)
noremap <Leader>Y "+y$
noremap Y y$
" <Space>D to cut to end of line to clipboard
noremap <Leader>D "+D
" <Space>P to paste before cursor from clipboard
noremap <Leader>P "+P

" Backspace works in normal and visual mode
nnoremap <BS> "_d<Left>
vnoremap <BS> "_d

" occasionally causes a poblem
set nomodeline
