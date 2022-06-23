#!/bin/bash
END='\033[0m' 
Yellow="\033[0;93m[x]" 
set -e


if [ $1 == "-install-docpht" ]; then 
    echo -e "${Yellow}Installing docpht.${END}">&2
    # cd ~/workflow/services/docpht_docker/
    if [ -d "docpht" ]; then
        echo -e "${Yellow}docpht folder exists.${END}">&2
        if [ -f "./docpht/Dockerfile" ]; then
            echo -e "${Yellow}found Dockerfile.${END}">&2
            exit
        else
            echo -e "${Yellow}no Dockerfile found.${END}">&2
            sudo rm -rf ./services/docpht_docker/docpht
            cd ~/workflow/services/docpht_docker/
            git clone https://github.com/docpht/docpht.git
        fi
    else
        echo -e "${Yellow}docpht folder does not exist.${END}">&2
        git clone https://github.com/docpht/docpht.git
    fi
fi
# exit

