Storeness dotfiles
===================

Requirements
------------

Install zsh ( [more information about zsh](http://wiki.ubuntuusers.de/Zsh) )

    sudo apt-get install zsh

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/thoughtbot/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm):

    wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.3-1_all.deb
    sudo dpkg -i rcm_1.2.3-1_all.deb

Install symlinks:

    rcup -d dotfiles -x README.md -x LICENSE -x Brewfile

This will create symlinks for config files in your home directory. The `-x`
options, which exclude the `README.md`, `LICENSE`, and `Brewfile` files, are
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

For example, your `~/.aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/.gitconfig.local` might look like this:

    [alias]
croaky      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset
    [user]
      name = Dan Croak
      email = dan@thoughtbot.com

Your `~/.zshrc.local` might look like this:

    # recommended by brew doctor
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

Your `~/.vimrc.bundles.local` might look like this:

    Bundle 'Lokaltog/vim-powerline'
    Bundle 'stephenmckinney/vim-solarized-powerline'

What's in it?
-------------

[vim](http://www.vim.org/) configuration:

* [Ctrl-P](https://github.com/kien/ctrlp.vim) for fuzzy file/buffer/tag finding.
* [Rails.vim](https://github.com/tpope/vim-rails) for enhanced navigation of
  Rails file structure via `gf` and `:A` (alternate), `:Rextract` partials,
  `:Rinvert` migrations, etc.
* Run [RSpec](https://www.relishapp.com/rspec) specs from vim.
* Set `<leader>` to a single space.
* Switch between the last two files with space-space.
* Syntax highlighting for CoffeeScript, Textile, Cucumber, Haml, Markdown, and
  HTML.
* Use [Ag](https://github.com/ggreer/the_silver_searcher) instead of Grep when
  available.
* Use [Exuberant Ctags](http://ctags.sourceforge.net/) for tab completion.
* Use [GitHub color scheme](https://github.com/croaky/vim-colors-github).
* Use [Vundle](https://github.com/gmarik/vundle) to manage plugins.

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course)
configuration:

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+a` (like GNU screen).
* Soften status bar color from harsh green to light gray.

[git](http://git-scm.com/) configuration:

* Adds a `create-branch` alias to create feature branches.
* Adds a `delete-branch` alias to delete feature branches.
* Adds a `merge-branch` alias to merge feature branches into master.
* Adds an `up` alias to fetch and rebase `origin/master` into the feature
  branch. Use `git up -i` for interactive rebases.

[Ruby](https://www.ruby-lang.org/en/) configuration:

* Add trusted binstubs to the `PATH`.
* Load rbenv into the shell, adding shims onto our `PATH`.

Shell aliases and scripts:

* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like `git`.
* `git-churn` to show churn for the files changed in the branch.
* `m` for `rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare`.
* `mcd` to make a directory and change into it.
* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `rk` for `rake`.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

Credits
-------

Thank you, [contributors](https://github.com/thoughtbot/dotfiles/contributors)!
Also, thank you to Corey Haines, Gary Bernhardt, and others for sharing your
dotfiles and other shell scripts from which we derived inspiration for items
in this project.

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Dotfiles is maintained by [thoughtbot, inc](http://thoughtbot.com/community)
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

Dotfiles is © 2009-2014 thoughtbot, inc. It is free software and may be
redistributed under the terms specified in the [LICENSE](LICENSE) file.
