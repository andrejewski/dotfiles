# Dotfiles

These are my configuration files for `bash` and `git`.
They include aliases, custom functions, and more aliases.

The [sync-settings](https://atom.io/packages/sync-settings) package stores my Atom settings in a [separate gist](https://gist.github.com/andrejewski/88e8760bd8280b20f4aa28ec7606f9b5).

If you want to outright steal my files without cherry-picking snippets you want,
clone this repo and run `bash import.sh` inside. That command will write my
configs to the right places, overriding anything that already exists.

The `initialize.sh` script downloads the baseline software and apps
that I use. This is for fresh macOS devices.

## Fresh computers

I pride myself on staying light, starting on a brand new computer as
fast as possible. My best setup time is **29:15**, but I want to do better next
time. Here are the steps (macOS):

1. Max out trackpad speed. `System Preferences > Trackpad > Tracking speed`
1. Right click trackpad. `System Preferences > Trackpad > Secondary click`
1. Make Caps Lock another Control key. `System Preferences > Keyboard > Modifier Keys (bottom right)`
1. Download `dotfiles`:

    ```sh
    cd && mkdir -p Work/github-repos
    cd Work/github-repos
    git clone https://github.com/andrejewski/dotfiles.git
    cd dotfiles
    bash import.sh
    bash initialize.sh
    ```

1. Sign into Chrome
1. Register Sketch
  - Chris, your license is in your email
    - You can use it on two computers at a time
1. Hook up `sync-settings`:
  - `Atom > ⌘, > Install > Search "sync-settings"`
  - [Create a new personal access token](https://github.com/settings/tokens/new)
    - Choose the **Gist** permission
  - Use gist ID `88e8760bd8280b20f4aa28ec7606f9b5`

#### Optionals

1. Get Source Code Pro
  - [Download fonts](https://github.com/adobe-fonts/source-code-pro/releases/latest)
  - `Font Book > ⌘-O` and add all fonts from download.
  - Choose `Resolve automatically`
1. Get Chris wallpaper
  - This repo is private right now so *Chris you got this*
  - `System Preferences > Desktop and Screen Saver`
    - When you set up the wallpaper, you have to delete the existing space
      for the new wallpaper to show up for some stupid reason.
1. Make it Chrissy
  - Hide all Chrome extensions except OneTab and Screen Grab
  - Hide all dock icons except Finder and Trash

## Contributing

Do not open pull requests. Open issues, even if they are for adding new aliases
or functions. Deliberation on whether commands stay in takes weeks of actually
trying it so a pull request will be too much of a hassle.
