# Dotfiles

These are my configuration files for `bash` and `git`.
They include aliases, custom functions, and more aliases.

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
    bash initialize.sh
    bash import.sh
    ```

1. Sign into Chrome
1. Register Sketch
    - The Sketch licence is in an email, only good on two computers.

#### Optionals

1. Get Source Code Pro
    - [Download fonts](https://github.com/adobe-fonts/source-code-pro/releases/latest)
    - `Font Book > ⌘-O` and add all fonts from download.
    - Choose `Resolve automatically`
1. Get Chris wallpaper
    - Download from [andrejewski/identity](https://github.com/andrejewski/identity)
    - `System Preferences > Desktop and Screen Saver`
        - When you set up the wallpaper, you have to delete the existing space
          for the new wallpaper to show up for some stupid reason.
1. Make it Chrissy
    - Hide all Chrome extensions except OneTab
    - Hide all dock icons except Finder and Trash

## Contributing

Do not open pull requests. Open issues, even if they are for adding new aliases
or functions. Deliberation on whether commands stay in takes weeks of actually
trying it so a pull request will be too much of a hassle.
