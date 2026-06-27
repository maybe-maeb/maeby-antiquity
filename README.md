<div align="center">

#  Linux Antiquity 

<img src="./screenshots/happy_sun.png" width="6%">

</div>

<div align="center">

 **Linux Antiquity is a highly tasteful Linux-theme, reminiscent of art-nouveau and old drawings related to astronomy, science, and mythology.** 

</div>


<div align="center">

<a href="https://discord.gg/gleep">![badge](https://img.shields.io/badge/discord-262622?style=for-the-badge&logo=discord&logoColor=262622&logoSize=auto&color=e2e2d3) </a>
<a href="https://ko-fi.com/diinki">![badge](https://img.shields.io/badge/tip-262622?style=for-the-badge&logo=kofi&logoColor=262622&logoSize=auto&color=e2e2d3) </a>
<a href="https://youtube.com/@diinkikot">![badge](https://img.shields.io/badge/youtube_video-262622?style=for-the-badge&logo=youtube&logoColor=262622&logoSize=auto&color=e2e2d3) </a>

</div>

### IMPORTANT NOTICE ⚠️
This theme is first and foremost an art project whcih entails that as of version 0.1 the main focus was to get a proof of concept done and ready for my video about this theme, so **INSTALL AND USE AT YOUR OWN RISK!**

A lot of the code, a **large** portion will be refactored post version 0.1, and a lot of designs may change and be improved.

Performance of the UI was not a concern as of version 0.1, but regardless it runs well for me. Just keep in mind that it isn't optimized yet.

If you intend to use this theme, do subscribe/follow this repo to be notified of any updates. I recommend installing the latest version of the theme often.

I'm quite busy, but I will try to improve and update this theme as much as I can since I will be using this as my main theme.
____

### Dependencies 📦
The install script should notify you if anything is missing.

**Required Software:**
* `Hyprland` (>0.55)
* `Hyprpaper` *For wallpapers*
* `Quickshell` (>0.3.0)
* `Kitty` *Terminal configs use by default*
* `Nemo` *File explorer configs use by default*
* `Mako`
* `jq`
* `socat`

**Recommended Software:**
* `nwg-look` To easily set icon theme, gtk theme, cursors etc
* `dconf` & `dconf-editor` To easily set environment variables related to the theme.

### Setting quickshell-specific Icon Themes 🎨
You can find and use your own icon theme, but you will need to customize the top lines of code in the `.config/quickshell/shell.qml` directory to set the icon theme in the quickshell UI specifically. Namely:

`~/.config/quickshell/shell.qml`:
```
/* NOTE: CHANGE THESE IF YOU WANT TO USE A DIFFERENT ICON THEME:*/
//@ pragma IconTheme buuf-nestort
//@ pragma Env QS_ICON_THEME=buuf-nestort
```

I have included an icon theme that I think fits well in this repo as well (buuf-nestort). But feel free to pick your own.

Make sure to place the icon theme folders in `~/.local/share/icons` in order for them to be found.

### External Themes 🎨
I decided to not include things such as GTK theme and cursor theme into this repo, because those are highly up to you and I think there's a wide range of styles that would look well with this theme.

### Installation ⬇️
Simply run the install script `./install.sh` and it should move the relevant directories to your `~/.config` folder. If you prefer to do this yourself then you can simply find the config directories in this repo and move them manually.

The install script will create backups of existing directories before it replaces them, and it will also notify you if any dependencies are missing.

This theme does require some manual config file editing in order to setup wallpapers, monitors, and also set the kitty terminal theme to whichever one you want.

I've made a set of kitty terminal themes that match each relevant theme that comes with Linux Antiquity by default.

I might also make a more detailed installation guide video later on, I'll link that here should I make one.

