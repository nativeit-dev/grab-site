<<<<<<< HEAD
FROM python:3-slim-trixie
=======
FROM python:3.8-slim
>>>>>>> 42538c61303c698963969930d6bb90b2b1e0e100

RUN apt-get update
RUN apt-get update && \
	apt-get install --no-install-recommends -y \
<<<<<<< HEAD
		git build-essential \
		libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
		libsqlite3-dev libffi-dev libxml2-dev libxslt1-dev \
		libre2-dev pkg-config
RUN pip3 install --no-binary lxml --upgrade git+https://github.com/nativeit-dev/grab-site
RUN apt-get purge -y \
	git build-essential pkg-config && \
	apt-get autoremove -y && apt-get clean && \
=======
      git wget ca-certificates git build-essential libssl-dev zlib1g-dev \
      libbz2-dev libreadline-dev libsqlite3-dev libffi-dev libxml2-dev \
      libxslt1-dev libre2-dev pkg-config && \
    pip3 install --no-binary lxml --upgrade git+https://github.com/ArchiveTeam/grab-site && \
    apt-get purge -y \
			git build-essential pkg-config && \ 
    apt-get autoremove -y && apt-get clean && \
>>>>>>> 42538c61303c698963969930d6bb90b2b1e0e100
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

VOLUME /data
WORKDIR /data
EXPOSE 29000
CMD ["python", "/usr/local/bin/gs-server"]
