


#libs
sudo apt-get install -y libassuan-dev xcb libxcb-xkb-dev x11-xkb-utils libx11-xcb-dev libxkbcommon-x11-dev libxrender-dev libconfig++-dev libgpgme11-dev libfreetype6-dev libfontconfig1-dev xutils-dev  libtool-bin make libx11-dev libxinerama-dev  libx11-xcb-dev libxcb-res0-dev  libharfbuzz-dev 

#softwares and need
sudo apt-get install -y git curl wget neovim sxiv mpv zathura ffmpeg imagemagick   fzf man-db xwallpaper python-pywal unclutter xclip maim  zip unzip unrar p7zip  xdotool  brightnessctl ntfs-3g git sxhkd zsh  pipewire pipewire-pulse  emacs-nox  rsync qutebrowser dash  xcompmgr  libnotify-dev dunst suckless-tools jq aria2 cowsay connman  rsync pulsemixer mpd ncmpcpp zsh-syntax-highlighting xdg-user-dirs libconfig-dev python3 python2 python3-pip


#left are python pywal can be installed via pip  zathura-pdf-mupdf pipewire
# build libxft

git clone https://gitlab.com/zanc/xft


sudo apt install autotools-dev automaker
autoreconf --force --install
./configure
make
sudo make install

# install fonts all
sudo apt-get install -y  fonts-noto fonts-noto-color-emoji fonts-noto-cjk fonts-font-awesome fonts-jetbrains-mono

# install latest jetbrains joypixel and font awesome from aur
#command to mv font for global use 
# sudo mv *.ttf /usr/share/fonts/


#build dwm and all and install dotfiles and its needed softwares

#installing pywall

sudo pip3 install pywal



#zsh-syntax-highlighting from aur to the destines folder non git version



#after alll this make all dwm and st and all
cd $HOME
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/bugswriter/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles


#making dirs
mkdir dl dox imp music pix pub code

# dwm: Window Manager
git clone --depth=1 https://github.com/Bugswriter/dwm.git ~/.local/src/dwm
sudo make -C ~/.local/src/dwm install

# st: Terminal
git clone --depth=1 https://github.com/Bugswriter/st.git ~/.local/src/st
sudo make -C ~/.local/src/st install

# dmenu: Program Menu
git clone --depth=1 https://github.com/Bugswriter/dmenu.git ~/.local/src/dmenu
sudo make -C ~/.local/src/dmenu install

# dmenu: Dmenu based Password Prompt
git clone --depth=1 https://github.com/ritze/pinentry-dmenu.git ~/.local/src/pinentry-dmenu
sudo make -C ~/.local/src/pinentry-dmenu clean install

# dwmblocks: Status bar for dwm
git clone --depth=1 https://github.com/bugswriter/dwmblocks.git ~/.local/src/dwmblocks
sudo make -C ~/.local/src/dwmblocks install




ln -s ~/.config/x11/xinitrc .xinitrc
ln -s ~/.config/shell/profile .zprofile
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.oh-my-zsh ~/.config/zsh/oh-my-zsh
rm ~/.zshrc ~/.zsh_history
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no



#to make dwm entry at start

sudo apt-get install dwm
sudo cp /usr/share/xsessions/dwm.desktop{,.bak}
sudo apt-get purge dwm
sudo mv /usr/share/xsessions/dwm.desktop{.bak,}


