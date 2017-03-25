tl;dr:

```
sudo port install vim +python27 +python35

# Or with homebrew:

brew install vim # python27 support should be compiled in by default

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Added vundle config into .vimrc, most importantly:
#
# Plugin 'Valloric/YouCompleteMe'

# Restart vim and use the command :PluginInstall

(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer)

# Tell git that you want to use the new custom-built vim as your editor;
# without this, 'git commit' may display the error
# "Symbol not found: __PyCodecInfo_GetIncrementalDecoder"
# See https://github.com/Valloric/YouCompleteMe/issues/549

git config --global core.editor `which vim`

# Delete tags file from ctags if you have one in your project

# Delete and recreate your virtualenv if you're using one

# You should now be able to CTRL-space to bring up Python completion
# or simply type to autocomplete
```

* Useful links when configuring vim and YouCompleteMe:

https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

https://github.com/Valloric/YouCompleteMe

* To see all the python vim variants in macports:

```
$ port variants vim
vim has the variants:
...
   python27: Enable Python scripting
     * conflicts with python26
...
   python35: Enable Python scripting
     * conflicts with python33 python34 python36udo port install vim +python27 +python35
```

* Installing Vundle:

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Then add vundle config from the vundle README into .vimrc, and
# most importantly enable YCM:
#
# Plugin 'Valloric/YouCompleteMe'

# Restart vim and use the command :PluginInstall
# or on the cmdline run `vim +PluginInstall +qall`
```

* Then to complete the YCM install:

```
~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

* For commands that let you jump to definitions/declarations, see:

https://github.com/Valloric/YouCompleteMe#goto-commands

To use them, put the cursor on the item you want to complete, and use a command, e.g.:

    :YcmCompleter GoTo

If you want to make shorter mappings of the GoTo commmands, that can be done in your .vimrc.

This example allows you to type ```\jd``` to jump, assuming your leader key is the default ```\```:

```
" Map \jd to :YcmCompleter GoTo
" Note that if you don't want to use leader key '\' that too can be remapped:
nnoremap <leader>jd :YcmCompleter GoTo<CR>
```
