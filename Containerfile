FROM fedora

ARG UBLOCK_LATEST="https://addons.mozilla.org/firefox/downloads/file/4003969/addon-4003969-latest.xpi"
ARG BYPASS_LATEST="https://addons.mozilla.org/firefox/downloads/file/4003883/addon-4003883-latest.xpi"

RUN yum -y update \
    && yum clean all 

RUN yum -q -y install firefox wget \
    && yum -q clean all

RUN wget -O /usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/uBlock0@raymondhill.net.xpi ${UBLOCK_LATEST}

RUN wget -O /usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/{d133e097-46d9-4ecc-9903-fa6a722a6e0e}.xpi ${BYPASS_LATEST}

CMD [ "/usr/bin/firefox" ]
