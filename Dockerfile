FROM openkbs/ubuntu-bionic-jdk-mvn-py3

ARG INTELLIJ_VERSION="ideaIC-2019.1.1"

ARG INTELLIJ_IDE_TAR=${INTELLIJ_VERSION}.tar.gz

ENV IDEA_PROJECT_DIR="/var/project"

WORKDIR /opt

COPY jdk.table.xml /etc/idea/config/options/

RUN wget https://download-cf.jetbrains.com/idea/${INTELLIJ_IDE_TAR} && \
    tar xzf ${INTELLIJ_IDE_TAR} && \
    tar tzf ${INTELLIJ_IDE_TAR} | head -1 | sed -e 's/\/.*//' | xargs -I{} ln -s {} idea && \
    rm ${INTELLIJ_IDE_TAR} && \
    echo idea.config.path=/etc/idea/config >> idea/bin/idea.properties && \
    chmod -R 777 /etc/idea

CMD idea/bin/inspect.sh ${IDEA_PROJECT_DIR} ${IDEA_PROJECT_DIR}/.idea/inspectionProfiles/Project_Default.xml ${IDEA_PROJECT_DIR}/target/idea_inspections
