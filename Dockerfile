from opensuse/leap:15.1


ADD entrypoint.sh /usr/bin/entrypoint.sh

RUN zypper install -y npm git

RUN chmod a+x /usr/bin/entrypoint.sh 
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

WORKDIR /
RUN git clone https://github.com/brimsec/brim.git

WORKDIR /brim

RUN npm install -g electron-packager

RUN npm install

WORKDIR /out

RUN zypper install -y unzip 
RUN electron-packager /brim
