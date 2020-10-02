<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

## About Z|Work

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as:

## How to deploy

`$ git clone https://github.com/foster-tech/zwork.git`

`$ cp .env_prod .env`

`$ cp public/index_prod.php public/index.php`

`$ mv public public_bak`

`$ ln -s ../public_html public`

`$ cp -a public_bak/* public/`

`$ cp public_bak/.htaccess_prod public/.htaccess`
