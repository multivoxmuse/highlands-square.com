
# Web server!
Install `apache2`, `mod_wsgi`, `python3.4`, `python3-pip`, `python3-dev`, `python3-setuptools`, `mysql-server`, `mytop` from apt-get

```
pip3 install --upgrade pip 
```

(after doing this pip will be newest version, and to run it use "pip" instead of "pip3")

```
pip3 install virtualenv==13.1.2
```

```
mkdir ~/hsma_app
cd ~/hsma_app
```

---
deploy django package like ~/hsma_app/hisquare/ (/manage.py...djangostuff)
---

```
virtualenv env
source env/bin/activate
pip install -r hisquare/REQUIREMENTS.txt 
```
install the version of mysql connector from here for django 1.8: 

```
pip install http://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python-2.1.3.tar.gz
python manage.py runmodwsgi --setup-only --port=8001 \
    --user www-data --group www-data \
    --server-root=/www/hisquare/mod_wsgi-express-8001

deactivate
```

# Static files!
Deploy all static files into /www/hisquare/static/app_name

Use the following config to set up your nginx proxy pass from port 80 to gather staticfiles, or if the request is not a staticfile pass on the request to apache on port 8001.

```
server {
  client_max_body_size 100M;
  listen 80 default_server;
  listen [::]:80 default_server ipv6only=on;

  root /www/hisquare;
  # index index.html index.htm;

  # Make site accessible from domain/hostname
  server_name highlands-square.com;

  location /media/ {}
  location /static/ {}

  location / {
    proxy_pass http://localhost:8001;
  }
```
