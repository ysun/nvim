# NeoVim Configuration for Linux Kernel Development

## Prerequisite

1. Install NeoVim. Refer to [NeoVim Installation Wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim)
2. Install Clangd.
3. Have access to github.com.

## Install

1. Clone this repo to ~/.config/nvim
2. Launch 'nvim'. This will download all the necessary plugins automatically.
3. Quit nvim, and relaunch nvim. That's it.

## Generate compile_commands.json for Linux Kernel

Run scripts/clang-tools/gen_compile_commands.py after kernel compiling.

For arm64 cross compilation, Language Server clangd may not work. Create a file named .clangd in kernel source code directory:

```bash
[x48Jason@x48 linux]$ cat .clangd
CompileFlags:
  Remove: -mabi=lp64
[x48Jason@x48 linux]$
```
