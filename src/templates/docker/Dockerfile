FROM nimlang/nim:onbuild
RUN rm /etc/nginx/conf.d/*
COPY src/nginx/proxy.conf /etc/nginx/conf.d/
ENTRYPOINT ["./bin/app"]

