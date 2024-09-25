FROM alpine:latest

ENV USER_PWD=moriire\
    APPS_FOLDER=apps

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN apk add --no-cache py3-pip
RUN pip install --upgrade py4web --break-system-packages
RUN py4web setup $APPS_FOLDER --yes
# $APPS_FOLDER
RUN py4web set_password --password $USER_PWD
RUN apk add bash
#SHELL ["/bin/sh", "-c"]
#ENTRYPOINT ["py4web"]
CMD ["py4web",  "run", ${APPS_FOLDER}]