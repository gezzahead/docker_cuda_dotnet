

FROM nvidia/cuda:9.1-devel-ubuntu16.04

 

RUN apt-get update \

    && apt-get install -y --no-install-recommends \

        ca-certificates \

        \

# .NET Core dependencies

        libc6 \

        libcurl3 \

        libgcc1 \

        libgssapi-krb5-2 \

        libicu-dev \

        liblttng-ust0 \

        libssl1.0.0 \

        libstdc++6 \

        libunwind8 \

        libuuid1 \

        zlib1g \

        curl \

&& rm -rf /var/lib/apt/lists/*

 

# Install .NET Core

RUN curl -SL https://dotnetcli.blob.core.windows.net/dotnet/Sdk/2.1.4/dotnet-sdk-2.1.4-linux-x64.tar.gz --output dotnet.tar.gz \

        && mkdir -p /usr/share/dotnet \

        && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \

        && rm dotnet.tar.gz \

        && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

 

#Trigger population of local package cache

RUN mkdir warmup \

    && cd warmup \

    && dotnet new console \

    && cd .. \

    && rm -rf warmup