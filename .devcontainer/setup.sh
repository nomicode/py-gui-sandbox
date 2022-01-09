#!/bin/sh -ex

tmpdir=$(mktemp -d)

cd "${tmpdir}"

# Alpine
# -----------------------------------------------------------------------------

cat >/etc/apk/repositories <<EOF
https://dl-cdn.alpinelinux.org/alpine/edge/main
https://dl-cdn.alpinelinux.org/alpine/edge/testing
https://dl-cdn.alpinelinux.org/alpine/edge/community
EOF

apk update
apk upgrade

apk add --no-cache \
    bash-completion \
    util-linux \
    util-linux-doc \
    util-linux-bash-completion \
    git \
    git-doc \
    git-bash-completion \
    github-cli \
    github-cli-doc \
    github-cli-bash-completion \
    editorconfig-checker \
    yamllint \
    prettier \
    shfmt \
    shfmt-doc \
    python3 \
    python3-doc \
    python3-dev \
    py3-pip \
    py3-pip-doc \
    py3-pip-bash-completion \
    py3-wheel \
    py3-wheel-doc \
    black \
    poetry

# Python
# -----------------------------------------------------------------------------

pip3 install --no-cache-dir --upgrade pip

pip3 install --no-cache pipx

USE_EMOJI=false
export USE_EMOJI

PIPX_HOME=/usr/local/pix
export PIPX_HOME

PIPX_BIN_DIR=/usr/local/bin
export PIPX_BIN_DIR

PATH="${PIPX_BIN_DIR}:${PATH}"
export PATH

pipx install reorder-python-imports

# Dotfiles
# -----------------------------------------------------------------------------

configure_bashrc() {
    filename="${1}"
    cat >>"${filename}" <<EOF

. /usr/share/bash-completion/bash_completion

eval "\$(register-python-argcomplete pipx)"
EOF
}

configure_bashrc /root/.bashrc
configure_bashrc /home/vscode/.bashrc

# Cleanup
# -----------------------------------------------------------------------------

cd /tmp
rm -rf "${tmpdir}"
