FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY proxy-a.conf proxy-b.conf /etc/nginx/conf.d/
CMD mv /etc/nginx/conf.d/proxy-b.conf /etc/nginx/conf.d/proxy-b
