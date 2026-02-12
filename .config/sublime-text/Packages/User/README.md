# SublimeText

## Settings

To backup:

    cp -a ~/.config/sublime-text/Packages/User/* ${dotfiles-repo}/.config/sublime-text/Packages/User

To repair:

    cp -a ${dotfiles-repo}/.config/sublime-text/Packages/User/* ~/.config/sublime-text/Packages/User


## Initial Packages setup

```
cd ~/.config/sublime-text/Packages
git clone --depth=1 https://github.com/TheClams/SystemVerilog
git clone --depth=1 https://github.com/TheClams/SmartVHDL
git clone --depth=1 https://github.com/SublimeText/TrailingSpaces
git clone --depth=1 https://github.com/SublimeText/AsciiDoc
git clone --depth=1 https://github.com/tajmone/ST4-Asciidoctor
#git clone --depth=1 https://github.com/asciidoctor/sublimetext-asciidoc.git Asciidoctor
git clone --depth=1 https://github.com/Sublime-Instincts/BetterJinja Jinja2
git clone --depth=1 https://github.com/hjson/sublime-hjson Hjson
git clone --depth=1 https://github.com/jwortmann/ini-syntax INI
git clone --depth=1 https://github.com/mechatroner/sublime_rainbow_csv rainbow_csv
git clone --depth=1 https://github.com/jonschlinkert/sublime-markdown-extended markdown-extended
```


## Initial color themes setup

```
cd ~/.config/sublime-text/Packages/User
wget https://raw.githubusercontent.com/jonatasnardi/BlackBird-ColorScheme/refs/heads/master/BlackBird-Theme.tmTheme
```


