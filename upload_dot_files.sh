#!/bin/sh

copy_config_folder() {
    if [ -z "$1" ]; then
        echo "Please provide a folder name."
        return 1
    fi
    
    local folder="$1"
    local source_folder="$HOME/.config/$folder"
    
    if [ -d "$source_folder" ]; then
        cp -r "$source_folder" ./home/.config
        echo "Successfully copied $folder to the current directory."
    else
        echo "Folder $folder does not exist in ~/.config."
        return 1
    fi
}






copy_home_dot_file() {
    if [ -z "$1" ]; then
        echo "Please provide a file name."
        return 1
    fi
    
    local file="$1"
    local source_file="$HOME/$file"
    
    if [ -f "$source_file" ]; then
        cp "$source_file" ./home/
        echo "Successfully copied $file to the home directory."
    else
        echo "file $file does not exist in $HOME."
        return 1
    fi
}


echo "Copying Nixos"
# copy OS
cp -r /etc/nixos/* ./etc/nixos/


echo "copying config folers"
# copy select config files
copy_config_folder waybar
copy_config_folder wofi
copy_config_folder kitty
copy_config_folder hypr


echo "copying home dot files"
copy_home_dot_file .zshrc
copy_home_dot_file .p10k.zsh


echo "adding to git"
git add .
git commit -m "uploading configs"
git push
