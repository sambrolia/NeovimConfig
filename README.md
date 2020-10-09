# NeovimConfig
## Windows install
### Install neovim
choco install neovim

### Copy configuration
Copy the init.vim to AppData/local/nvim/init.vim

### Install plugin manager
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force
    
### Use it to install all plugins
Load up nvim:
:PlugInstall

## Linux Install
### Install neovim
sudo apt install neovim

### Copy Configuration
Copy the init.vim to ~/config/nvim/init.vim

### Install plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

