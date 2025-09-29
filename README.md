# docker_Shadowsocks-libev_obfs
Easy to create Shadowsocks libev with the obfs plugin using Docker

# Install Docker and set up boot up
`wget -qO- get.docker.com | bash `

`docker version ` 

`systemctl start docker `

`systemctl status docker`

`systemctl enable docker `

# Use Docker shadowsocks-obfs
`docker pull jadecat341/jade-shadowsocks-obfs`

`docker run -d --name ss-libev -p 8443:8443 jadecat341/jade-shadowsocks-obfs -s 0.0.0.0 -p 8443 -m chacha20-ietf-poly1305 -k password --plugin obfs-server --plugin-opts "obfs=tls"`

`docker stop ss-libev`

`docker rm ss-libev`

`docker start  ss-libev`
