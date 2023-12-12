scriptencoding utf-8



" Interface {{{1

" Find a nearest to a `path` parent directory `directoryname` by traversing the filesystem upwards
function! lsp#utils#find_nearest_parent_directory(path, directoryname) abort
  return lsp#util#FindNearestRootDir(a:path, [a:directoryname])
endfunction

" Find a nearest to a `path` parent filename `filename` by traversing the filesystem upwards
function! lsp#utils#find_nearest_parent_file(path, filename) abort
  return lsp#util#FindNearestRootDir(a:path, [a:filename])
endfunction

" Find a nearest to a `path` parent filename `filename` by traversing the filesystem upwards
" The filename ending with '/' or '\' will be regarded as directory name,
" otherwith as file name
function! lsp#utils#find_nearest_parent_file_directory(path, filename) abort
  return lsp#util#FindNearestRootDir(a:path, [a:filename])
endfunction

function! lsp#utils#get_buffer_path(...) abort
  return expand((a:0 > 0 ? '#' . a:1 : '%') . ':p')
endfunction

function! lsp#utils#get_buffer_uri(...) abort
    let l:name = a:0 > 0 ? bufname(a:1) : expand('%')
    if empty(l:name)
        let l:nr = a:0 > 0 ? a:1 : bufnr('%')
        let l:name = printf('%s/__NO_NAME_%d__', getcwd(), l:nr)
    endif
    return lsp#utils#path_to_uri(fnamemodify(l:name, ':p'))
endfunction

function! lsp#utils#get_default_root_uri() abort
  return lsp#utils#path_to_uri(getcwd())
endfunction

function! lsp#utils#path_to_uri(path) abort
  return lsp#util#LspFileToUri(a:path)
endfunction

function! lsp#utils#uri_to_path(uri) abort
  return lsp#util#LspUriToFile(a:uri)
endfunction


" Initialization {{{1



" 1}}}
