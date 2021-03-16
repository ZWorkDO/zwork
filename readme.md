<p align="center"><img src="https://zwork.do/uploads/settings/general/1590019348-Picture3.png"></p>

## About Z|Work

Z | Work is a digital platform with unlimited access to specialized professionals who make projects a reality on a daily basis, of which we are proud.

## How to deploy config locally

GNU/LINUX

`$ git clone https://github.com/ZWorkDO/zwork.git`

`$ cp .env_local .env`

`$ cp public/index_local.php public/index.php`

`$ composer install`

`$ npm install`

`$ npm run dev`

WINDOWS

`> git clone https://github.com/ZWorkDO/zwork.git`

`> copy .env_local .env`

`> copy public/index_local.php public/index.php`

`> composer install`

`> npm install`

`> npm run dev`


## How to run the program on Linux Mint

The following are the commands to execute the program using Linux Mint:

**Restart the MySQL sevice**:

1. Stop MySQL service to avoid a process error:

    ```bash
    service mysql stop
    ```

2. Stop apache2:

    ```bash
    sudo /etc/init.d/apache2 stop
    ```

**Commands for execution**:

3. Start service xampp:
 
    ```bash
    sudo /opt/lampp/lampp start
    ```

4. Execute the program:

    ```bash
    sudo php artisan serve 
    ```