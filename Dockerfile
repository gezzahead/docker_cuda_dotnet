

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

Disclaimer

This e-mail message and any attachments (“message”) may contain confidential, privileged or proprietary information and is intended solely for the use of the named recipient(s). If you are not the intended recipient, you may not disclose, copy, distribute or retain any part of this message. If you have received this message in error, please inform the sender immediately by return e-mail and delete this message from your system. The BIS is not liable for any error in the content of this message and does not represent that it is uncorrupted and/or free of viruses. Views expressed in this message are those of the author and may not reflect those of the BIS.

 
