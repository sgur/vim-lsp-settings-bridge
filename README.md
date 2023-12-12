# vim-lsp-settings-bridge

This plugin provides [prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp) compatible functions to use [mattn/vim-lsp-settings](https://github.com/mattn/vim-lsp-settings) with [yegappan/lsp](https://github.com/yegappan/lsp).

## Need to implement list

### `autoload/lsp_settings/profile.vim`

- [ ] `lsp#get_allowed_servers()`
    - Some parameters not implemented
- [x] `lsp#get_server_status()`

### `autoload/lsp_settings.vim`

- [x] `lsp#utils#find_nearest_parent_file_directory()`
- [x] `lsp#utils#get_buffer_path()`
- [x] `lsp#utils#get_default_root_uri()`
- [x] `lsp#utils#path_to_uri()`
- [x] `lsp#utils#uri_to_path()`
- [x] `lsp#stop_server()`
- [x] `lsp#register_server()`

### `settings/yaml-language-server.vim`

- [x] `lsp#utils#get_buffer_uri()`
- [x] `lsp#update_workspace_config()`
- [x] `lsp#get_server_capabilities()`

### `settings/vscode-json-language-server.vim`

- [x] `lsp#utils#get_buffer_uri()`
- [x] `lsp#update_workspace_config()`

### `settings/clangd.vim`

- [ ] `lsp#\_last\_command()`
    - Appropritate function not found
- [ ] `lsp#client#is_error()`
- [ ] `lsp#utils#error()`
- [ ] `lsp#client#error_message()`
- [ ] `lsp#utils#uri_to_path()`
- [ ] `lsp#utils#tagstack#\_update()`
- [ ] `lsp#utils#location#\_open_vim_list_item()`
- [ ] `lsp#get_whitelisted_servers()`
- [ ] `lsp#\_new_command()`
    - Appropritate function not found
- [ ] `lsp#send_request()`
- [x] `lsp#utils#get_buffer_uri()`

### `settings/texlab.vim`

- [x] `lsp#get_text_document_identifier()`
- [x] `lsp#get_position()`

### `settings/eclipse-jdt-ls.vim`

- [x] `lsp#register_command()`
- [ ] `lsp#utils#workspace_edit#apply_workspace_edit()`

### `settings/taplo.vim`

- [ ] `lsp#ui#output#preview()`
- [ ] `lsp#send_request()`

### `settings/steep.vim`

- [x] `lsp#utils#find_nearest_parent_file()`

### `settings/rust-analyzer.vim`

- [ ] `lsp#callbag#pipe()`
- [ ] `lsp#get_text_document_identifier()`
- [ ] `lsp#callbag#subscribe()`
- [ ] `lsp#utils#location#\_open_lsp_location()`
- [ ] `lsp#utils#\_split_by_eol()`
- [ ] `lsp#utils#range#\_get_recent_visual_range()`
- [ ] `lsp#utils#text_edit#apply_text_edits()`
- [ ] `lsp#utils#location#\_open_lsp_location()`
- [ ] `lsp#utils#position#lsp_to_vim`

### `settings/deno.vim`

- [ ] `lsp#utils#location#\_lsp_to_vim_list()`
- [ ] `lsp#utils#tagstack#\_update.vim()`
- [ ] `lsp#utils#location#\_open_vim_list_item()`
- [ ] `lsp#ui#vim#output#preview()`
- [ ] `lsp#capabilities#has_definition_provider()`
- [x] `lsp#get_allowed_servers()`
- [ ] `lsp#\_new_command()`
