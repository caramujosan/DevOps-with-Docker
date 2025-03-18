FROM ubuntu:24.04

WORKDIR /mydir

RUN apt-get update && apt-get install -y curl python3 && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+x /usr/local/bin/yt-dlp && \
    useradd -m appuser && \
    chown appuser . && \
    apt-get purge -y --auto-remove curl && \
    rm -rf var/lib/apt/lists/*

USER appuser

ENTRYPOINT ["/usr/local/bin/yt-dlp"]
