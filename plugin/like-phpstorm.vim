" like-phpstorm.vim - PhpStorm
"
"  Maintainer: b4b4r07 <b4b4r07@gmail.com>
"     Website: https://github.com/b4b4r07/vim-like-phpstorm
"     License: Distributed under the same terms as Vim. See ':help license'.
"     Version: 0.0.1
" Last Change: 2016-05-27
"       Usage: See 'doc/like-phpstorm.txt' or ':help like-phpstorm' if installed.

scriptencoding utf-8
if &diff | finish | endif

if get(g:, 'g:loaded_buftabs', 0) || &cpo
  finish
endif
let g:loaded_buftabs = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:lps_dot_return()
  let current_line = getline('.')

  if match(current_line, '\.') == -1
    return
  endif

  let matched_line = substitute(current_line, '^.*\.\(\w\+\)$', '\1', '')
  if empty(matched_line)
    return
  endif
  let replace_line = substitute(current_line, '\.\(\w\+\)$', '', '')
  let line =  matched_line .' '. replace_line

  call setline('.', line)
  execute ":startinsert!"
  " let pos = getpos(".")
  " execute ":normal cc" . line
  " call setpos('.', pos)
endfunction

command! LPSDotReturn call s:lps_dot_return()
inoremap <silent> <Plug>(lps-dot-return) <ESC>:<C-u>call <SID>lps_dot_return()<CR>
"nnoremap <silent> <Plug>(lps-dot-return) :<C-u>call <SID>lps_dot_return()<CR>
"nnoremap <silent> <Plug>(lps-dot-return) :<C-u>LPSDotReturn<CR>

let &cpo = s:save_cpo
" vim:set et fdm=marker ft=vim ts=2 sw=2 sts=2:
