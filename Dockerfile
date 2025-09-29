# 使用 Alpine Linux 基础镜像
FROM alpine:latest

# 安装构建必要的依赖和工具
RUN apk update && \
    apk add --no-cache \
    gcc \
    g++ \
    autoconf \
    automake \
    build-base \
    libtool \
    zlib-dev \
    openssl-dev \
    mbedtls-dev \
    libsodium-dev \
    c-ares-dev \
    asciidoc \
    xmlto \
    pcre-dev \
    libev-dev \
    git \
    linux-headers \
    musl-dev

# 克隆和构建 shadowsocks-libev
RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git /opt/shadowsocks-libev && \
    cd /opt/shadowsocks-libev && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# 克隆 simple-obfs 插件
RUN git clone https://github.com/shadowsocks/simple-obfs.git /opt/simple-obfs && \
    cd /opt/simple-obfs && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# 清理不必要的文件
RUN rm -rf /opt/shadowsocks-libev /opt/simple-obfs

# 设置容器的入口点
ENTRYPOINT ["ss-server"]

# 在配置好 Dockerfile 的目录中，您可以用以下命令构建和运行 Docker 镜像：
# docker build -t my-shadowsocks-obfs .
