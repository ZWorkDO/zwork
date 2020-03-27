#!/usr/bin/env bash

if [[ "$1" == "update_beta" ]]; then    # used only on server

    cd /jet/www/default/beta/
    git reset
    git checkout .
    sudo git pull --ff-only origin develop
#    cp -R * ../default/beta/
#    echo "Nao implementado"

elif [[ "$1" == "update_prod" ]]; then    # used only on server

    cd /home/u219-fgz2rpsm789q/zwork
    git reset
    git checkout .
    git pull --ff-only origin master
    cp public/index_prod.php public/index.php
    cp public/.htaccess_prod public/.htaccess
    cp -a public/* ../public_html/

else
    if [[ "$1" == "beta" ]]; then

        git push origin develop
        ssh $2@35.247.250.238 "source /jet/www/default/beta/update.sh update_beta"

    elif [[ "$1" == "prod" ]]; then

        git push origin master
        ssh u219-fgz2rpsm789q@giow1054.siteground.us -p18765 "source /zwork/update.sh update_prod"

    else
        echo "Erro: passe 'beta' ou 'prod' como parâmetro"
    fi
fi

