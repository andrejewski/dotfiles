# Dotfiles

These are my current configuration files for `bash`, `vim`, and `git`.
They include aliases, custom functions, and more aliases.

I am transitioning to Atom with Vim from MacVim, so the `.vimrc` will
be sunset eventually; grab it while supplies last.

For my Atom settings, I use [sync-settings](https://atom.io/packages/sync-settings)
and store those files in a [separate gist](https://gist.github.com/andrejewski/88e8760bd8280b20f4aa28ec7606f9b5).

If you want to outright steal my files without cherry-picking just what you want,
clone this repo and run `bash import.sh` inside. That command will write all of my
configs to the right places, overriding anything that already exists.

There is also a `initialize.sh` script for downloading the baseline software and apps
that I use. This is only good for fresh macOS devices.

## Contributing

Only open issues, even if they are for adding new aliases or functions. Deliberation on whether commands stay in takes a few weeks of actually trying it so a pull request will be too much of a hassle.
