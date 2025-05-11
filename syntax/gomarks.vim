" Vim syntax file
" Language: gomarks configuration file
" Maintainer: https://github.com/haaag/gm
" Latest Revision: 2025-04-23

if exists("b:current_syntax")
  finish
endif

" Define the gomarks comment syntax - lines starting with #
syn match gomarksComment "^#.*$"
hi def link gomarksComment		Comment

" Define the gomarks content syntax - any line not starting with #
syn match gomarksContent "^[^#].*$" contains=gomarksTagsLine
hi def link gomarksContent		Normal

" Highlight tags line. Lines that ends with a comma.
syn region gomarksTagsLine start="^[^#].*,$" end="$" contained containedin=gomarksContent
      \ matchgroup=gomarksContent contains=gomarksTagItem
hi def link gomarksTagItem		Keyword

" Define individual tag items in the tags line
syn match gomarksTagItem "[^,]\+\ze," contained

" Define URL syntax for better highlighting
syn match gomarksUrl "\(https\?\|ftp\|ftps\|git\|ssh\|file\):\/\/[[:graph:]]\+"
		\ contained containedin=gomarksContent
hi def link gomarksUrl			Macro

" Highlight database filename
syn match gomarksDbName "\"[^\"]*\"" contained
syn match gomarksDbLine "^# database:.*$" contains=gomarksDbName
hi def link gomarksDbLine		Comment
hi def link gomarksDbName		YellowItalic

" Highlight version number
syn match gomarksVersionNum "v\d\+\.\d\+\.\d\+" contained
syn match gomarksVersionLine "^# version:.*$" contains=gomarksVersionNum
hi def link gomarksVersion		RedItalic
hi def link gomarksVersionLine	Comment
hi def link gomarksVersionNum	PurpleItalic

" Highlight bookmark ID
syn match gomarksBookmarkID "\d\+" contained
syn match gomarksBookmarkLine "^# \d\+ .*$" contains=gomarksBookmarkID
hi def link gomarksBookmarkID	YellowBold
hi def link gomarksBookmarkLine Comment

" Highlight text inside parentheses
"syn match gomarksParenText "(\zs[^)]*\ze)" contained
"syn match gomarksParenLine "^#.*(.*).*$" contains=gomarksParenText
"hi def link gomarksParenLine	Comment
"hi def link gomarksParenText	PreProc

" Highlight [New] tag
syn match gomarksNewTag "\[New\]" contained containedin=gomarksComment,gomarksContent
hi def link gomarksNewTag YellowItalic
" Highlight bracketed number patterns like [1/1]
syn match gomarksCountTag "\[\d\+\/\d\+\]" contained containedin=gomarksComment,gomarksContent
hi def link gomarksCountTag YellowItalic

" Highlight words between dashed lines
syn match gomarksSectionTitle "^# -\+\s\+\zs.\+\ze\s\+-\+$" contained
syn match gomarksSectionLine "^# -\+\s\+.\+\s\+-\+$" contains=gomarksSectionTitle
hi def link gomarksSectionTitle Title
hi def link gomarksSectionLine	Comment

"syn match gomarksTagsName "Tags:" contained containedin=gomarksComment,gomarksContent
"hi def link gomarksTagsName RedBold
"syn match gomarksUrlsName "URL:" contained containedin=gomarksComment,gomarksContent
"hi def link gomarksUrlsName Macro
"syn match gomarksDescName "Description:" contained containedin=gomarksComment,gomarksContent
"hi def link gomarksDescName White
"syn match gomarksTitleName "Title:" contained containedin=gomarksComment,gomarksContent
"hi def link gomarksTitleName White

let b:current_syntax = "gomarks"
" vim: set noet ts=4 sw=4 sts=4:
