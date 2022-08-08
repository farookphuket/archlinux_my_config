
"nnoremap <Leader>pf :Files<CR> set Spacebar key as the leader key
let mapleader = " "


" fuzzy file 
nnoremap <Leader>f :Files<CR>


nnoremap <leader>t :Lexplore<CR>

" open new tab
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tnn :tabnext<CR>
nnoremap <leader>tpp :tabprevious<CR>

" close buffer in tab
nnoremap <leader>c :bd!<CR>

" list the buffer
nnoremap <leader>ll :ls<CR>

" this key binding will not work if you don't have gvim install!
" copy to system clipboard in Vitual Mode
" to paste from system clipboard use Control+Shift+v
vmap <C-y> "+y
"map key Control+y for copy from vim to system clipboard on 16-July-2020
" IMPORTANT!! please Install GVim in order to make the above key binding work



" easy paste long text from clipboard
nnoremap <leader>pp "+p


" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf





" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" move visually select lines up or down
" from Nick Janetakis https://www.youtube.com/watch?v=gNyNm5DsQ88
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


nnoremap <leader>cr :CocRestart
nnoremap <leader>ct :CocCommand explorer --toggle<CR>

" refresh source
nnoremap <leader><CR> :so ~/.vimrc<CR>
