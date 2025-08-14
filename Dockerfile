FROM node:22-alpine

# Install common CLI tools that your tool might need
RUN apk add \
    bash \
    curl \
    wget \
    grep \
    sed \
    jq \
    less \
    tree \
    file \
    tar \
    gzip \
    unzip \
    rsync \
    openssh-client \
    ca-certificates

RUN addgroup -g 1234 appusers
RUN adduser -D -u 1234 -G appusers appuser
USER appuser

RUN mkdir -p /home/appuser/node_modules
RUN npm config set prefix '/home/appuser/node_modules'
ENV PATH="/home/appuser/node_modules/bin:$PATH"
RUN npm install -g @anthropic-ai/claude-code

WORKDIR /workspace
