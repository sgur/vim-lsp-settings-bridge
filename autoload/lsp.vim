scriptencoding utf-8



" Interface {{{1

" call lsp#get_allowed_servers()
" call lsp#get_allowed_servers(bufnr('%'))
" call lsp#get_allowed_servers('typescript')
function! lsp#get_allowed_servers(...) abort
  if a:0 == 0
    let result = []
    for server in lsp#buffer#CurbufGetServers()
      let result += [server.name]
    endfor
    echomsg 1 result
    return result
  else
    if type(a:1) == v:t_string
      throw 'filetype: not implemented yet!'
    else
      let result = []
      for server in lsp#buffer#BufLspServersGet(a:1)
        let result += [server.name]
      endfor
      echomsg 2 result
      return result
    endif
  endif
  return []
endfunction

" Returns the current status of all servers (if called with no arguments) or
" the given server (if given an argument). Can be one of "unknown server",
" "exited", "starting", "failed", "running", "not running"
function! lsp#get_server_status(...) abort
  if a:0 == 0
    let result = []
    for server in lsp#buffer#CurbufGetServers()
      const status = s:running_to_status(server.running)
      let result += [printf("%s: %s", server.name, status)]
    endfor
    return join(result, "\n")
  else
    const server_name = a:1
    for server in lsp#buffer#CurbufGetServers()
      if server.name == server_name
        return s:running_to_status(server.running)
      endif
    endfor
    return 'unknown server'
  endif
  return 'unknown server'
endfunction

function! lsp#stop_server(server_name) abort
  call lsp#lsp#StopAllServers()
endfunction

" @params {server_info} = {
"   'name': 'go-langserver',        " required, must be unique
"   'allowlist': ['go'],            " optional, array of filetypes to allow, * for all filetypes
"   'blocklist': [],                " optional, array of filetypes to block, * for all filetypes,
"   'cmd': {server_info->['go-langserver]} " function that takes server_info and returns array of cmd and args, return empty if you ￫   don't want to start the server
" }
function! lsp#register_server(server_info) abort

  let cmd = type(a:server_info["cmd"]) == v:t_func ? a:server_info["cmd"](a:server_info) : a:server_info["cmd"]
  let lspServers = [#{
        \  name: a:server_info["name"],
        \  filetype: a:server_info["allowlist"],
        \  path: cmd[0],
        \  args: cmd[1:],
        \ }
        \]

  " initialization_options -> initializationOptions
  if has_key(a:server_info, 'initialization_options') && type(a:server_info["initialization_options"]) == v:t_dict
    let lspServers[0].initializationOptions = a:server_info["initialization_options"]
  endif
  " workspace_config -> workspaceConfig
  if has_key(a:server_info, "workspace_config") && type(a:server_info["workspace_config"]) == v:t_dict
    let lspServers[0].workspaceConfig = a:server_info["workspace_config"]
  endif
  " " capabilities -> features
  " if has_key(a:server_info, "capabilities") && type(a:server_info["capabilities"]) == v:t_dict
  "   let lspServers[0].features = a:server_info["capabilities"]
  " endif
  " rootSearch
  " runIfSearch
  " runUnlessSearch
  " customNotificationHandlers
  " customRequestHandlers
  " forceOffsetEncoding
  " omnicompl
  " processDiagHandler
  " syncInit
  " debug
  " traceLevel

  " semantic_highlight -> ???

  call lsp#lsp#AddServer(lspServers)
endfunction

function! lsp#get_server_capabilities(server_name) abort
  for server in lsp#buffer#CurbufGetServers()
    if server.name == a:server_name
      return get(server[0], 'caps', {})
    endif
  endfor
  return {}
endfunction

function! lsp#update_workspace_config(server_name, workspace_config) abort
  for server in lsp#buffer#CurbufGetServers()
    if server.name == a:server_name
      return server.sendWorkspaceConfig(a:workspace_config)
    endif
  endfor
endfunction

function! lsp#get_whitelisted_servers() abort
  throw 'not implemented yet!'
endfunction

function! lsp#send_request() abort
  throw 'not implemented yet!'
endfunction

function! lsp#get_position() abort
  const l:line = line('.')
  let l:char = lsp#util#GetCharIdxWithoutCompChar(bufnr('%'), {'line': l:line, 'character': col('.') - 1})
  return { 'line': l:line - 1, 'character': l:char }
endfunction

function! lsp#get_text_document_identifier(...) abort
    let l:buf = a:0 > 0 ? a:1 : bufnr('%')
    return { 'uri': lsp#utils#get_buffer_uri(l:buf) }
endfunction

function! lsp#_new_command() abort
  throw 'not implemented yet!'
endfunction

function! lsp#_last_command() abort
  throw 'not implemented yet!'
endfunction


" Internal {{{1

function! s:running_to_status(is_running) abort "{{{
  return a:is_running ? 'running': "failed"
endfunction "}}}

" Initialization {{{1


" 1}}}
