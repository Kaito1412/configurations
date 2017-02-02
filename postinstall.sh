gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>k']"
gsettings set org.gnome.desktop.wm.keybindings minimize "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Primary><Shift><Alt>j']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Primary><Shift><Alt>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Primary><Shift><Alt>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Primary><Shift><Alt>k']"
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>2', '<Alt>F2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Primary><Alt>j']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Primary><Alt>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Primary><Alt>l']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Primary><Alt>k']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>j']"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:appmenu"


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
yaourt -S --noconfirm gvim docker git zsh xclip tmux zsh-syntax-highlighting archey3 python-virtualenv firefox evolution firefox-i18n-es-es gnome-tweak-tool blueman gimp corebird liferea mpv mps-youtube-git gdm alacarte python-virtualenvwrapper youtube-dl gnome-shell-pomodoro sl silver-searcher-git lsb-release pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware ruby

yaourt -Rsn --noconfirm lightdm gnome-documents gnome-weather gnome-maps gnome-shell-extension-status-menu-buttons lightdm-webkit2-greeter light-locker light-locker-settings

sudo systemctl disable lightdm
sudo systemctl enable gdm

groupadd docker
sudo usermod -s /usr/bin/zsh $USER
sudo usermod -G docker $USER

mkdir ~/.virtualenvs
virtualenv ~/.virtualenv/pyutils
source ~/.virtualenv/pyutils/bin/activate
pip install nodeenv
deactivate

gem install ruby-virtualenv

rm -rf ~/.gitconfig
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.zshrc
rm -rf ~/.zsh
rm -rf ~/.tmux.conf
rm -rf ~/.myclirc
rm -rf ~/.archey3.cfg

mkdir -p ~/.config/autostart

ln -s ~/Workspace/configurations/git/.gitconfig ~/.gitconfig
ln -s ~/Workspace/configurations/vim/.vimrc ~/.vimrc
ln -s ~/Workspace/configurations/vim/.vim ~/.vim
ln -s ~/Workspace/configurations/zsh/.zshrc ~/.zshrc
ln -s ~/Workspace/configurations/zsh/.zsh ~/.zsh
ln -s ~/Workspace/configurations/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/Workspace/configurations/scripts/ ~/.scripts
ln -s ~/Workspace/configurations/virtualenv/.nodeenvrc ~/.nodeenvrc
ln -s Workspace/configurations/soundfonts ~/.soundfonts
ln -s ~/Workspace/configurations/others/.myclirc ~/.myclirc
ln -s ~/Workspace/configurations/others/.archey3.cfg ~/.archey3.cfg
ln -s ~/Workspace/configurations/others/.initrc ~/.initrc
ln -s ~/Workspace/configurations/others/myinit.desktop ~/.config/autostart/myinit.desktop

chmod +x ~/.initrc

mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
mkdir -p ~/.vim/undo_files
