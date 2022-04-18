FROM    ubuntu:latest
RUN     apt-get update -y
RUN     apt-get upgrade -y \
        && apt-get install nginx -y 
RUN     mkdir my-site
COPY    /code/. /my-site/.
COPY    ./custom-site.conf /etc/nginx/sites-available/.
WORKDIR /etc/nginx/sites-enabled/
RUN     rm -f default
RUN     ln -sf /etc/nginx/sites-available/custom-site.conf .
CMD     ["nginx", "-g", "daemon off;"]
