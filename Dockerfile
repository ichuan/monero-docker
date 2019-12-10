FROM debian:9
WORKDIR /opt/coin
RUN apt update && apt install -y bzip2 netcat
ADD https://downloads.getmonero.org/cli/linux64 /opt/coin/monero.tbz2
RUN tar --strip-components 1 -xf monero.tbz2 && rm -f monero.tbz2
EXPOSE 18081 18088
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/entrypoint.sh"]
