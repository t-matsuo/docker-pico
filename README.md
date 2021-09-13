# docker-pico

Dockerfile to build [Pico CMS](https://github.com/picocms/Pico) container image.

## Building image

```
# docker build -t mypico .
```

## Usage

Run container with default config.

```
# docker run -d -p 80:80 -v /path/to/your/content:/var/www/html/content --name pico mypico
```

Run container with custom config. Template file is [here](https://github.com/picocms/Pico/blob/v2.1.4/config/config.yml.template).

```
# docker run -d -p 80:80 -v /path/to/your/content:/var/www/html/content -v /path/to/your/config.yml:/var/www/html/config/config.yml --name pico mypico
```

## Directories

* /var/www/html/content
   * put your contents
* /var/www/html/assets
   * put your assets
* /var/www/html/themes
   * put your custom themes
