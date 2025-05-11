" https://github.com/haaag/gm
autocmd BufRead,BufNewFile *.gomarks setfiletype gomarks
autocmd FileType gomarks setlocal commentstring=\#\ %s
