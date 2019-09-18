FROM alpine:3.2


ENV BIND_VERSION 9.10.3

# install default packages
# and build dig and nsupdate
RUN packages=' \
    bash \
    drill \
    bind-tools \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*



SHELL ["bash", "-c"]

COPY job.sh .
COPY domain .

ENTRYPOINT ["/bin/bash", "-c", "./job.sh domain"]
