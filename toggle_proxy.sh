#!/bin/sh
if [ -z "${http_proxy}" ]
then
        set_proxy="true"
        echo "http_proxy was not set. Setting..."
        export http_proxy="http://myproxy:8080/"
else
        set_proxy="false"
        echo "http_proxy was set. Unsetting..."
        export http_proxy=""
fi

if [ -z "${https_proxy}" ]
then
        echo "https_proxy was not set. Setting..."
        export https_proxy="http://myproxy:8080/"
else
        echo "https_proxy was set. Unsetting..."
        export https_proxy=""
fi

if [ "$set_proxy" = "true" ]
then
        echo 'Acquire::http::Proxy "http://myproxy:8080";' > /etc/apt/apt.conf
        echo 'Acquire::https::Proxy "http://myproxy:8080";' >> /etc/apt/apt.conf
        echo "Setting proxy for apt..."
else
        echo '' > /etc/apt/apt.conf
        echo "Unsetting proxy for apt..."
fi
