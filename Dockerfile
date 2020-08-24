FROM oraclelinux:7-slim

ENV DNSPERF dnsperf-2.3.4

RUN yum-config-manager --enable ol7_optional_latest && \
    yum-config-manager --enable ol7_developer_EPEL && \
    yum update -y  && \
    yum install -y wget tar gzip gcc-c++ make bind-devel openssl-devel \
      libxml2-devel libcap-devel json-c-devel krb5-devel protobuf-c-devel \
      GeoIP-devel fstrm-devel && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN wget https://www.dns-oarc.net/files/dnsperf/$DNSPERF.tar.gz \
    && tar zxvf $DNSPERF.tar.gz \
    && cd $DNSPERF \
    && sh configure \
    && make \
    && strip ./src/dnsperf ./src/resperf \
    && make install \
    && rm -rf /$DNSPERF*

CMD ["sh"]
