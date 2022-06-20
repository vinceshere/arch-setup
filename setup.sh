#!/bin/sh
set -e pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
SEPARATOR="===================================================="

print_message() {
    echo $SEPARATOR
    echo "$1"
    echo $SEPARATOR
}

print_message "Updating repositories:"
sudo pacman -Syu
print_message "Finished updating repositories!"

print_message "Installing base-devel:"
sudo pacman -Syy --needed --noconfirm base-devel
print_message "base-devel installed!"

print_message "Installing pacman packages list:"
sudo pacman -Syy --needed --noconfirm $(cat $SCRIPT_DIR/pacman-packages-list.txt | cut -d' ' -f1)
print_message "pacman packages installed!"

print_message "Installing yay:"
cd /tmp && git clone https://aur.archlinux.org/yay && cd /tmp/yay && makepkg -si
print_message "Yay installed!"

print_message "Installing yay packages list:"
yay --noprovides --answerdiff None --answerclean None --noconfirm --needed -S $(cat $SCRIPT_DIR/yay-packages-list.txt)
print_message "Yay packages list installed!"

print_message "Enabling services:"
sudo systemctl enable cups
sudo systemctl enable bluetooth
sudo systemctl enable docker
print_message "Finished enabling services!"

print_message "Add user to docker group:"
sudo usermod -aG docker $USER
print_message "Finished adding user to docker group!"

print_message "Setup betterlockscreen background:"
betterlockscreen -u ~/.local/share/wallpapers
print_message "Finished betterlockscreen setup!"

print_message "Update user dirs:"
xdg-user-dirs-update
print_message "Finished updating user dirs!"

print_message "Set zsh as default shell:"
chsh -s $(which zsh)
print_message "Finished setting default shell!"

print_message "Set wallpaper:"
feh --bg-fill ~/.local/share/wallpapers/image23.png
print_message "Finished setting wallpaper!"

print_message "Installing VSCode extensions:"
code --install-extension arcticicestudio.nord-visual-studio-code
code --install-extension dbaeumer.vscode-eslint
code --install-extension EditorConfig.EditorConfig
code --install-extension lukashass.volar
code --install-extension naumovs.color-highlight
code --install-extension Tyriar.sort-lines
print_message "Finished installing VSCode extensions!"

print_message "Reboot your machine to start a graphical session :)"
