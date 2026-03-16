FROM alpine:3.23

# renovate: datasource=git-tags sourceUrl=https://github.com/jimsalterjrs/sanoid versioning=semver
ENV VERSION=v2.3.0

RUN apk add --no-cache \
  zfs \
  perl \
  perl-capture-tiny \
  # needed since busybox ps misses some assumed parameters
  procps \
  # sanoid dependencies
  perl-config-inifiles \
  # syncoid dependencies
  openssh-client-default \
  pv \
  gzip \
  lzop \
  mbuffer

RUN wget -qO /usr/local/bin/syncoid "https://raw.githubusercontent.com/jimsalterjrs/sanoid/refs/tags/v2.3.0/syncoid" && \
  chmod +x /usr/local/bin/syncoid && \
  wget -qO /usr/local/bin/sanoid "https://raw.githubusercontent.com/jimsalterjrs/sanoid/refs/tags/v2.3.0/sanoid" && \
  chmod +x /usr/local/bin/sanoid && \
  mkdir -p /etc/sanoid/ && \
  wget -qO /etc/sanoid/sanoid.defaults.conf "https://raw.githubusercontent.com/jimsalterjrs/sanoid/refs/tags/v2.3.0/sanoid.defaults.conf"
