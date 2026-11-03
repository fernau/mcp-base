# syntax=docker/dockerfile:1
FROM ubuntu:26.04

RUN echo 'Acquire::Retries "5";' > /etc/apt/apt.conf.d/80-retries && \
    echo 'Acquire::http::Pipeline-Depth "0";' >> /etc/apt/apt.conf.d/80-retries && \
    echo 'Acquire::http::No-Cache "true";' >> /etc/apt/apt.conf.d/80-retries && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    tzdata \
    adduser \
    && rm -rf /var/lib/apt/lists/*

RUN rm -f /usr/bin/pebble

RUN adduser --system --group --home /home/mcp --uid 500 mcp
