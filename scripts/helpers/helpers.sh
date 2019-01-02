# switch to a given color
# first argument is a string
# options: ["yellow","blue","green","red","default"]
# wrong / no options will revert to default
switchColor() {
    local mycolor=""

    case "$1" in
        yellow)
            mycolor="93";;
        blue)
            mycolor="94";;
        green)
            mycolor="32";;
        red)
            mycolor="31";;
        *)
            mycolor="0";;
    esac

    printf "\e[${mycolor}m"
}

# echo a yellow message
systemMessage(){
    if [[ $# -ne 2 ]] ; then
        echo ""
    fi
    
    switchColor "yellow"
    if ! [ -z ${1+x} ]; then echo -e "$1"; fi
    switchColor
}

# echo a red message
errorMessage(){
    switchColor "red"
    if ! [ -z ${1+x} ]; then echo -e "Error: $1"; fi
}

internalSystemMessage(){
    switchColor "blue"
    if ! [ -z ${1+x} ]; then echo -e "$1"; fi
    switchColor
}

# Print some user feedback and ask for them to continue
validateExecutionConditions(){
    printVariable "Current working directory" "$PWD"
    printVariable "user@hostname" "$(whoami)@$(hostname)"
    printVariable "uname" "$(uname)"
    printVariable "Dev mode enabled" $DEV_MODE

    switchColor yellow
    echo
    read -n 1 -s -r -p "Press any key to continue or Ctrl+C to exit"
    echo
    switchColor
}

# print a variable
# usage: 
# printVariable "name" "$(variable/command)"
printVariable(){
    printf "\e[94m$1: \e[0m$2\n"
}