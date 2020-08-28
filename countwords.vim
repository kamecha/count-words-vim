" Vim global pugin for count words
" 
"エンコーディング指定
scriptencoding utf-8

すでにスクリプトをロードした場合は終了
if exists('g:loaded_countwords')
    finish
endif
let g:loaded_countwords = 1

let s:save_cpo = &cpo
set cpo&vim

"本体
function! s:Count_words() range
    let lnum = a:firstline
    let n = 0
    while lnum <= a:lastline
        let n = n + len(split(getline(lnum)))
        let lnum += 1
    endwhile
    echo "found" . n . "words"
endfunction

command! -range CountWords <line1>,<line2> call s:Count_words()

let &cpo = s:save_cpo
unlet s:save_cpo

