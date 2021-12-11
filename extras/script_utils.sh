chezlog() {
    printf "[chezmoi] $1\n"
}

prompt_yn() {
    while true; do
        read -p "$1 (y/n)? " yn
        case $yn in
            [Yy]* ) return 1;;
            [Nn]* ) return 0;;
        esac
    done
}

check_available() {
    chezlog "Checking if $1 is installed"
    if ! which $1 > /dev/null 2>&1; then
        return 1
    fi
    chezlog "$1 executable found at $(which $1)"
    return 0
}

