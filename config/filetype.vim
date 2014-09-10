
" File Types {{{1
"------------------------------------------------------------------------------

augroup MyAutoCmd

	" Update filetype on save if empty
	autocmd BufWritePost *
				\ if &l:filetype ==# '' || exists('b:ftdetect')
				\ |   unlet! b:ftdetect
				\ |   filetype detect
				\ | endif

	autocmd FileType ansible nnoremap <buffer> K
													\ :!zeal --query "ansible:<cword>"&<CR><CR>

	autocmd FileType gitcommit setlocal spell

	autocmd FileType gitcommit,qfreplace setlocal nofoldenable

	autocmd FileType html EmmetInstall

	autocmd BufNewfile,BufRead Rakefile set foldmethod=syntax foldnestmax=1

	autocmd FileType zsh setlocal foldenable foldmethod=marker

	" Enable omni completions for file types
	autocmd FileType c setlocal omnifunc=ccomplete#Complete
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType go setlocal omnifunc=go#complete#Complete
	autocmd FileType html,mustache,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType javascript setlocal omnifunc=tern#Complete
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
	if has('python3')
		autocmd FileType python setlocal omnifunc=python3complete#Complete
	else
		autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	endif
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
	autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Improved include pattern
	autocmd FileType html
				\ setlocal includeexpr=substitute(v:fname,'^\\/','','') |
				\ setlocal path+=./;/

	autocmd FileType apache setlocal path+=./;/

	autocmd FileType go highlight default link goErr WarningMsg |
				\ match goErr /\<err\>/

augroup END

" PHP
let g:php_folding = 0

" Python
let g:python_highlight_all = 1

" XML
let g:xml_syntax_folding = 1

" Vim
let g:vimsyntax_noerror = 1
"let g:vim_indent_cont = 0

" Bash
let g:is_bash = 1

" Java
let g:java_highlight_functions = 'style'
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1

" JavaScript
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" Vim script
" augroup: a
" function: f
" lua: l
" perl: p
" ruby: r
" python: P
" tcl: t
" mzscheme: m
let g:vimsyn_folding = 'af'

" Markdown
let g:markdown_fenced_languages = [
	\  'coffee',
	\  'css',
	\  'erb=eruby',
	\  'javascript',
	\  'js=javascript',
	\  'json=javascript',
	\  'ruby',
	\  'sass',
	\  'xml',
	\]
