FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2-utils

COPY generate-votes.sh /generate-votes.sh
COPY posta /posta
COPY postb /postb

RUN chmod +x /generate-votes.sh

# Debugging steps
RUN ls -l /
RUN ls -l /generate-votes.sh
RUN ls -l /posta
RUN ls -l /postb

CMD ["/generate-votes.sh"]
