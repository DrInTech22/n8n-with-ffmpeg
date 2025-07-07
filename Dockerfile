FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install FFmpeg and clean up in the same layer
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the n8n user
USER node

# The official n8n image already has the correct WORKDIR, USER, EXPOSE, and CMD
