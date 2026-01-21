FROM texlive/texlive:latest

# Install dependencies:
# - perl: Required by latexmk (standard Linux Perl)
# - git: For version control
# - chktex: For LaTeX linting
# - curl, wget, ca-certificates: Required for Dev Container features (common-utils) to download tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    perl \
    git \
    chktex \
    curl \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*