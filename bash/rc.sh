export MT=~/.local/share/mastertemple

source $MT/bash/aliases.sh
source $MT/bash/envs.sh
source $MT/bash/functions.sh
source $MT/bash/shell.sh

# https://chatgpt.com/c/6a585fbb-de94-83e8-9ea2-f0a7557646c5
unset IS_ARTIX IS_MSI
export IS_ARTIX=0
export IS_MSI=0

case "$HOSTNAME" in
    artixtemple)
        export IS_ARTIX=1
        source "$MT/bash/artix.sh"
        ;;
    msitemple)
        export IS_MSI=1
        source "$MT/bash/msi.sh"
        ;;
esac
