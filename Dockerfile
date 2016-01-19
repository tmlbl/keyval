FROM julia:0.4.3

RUN apt-get update
RUN apt-get install -y wget build-essential libsnappy-dev

ADD . /opt/src
WORKDIR /opt/src
RUN tar xvf julia_pkgs.tar.gz
ENV JULIA_PKGDIR /opt/src/.jdeps.pkg
RUN julia -e "Pkg.build()"
ENTRYPOINT julia /opt/src/script.jl

