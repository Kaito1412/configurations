rm -rf ~/Workspace/configurations/bash/*
rm -rf ~/Workspace/configurations/git/*
rm -rf `ls -a tmux | grep -v dependencies`
rm -rf ~/Workspace/configurations/vim/*
rm -rf `ls -a zsh | grep -v dependencies`

cp ~/.bashrc ~/Workspace/configurations/bash/.bashrc
cp ~/.gitconfig ~/Workspace/configurations/git/.gitconfig
cp ~/.tmux.conf ~/Workspace/configurations/tmux/.tmux.conf
cp ~/.vimrc ~/Workspace/configurations/vim/.vimrc
cp -r ~/.vim ~/Workspace/configurations/vim/.vim
cp ~/.zshrc ~/Workspace/configurations/zsh/.zshrc
cp -r ~/.zsh ~/Workspace/configurations/zsh/.zsh

git commit -a -m "update" 
git push origin gigas
