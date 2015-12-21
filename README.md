# Laravel(+Apache) Dockerfile

Easy useable docker for laravel. less configuration, affordable production.

Server port is 80

## What's include

* php5, composer, apache2, git, curl
* apache mods: rewrite
* php mods: gd, mysqlnd, mcrypt, json, curl

#Usage

* Create Dockerfile to your project and paste below code.

```
# Dockerfile
FROM leenin/laravel-apache
```

###As follows can set in environment.

```
APP_ENV=local
APP_DEBUG=true
APP_KEY=SomeRandomString

DB_HOST=localhost
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret

CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_DRIVER=sync

REDIS_HOST=localhost
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
```
