# NeoVim Configuration for Linux Kernel Development

This is a lua based, bootstrap-able NeoVim Configuration for C development (for example, Linux Kernel or Qemu).

This repo is based on Allaman's [NeoVim Configuration](https://github.com/allaman/nvim).

## Prerequisite

1. Install NeoVim. Refer to [NeoVim Installation Wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim)
2. Have access to github.com. Proxy may need to be configured if sitting in internal network.

## Install

1. Clone this repo to ~/.config/nvim
2. Launch 'nvim'. This will download all the necessary plugins automatically.
3. Quit nvim, and relaunch nvim. That's it.

## Post-Install

1. Install language servers (clangd, bashls, etc.). Refer to [server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) on how to install language servers.
2. Install Nerd font

## Generate compile_commands.json for Linux Kernel

Run scripts/clang-tools/gen_compile_commands.py after kernel compiling.

For arm64 cross compilation, Language Server clangd may not work. Create a file named .clangd in kernel source code directory to workaround:

```bash
[x48Jason@x48 linux]$ cat .clangd
CompileFlags:
  Remove: -mabi=lp64
[x48Jason@x48 linux]$
```

## Key Bindings

| Mode | Key              | Binding                                              |
| ---- | ---------------- | ---------------------------------------------------- |
| n    | \<SPACE\>        | Leader key                                           |
| n    | tt               | Toggle Nvim-Tree on left side                        |
| n    | ts               | Toggle SymbolsOutline on right side                  |
| n    | ff               | Telescope find file                                  |
| n    | fg               | Telescope lsp dynamic workspace symbols              |
| n    | \<C-\]\>         | LSP go to definition                                 | 
| n    | \<C-\\\>s        | Telescope lsp find symbol references                 |
| n    | K                | LSP hover on current word                            |
| n    | \<ESC\>          | Cancel search highlight                              |
| n    | \<TAB\>          | Goto next buffer                                     |
| n    | \<C-Left\>       | Window vertical resize +1                            |
| n    | \<C-Right\>      | Window vertical resize -1                            |
| n    | \<C-Up\>         | Window resize -1                                     |
| n    | \<C-Down\>       | Window resize +1                                     |
| n    | \<C-w\>          | Switch window                                        |
| n    | \<C-n\>          | Start a terminal                                     |
| t    | \<ESC\>          | Back to normal mode in terminal                      |


