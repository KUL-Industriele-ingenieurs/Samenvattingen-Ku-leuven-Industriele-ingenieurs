FROM texlive/texlive:latest

# Install dependencies:
# - perl: Required by latexmk (standard Linux Perl, equivalent to Strawberry Perl on Windows)
# - git: For version control
# - chktex: For LaTeX linting
# - python3 & python-is-python3: Required for scripts/create_issues.py
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    perl \
    git \
    chktex \
    python3 \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/*
