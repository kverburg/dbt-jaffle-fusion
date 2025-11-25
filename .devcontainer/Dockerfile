# Use the official Python image as the base image
FROM python:3.14-slim

# Install system dependencies (i.e. git, curl, xdg-utils)
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y --fix-missing \
    curl \
    xdg-utils \
    jq \
    git \
    && rm -rf /var/lib/apt/lists/*

# Initialize a git connection
RUN git init

# Install dbt Fusion
RUN curl -fsSL https://public.cdn.getdbt.com/fs/install/install.sh | /bin/bash -s -- --update
