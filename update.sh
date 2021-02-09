#!/usr/bin/env bash

if [[ "$1" == "update_beta" ]]; then    # used only on server

    cd /jet/www/default/beta/
    git reset
    git checkout .
    sudo git pull --ff-only origin develop
#    cp -R * ../default/beta/
#    echo "Nao implementado"

elif [[ "$1" == "update_prod" ]]; then    # used only on server

    cd html
    git pull origin prod
    echo "Pull completed"
    echo "Running npm run prod"
    npm run prod
    # cp public/index_prod.php public/index.php
    # echo "Copying public/.htaccess_prod to public/.htaccess"
    # cp public/.htaccess_prod public/.htaccess
    # echo "Copying all public/* to ../public_html/"
    # cp -a public/* ../public_html/


else
    if [[ "$1" == "beta" ]]; then

        git push origin develop
        ssh $2@35.247.250.238 "source /jet/www/default/beta/update.sh update_beta"

    elif [[ "$1" == "prod" ]]; then

        #git push origin master
        #ssh u219-fgz2rpsm789q@giow1054.siteground.us -p18765 "source zwork/update.sh update_prod"
        git push origin prod
        ssh root@134.122.42.132 "source html/update.sh update_prod"

    else
        echo "Erro: passe 'beta' ou 'prod' como parâmetro"
    fi
fi

