# My Awesome CLI application
## Install
´´
curl -LSs https://box-project.github.io/box2/installer.php | php
composer install
chmod 775 bin/myawesomecliapp
´´´´

php.ini
phar.readonly = false


## Commands
bin/myawesomecliapp --version
bin/myawesomecliapp hello  

## Box
box build 


## References

https://moquet.net/blog/distributing-php-cl
https://github.com/kherge-abandoned/php-phar-update