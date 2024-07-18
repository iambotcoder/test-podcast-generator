FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git 

# Create a virtual environment and install pyYAML within it
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install pyYAML

# Copy the necessary files
COPY feed.py /usr/bin/feed.py

# Set the path to include the virtual environment's bin directory
ENV PATH="/opt/venv/bin:$PATH"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
