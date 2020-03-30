FROM circleci/node:10.19.0-browsers

USER root
###
# AWS CLI
RUN curl -O https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && pip3 install awscli --upgrade

###
# Install Kubectl
COPY --from=lachlanevenson/k8s-kubectl:v1.10.3 /usr/local/bin/kubectl /usr/local/bin/kubectl

###
# Fix up npm global installation
# See https://docs.npmjs.com/getting-started/fixing-npm-permissions
RUN mkdir ~/.npm-global \
    && npm config set prefix '~/.npm-global' \
    && echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile \
    && npm i -g yarn

###
# This version of ChromeDriver works with the Chrome version included
# in the circleci/*-browsers base image above.
# This variable is intended to be used by passing it as an argument to
# "postinstall": "webdriver-manager update ..."
ENV CHROMEDRIVER_VERSION_ARG "--versions.chrome 2.33"

WORKDIR /home/circleci
