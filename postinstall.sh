gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:appmenu"
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"


if ! grep -Fxq "[archlinuxfr]" /etc/pacman.conf
then
    sudo echo '' >> /etc/pacman.conf
    sudo echo '[archlinuxfr]' >> /etc/pacman.conf
    sudo echo 'SigLevel = Never' >> /etc/pacman.conf
    sudo echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
fi

sudo pacman -Syy --noconfirm
sudo pacman -S --noconfirm yaourt
yaourt -Syyu --noconfirm
yaourt -S --noconfirm gvim docker git zsh xclip tmux zsh-syntax-highlighting archey3 python-virtualenv firefox evolution libreoffice firefox-i18n-es-es libreoffice-fresh-es gnome-tweak-tool blueman gimp corebird liferea mpv mps-youtube-git gdm alacarte python-virtualenvwrapper youtube-dl gnome-shell-pomodoro sl silver-searcher-git xmodmap

yaourt -Rsn --noconfirm lightdm gnome-documents gnome-weather gnome-maps gnome-clocks gnome-documents

sudo systemctl disable lightdm
sudo systemctl enable gdm

groupadd docker
sudo usermod -s /usr/bin/zsh $USER
sudo usermod -G docker $USER

mkdir ~/.virtualenv
virtualenv ~/.virtualenv/pyutils
source ~/.virtualenv/pyutils/bin/activate
pip install nodeenv mycli
disable

rm -rf ~/.gitconfig
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.zshrc
rm -rf ~/.zsh
rm -rf ~/.tmux.conf

ln -s ~/Workspace/configurations/git/.gitconfig ~/.gitconfig
ln -s ~/Workspace/configurations/vim/.vimrc ~/.vimrc
ln -s ~/Workspace/configurations/vim/.vim ~/.vim
ln -s ~/Workspace/configurations/zsh/.zshrc ~/.zshrc
ln -s ~/Workspace/configurations/zsh/.zsh ~/.zsh
ln -s ~/Workspace/configurations/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/Workspace/configurations/scripts/ ~/.scripts
ln -s ~/Workspace/configurations/virtualenv/.nodeenvrc ~/.nodeenvrc
ln -s ~/Workspace/configurations/x/.Xmodmap ~/.Xmodmap

mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
mkdir -p ~/.vim/undo_files
