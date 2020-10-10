FROM alpine:3.12.0

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache jq

# install aliyun cli
RUN wget https://aliyuncli.alicdn.com/aliyun-cli-linux-3.0.59-amd64.tgz \
    && tar -xvzf aliyun-cli-linux-3.0.59-amd64.tgz \
    && rm aliyun-cli-linux-3.0.59-amd64.tgz \
    && mv aliyun /usr/local/bin/

ENV ACCESS_KEY_ID=dummy_access_key_id
ENV ACCESS_KEY_SECRET=dummy_access_key_secret

# config aliyun cli
RUN aliyun configure set \
      --profile akProfile \
      --mode AK \
      --region cn-hangzhou \
      --access-key-id ${ACCESS_KEY_ID} \
      --access-key-secret ${ACCESS_KEY_SECRET}
