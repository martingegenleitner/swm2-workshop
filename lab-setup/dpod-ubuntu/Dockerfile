FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

COPY service-client/dpod-service.zip /dpod/
COPY service-client/610-012987-006_SW_OPENSSL_TOOLKIT_GemEngine_v1.6_RevA.tar /dpod

WORKDIR /dpod

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y unzip libcap2 curl && \
    unzip dpod-service.zip && \
    tar -xf cvclient-min.tar && \
    source /dpod/setenv

# Set the Config-File and PATH environment var in order to enable
# binaries to find the correct settings
ENV ChrystokiConfigurationPath=/dpod
ENV PATH="/dpod/bin/64:${PATH}"

###
# OpenSSL-Setup
# Taken from https://thalesdocs.com/dpod/integrations/openssl/openssl_integration/index.html#scenario-a-integrating-pre-built-dynamic-engine-with-an-existing-installation-of-openssl-on-linux
###

# Unpack everything
RUN cd /dpod && \
    tar -xf /dpod/610-012987-006_SW_OPENSSL_TOOLKIT_GemEngine_v1.6_RevA.tar

# Unpack precompiled binaries/shared objects and place them to the correct library directory
RUN cp /dpod/gemengine-1.6/builds/linux/debian/64/3.0/gem.so /usr/lib/x86_64-linux-gnu/engines-3 && \
    cp /dpod/gemengine-1.6/builds/linux/debian/64/3.0/sautil /usr/local/bin

# Append GemEngine config to Chrystoki.conf
# !!! Be sure to set the correct token label !!!
COPY openssl-gem-engine.config /dpod
RUN cat /dpod/openssl-gem-engine.config >> /dpod/Chrystoki.conf

# Create /secrets directory and mount a secrets file with a default pin
RUN mkdir /secrets
COPY pin.secret /secrets

ENTRYPOINT [ "bash" ]