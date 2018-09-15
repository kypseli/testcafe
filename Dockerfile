FROM testcafe/testcafe:alpha

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000

ENV HOME /home/${user}
USER root
RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add curl bash
RUN addgroup -g ${gid} ${group}
RUN adduser -h $HOME -u ${uid} -G ${group} -D ${user}
RUN mkdir /test
RUN chown jenkins /test
USER ${user}
