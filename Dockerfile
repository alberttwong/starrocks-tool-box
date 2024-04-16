FROM registry.access.redhat.com/ubi9

RUN dnf -y update && \
    dnf -y install https://repo.mysql.com/mysql80-community-release-el9-5.noarch.rpm

ENV INSTALL_PKGS="git vim unzip python iputils mysql-community-server wget nc"

RUN dnf -y install $INSTALL_PKGS && \
    dnf clean all

RUN mkdir /tools && \
    wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable-4.9/openshift-client-linux.tar.gz -P /tools && \
    wget https://get.helm.sh/helm-v3.12.1-linux-386.tar.gz -P /tools && \
    cd /tools && \
    chmod 777 * && \
    tar xvf openshift-client-linux.tar.gz oc kubectl && \
    tar xvf helm-v3.12.1-linux-386.tar.gz  linux-386/helm && \
    cp oc kubectl linux-386/helm /usr/local/bin

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/local/bin/mc

USER 1001

ENTRYPOINT ["/usr/local/bin/run"]
CMD ["sleep", "infinity"]
