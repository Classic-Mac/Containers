# Containers
Docker containers for use with Classic Macintosh to allow filesharing HTTPS and TLS/SSL

# Build the image

`docker build -t mhardingdk/mac:stunnel .`

# Using the image
The image contains a default stunnel.conf file, but you can use your own by adding the `-v` parameter as in the example.

`docker run -d --rm --name stunnel -v ./stunnel.conf:/etc/stunnel/stunnel.conf -v ./log:/etc/stunnel/log -p 6025:6025 -p 6143:6143 mhardingdk/mac:stunnel .`
