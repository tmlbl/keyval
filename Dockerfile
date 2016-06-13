FROM tmlbl/keyval-base

ADD . /opt/app
ENV KEYVAL_DIR /data
EXPOSE 7000
ENTRYPOINT julia /opt/app/app.jl
