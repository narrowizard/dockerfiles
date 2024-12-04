FROM alpine:latest

RUN apk update && apk add --no-cache git openssh

RUN adduser -D git && \
    mkdir /home/git/.ssh && \
    chown -R git:git /home/git/.ssh

# Generate SSH host keys
RUN ssh-keygen -A

VOLUME /home/git

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]