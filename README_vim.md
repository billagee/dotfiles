tl;dr:

```
sudo port install vim +python27 +python35

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Added vundle config into .vimrc, most importantly:
#
# Plugin 'Valloric/YouCompleteMe'

# Restart vim and use the command :PluginInstall

~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

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
