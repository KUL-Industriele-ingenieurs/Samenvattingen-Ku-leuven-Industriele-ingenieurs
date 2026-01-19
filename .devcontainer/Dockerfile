FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install TeX Live Full and other dependencies
# texlive-full: Contains all packages (equivalent to MiKTeX full install)
# latexmk: Automates the build process
# chktex: Linter for LaTeX
# perl: Required by LaTeX Workshop
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    texlive-full \
    latexmk \
    chktex \
    perl \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*
