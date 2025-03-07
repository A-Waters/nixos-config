

copy_config_folder() {
    if [ -z "$1" ]; then
        echo "Please provide a folder name."
        return 1
    fi
    
    local folder="$1"
    local source_folder="$HOME/.config/$folder"
    
    if [ -d "$source_folder" ]; then
        cp -r "$source_folder" ./.config
        echo "Successfully copied $folder to the current directory."
    else
        echo "Folder $folder does not exist in ~/.config."
        return 1
    fi
}




# copy OS
cp -r /etc/nixos/* ./etc/nixos/


# copy select config files
copy_config_folder waybar
copy_config_folder wofi
copy_config_folder kitty
copy_config_folder hypr


git add .
git commit -m "uploading configs"
git push
