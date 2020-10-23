<p align="center"><img src="https://zwork.do/uploads/settings/general/1590019348-Picture3.png"></p>

## About Z|Work

Z | Work is a digital platform with unlimited access to specialized professionals who make projects a reality on a daily basis, of which we are proud.

## How to deploy

GNU/LINUX

`$ git clone https://github.com/foster-tech/zwork.git`

`$ cp .env_prod .env`

`$ cp public/index_prod.php public/index.php`

`$ mv public public_bak`

`$ ln -s ../public_html public`

`$ cp -a public_bak/* public/`

`$ cp public_bak/.htaccess_prod public/.htaccess`

WINDOWS

`> git clone https://github.com/foster-tech/zwork.git`

`> copy .env_prod .env`

`> copy public/index_prod.php public/index.php`

`> move public public_bak`

`> mklink public_html public`

`> copy public_bak\* public\`

`> copy public_bak\.htaccess_prod public\.htaccess`
