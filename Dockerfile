FROM node:18-slim

# Install FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install n8n
RUN npm install -g n8n

# Create a user to run n8n
RUN useradd -m -s /bin/bash n8n

# Set working directory
WORKDIR /home/n8n

# Switch to the created user
USER n8n

# Expose n8n default port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
