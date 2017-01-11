/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install firefox thunderbird the_silver_searcher python python3 docker iterm2 zsh-syntax-highlighting sl tmux git pyenv-virtualenv pyenv-virtualenvwrapper archey seil

mkdir ~/.virtualenvs
virtualenv ~/.virtualenv/pyutils
source ~/.virtualenv/pyutils/bin/activate
pip install nodeenv
deactivate

rm -rf ~/.gitconfig
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.zshrc
rm -rf ~/.zsh
rm -rf ~/.tmux.conf
rm -rf ~/.myclirc
rm -rf ~/.archey3.cfg

ln -s ~/Workspace/configurations/git/.gitconfig ~/.gitconfig
ln -s ~/Workspace/configurations/vim/.vimrc ~/.vimrc
ln -s ~/Workspace/configurations/vim/.vim ~/.vim
ln -s ~/Workspace/configurations/zsh/.zshrc ~/.zshrc
ln -s ~/Workspace/configurations/zsh/.zsh ~/.zsh
ln -s ~/Workspace/configurations/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/Workspace/configurations/scripts/ ~/.scripts
ln -s ~/Workspace/configurations/virtualenv/.nodeenvrc ~/.nodeenvrc
ln -s ~/Workspace/configurations/others/.myclirc ~/.myclirc
ln -s ~/Workspace/configurations/others/.archey3.cfg ~/.archey3.cfg

mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
mkdir -p ~/.vim/undo_files
