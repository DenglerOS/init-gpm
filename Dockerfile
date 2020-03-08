ARG     BASE_IMAGE=$BASE_IMAGE
FROM    $BASE_IMAGE AS gpm

RUN	apk --update --no-cache add \
	curl

WORKDIR	/mnt

RUN	curl -Ls https://github.com/aerys/gpm-packages/raw/master/gpm-linux64/gpm-linux64.tar.gz | tar xvz	



FROM	scratch

COPY	files/ /

COPY	--from=gpm /mnt/gpm /bin/gpm
