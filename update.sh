#!/usr/bin/env bash

if [[ "$1" == "update_beta" ]]; then    # used only on server

    cd /jet/www/default/beta/
    git reset
    git checkout .
    sudo git pull --ff-only origin develop
#    cp -R * ../default/beta/
#    echo "Nao implementado"

elif [[ "$1" == "update_prod" ]]; then    # used only on server
    #cd /home/u219-fgz2rpsm789q/zwork
    cd /var/www/zwork
    git pull origin master
    echo "Copying public/index_prod.php to public/index.php"
    cp public/index_prod.php public/index.php
    echo "Copying public/.htaccess_prod to public/.htaccess"
    cp public/.htaccess_prod public/.htaccess
    echo "Copying all public/* to ../html/"
    cp -a public/* ../html/
    echo "Pull completed"

else
    if [[ "$1" == "beta" ]]; then

        git push origin develop
        ssh $2@35.247.250.238 "source /jet/www/default/beta/update.sh update_beta"

    elif [[ "$1" == "prod" ]]; then

        git push origin master
        ssh root@134.122.37.221 -p22 "source /var/www/zwork/update.sh update_prod"
        #ssh u219-fgz2rpsm789q@giow1054.siteground.us -p18765 "source zwork/update.sh update_prod"
    else
        echo "Erro: passe 'beta' ou 'prod' como parâmetro"
    fi
fi

