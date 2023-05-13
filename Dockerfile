FROM debian:bookworm-slim

ARG VER_TEXLIVE_FULL=2022.20230122-3

ARG PATH_TEX_PACKAGES=/usr/share/texlive/texmf-dist/tex/latex

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install --no-install-recommends --assume-yes \
       biber latexmk texlive-full=${VER_TEXLIVE_FULL} \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir ${PATH_TEX_PACKAGES}/aizancommons

ADD package_custom/aizancommons/aizancommons.sty ${PATH_TEX_PACKAGES}/aizancommons/aizancommons.sty

# run kpsewhich <package_name.sty> to verify the installation
RUN texhash && luaotfload-tool --update --force

WORKDIR /tmp

