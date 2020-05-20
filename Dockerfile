FROM flnpw/ca-certificates AS certs

FROM busybox
COPY --from=certs /etc/ssl /etc/ssl

ARG VERSION_TAG=0.9.3
ARG ARTIFACT=envconsul_${VERSION_TAG}_linux_amd64.tgz
ENV URL=https://releases.hashicorp.com/envconsul/$VERSION_TAG/$ARTIFACT
ENV BINARY=envconsul

ADD $URL /tmp/$ARTIFACT
RUN set -exuo pipefail; \
  mkdir -p /usr/local/bin \
  && tar -xzf /tmp/$ARTIFACT -C /usr/local/bin/ \
  && rm -rf /tmp/$ARTIFACT \
  && chmod 755 /usr/local/bin/$BINARY

ENTRYPOINT ["envconsul"]
CMD ["--help"]
