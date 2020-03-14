ARG     BASE_IMG=$BASE_IMG
FROM    $BASE_IMG AS base

RUN     apk --update --no-cache upgrade



FROM    base as build

RUN	apk --update --no-cache add \
	curl

WORKDIR	/mnt

RUN	curl -Ls https://github.com/aerys/gpm-packages/raw/master/gpm-linux64/gpm-linux64.tar.gz | tar xvz	



FROM	scratch

COPY	files/ /

COPY	--from=build /mnt/gpm /bin/gpm
