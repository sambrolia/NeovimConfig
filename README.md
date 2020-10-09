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
