FROM debian:9
WORKDIR /opt/coin
ADD https://downloads.getmonero.org/cli/linux64 /opt/coin/monero.tbz2
RUN tar --strip-components 1 -xf monero.tbz2 && rm -f monero.tbz2
ADD https://github.com/ichuan/packages/raw/master/_binary/nc /bin/nc
RUN chmod +x /bin/nc
EXPOSE 18081 18088
COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
