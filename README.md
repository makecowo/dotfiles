# Makecowo Linux Setup and Dotfiles
My current setup is based on the Gruber Darker Theme and the dotfiles of Alexey Kutepov (aka remix). You can find the dotfiles of remix [here](https://github.com/rexim/dotfiles).

## TODO
- [ ] Create Nody Greeter Theme based on Gruvbox but with Gruber Darker Color and complete installation instructions.


## Linux Distribution (Endevaour OS)
I currently use Endeavour OS (Arch based Distribution). You can download it [here](https://endeavouros.com/). For a base system installation I choose the `online setup without window manager`. I like to start from a clean slate and install the necessary tools myself.

## Install useful tools
```bash
sudo pacman -S wget feh xclip
```

## Installing a Window Manager (i3)
As my window manager of choice I use i3. You can learn more about i3 [here](https://i3wm.org/).

In order to install i3 simply run the following command

```bash
sudo pacman -S i3-wm
```

## Install a Login Manager (Nody Greeter)
For my login Manager I use Nody Greeter. You can learn more about it on the Github page [here](https://github.com/JezerM/nody-greeter). Essentially it is a faster version of Web Greeter (which itself is a more modern replacement for Lightdm).

### Installing and enabling lightdm
First install Lightdm 
```bash
sudo pacman -S ligthdm
```

Next make sure the `lightdm.service` is enabled by running the following command:
```bash
sudo systemctl enable lightdm.service
```

### Install Web Greeter
```bash
yay -S web-greeter
```

### Installing Build Dependency for Nody Greeter
In order to install Nody Greeter we first need NPM (Node Package Manager). An easy way to manage and install NPM is NVM (Node Version Manager). You can install it by following the instructions on the Github page [here](https://github.com/nvm-sh/nvm) or by running the following command:

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

After that follow the instructions and you should be able to run the nvm command from the terminal. In order to install node version 16.x (which you will need to build nody-greeter) run the following command
```bash
nvm install 16
nvm use 16
```

### Building
In order to actually build Nody Greeter run the commands described on the Github page (see link above):
```bash
git clone --recursive https://github.com/JezerM/nody-greeter.git
cd nody-greeter
npm install
npm run rebuild
npm run build
sudo node make install
```

### Setting Nody Greeter as default Greeter
As a last step we need to set Nody Greeter as the default greeter for lightdm. Edit `/etc/lightdm/lightdm.conf` accordingly:
```bash
greeter-session=nody-greeter
```

### Installing Nody Greeter Gruber Darker Theme
I created a custom theme for Nody Greeter based on the provided Gruvbox Theme but with the Gruber Darker color scheme.

```bash
INSERT INSTALL INSTRUCTIONS HERE.
```

## Install Compositor
My compositor of choice is `picom`. You can install it by running:
```bash
sudo pacman -S picom
```

## Install Emacs
For programming I use Emacs
```bash
sudo pacman -S emacs
```
## Install i3lock-colors
For screen locking I use i3lock-colors. You can install it by running the following command
```bash
yay -S i3lock-colors
```

## Copy over the dotfiles
By now you should have everything ready to copy over the remaining dotfiles:
```bash
cp -r <CLONED_REPO_LOCATION>/i3 ~/.config
cp -r <CLONED_REPO_LOCATION>/.urxvt ~/
cp -r <CLONED_REPO_LOCATION>/.emcas ~/
cp <CLONED_REPO_LOCATION>/.Xresources ~/
cp <CLONED_REPO_LOCATION>/picom.conf ~/
```