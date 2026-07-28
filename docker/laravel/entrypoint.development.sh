#!/bin/bash #this tell linux to use bash to run this script
set -e  #If any command returns an error (non-zero exit code), stop executing the script immediately.

# composer install
# wait $!
# npm install
# wait $!
#php artisan key:generate #this will generate a new application key for your Laravel application. 
                         #it stores the key in the .env file and is used for encryption and security purposes.
                         #it will generate a random key into .env file everytime you run this script, so make sure to run it only once when setting up your application for the first time.
                         # to avoid regenerating the key every time you run the script, you can check if the key already exists in the .env file before running this command.
if ! grep -q "^APP_KEY=base64:" .env; then
    php artisan key:generate
fi
wait $!
php artisan migrate
wait $!
exec supervisord -c /etc/supervisor/conf.d/supervisord.development.conf

