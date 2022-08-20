FROM docker:stable
LABEL maintainer="Move Your Digital <engineering@moveyourdigital.com>"
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
