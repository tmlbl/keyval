FROM julia:0.4.3

RUN apt-get update
RUN apt-get install -y wget build-essential libsnappy-dev

ADD . /opt/app
WORKDIR /opt/app
RUN tar xf julia_pkgs.tar.gz; rm julia_pkgs.tar.gz
ENV JULIA_PKGDIR /opt/app/.jdeps.pkg
RUN julia -e "Pkg.build()"

ENV KEYVAL_DIR /data
EXPOSE 7000
ENTRYPOINT julia /opt/app/app.jl
