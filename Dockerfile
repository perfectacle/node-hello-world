FROM amazonlinux

RUN curl -sL https://rpm.nodesource.com/setup_11.x | bash -
RUN yum install -y nodejs

CMD node app

EXPOSE 3000
