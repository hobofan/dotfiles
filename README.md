Requirements
------------

Install zsh ( [more information about zsh](http://wiki.ubuntuusers.de/Zsh) )

    sudo apt-get install zsh

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/hobofan/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm):

    # Arch Linux
    yaourt -Syu rcm-git --noconfirm

Install symlinks:

    cd dotfiles

    # Desktop
    rcup -x README.md -x LICENSE -t desktop

    # Laptop
    rcup -x README.md -x LICENSE -t laptop

This will create symlinks for config files in your home directory. The `-x`
options, which exclude the `README.md`, and `LICENSE`, are
needed during installation but can be skipped once the `.rcrc` configuration
file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

You may set your git user-name and -email directly, see therefore the next step
and update/create your `~/.gitconfig.local`

Make your own customizations
----------------------------

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.gvimrc.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.vimrc.bundles.local`
* `~/.zshrc.local`


Credits
-------

Thank you, [thoughtbot & contributors](https://github.com/thoughtbot/dotfiles/contributors)!
for providing the base for this repository
