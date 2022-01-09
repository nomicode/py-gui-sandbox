#!/bin/sh -ex

tmpdir=$(mktemp -d)

cd "${tmpdir}"

# Alpine
# -----------------------------------------------------------------------------

apk update
apk upgrade

apk add --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    py3-wheel \
    shfmt \
    bash-completion

ensure_bash_completion() {
    filename="${1}"
    cat >>"${filename}" <<EOF

. /usr/share/bash-completion/bash_completion
EOF
}

ensure_bash_completion /root/.bashrc
ensure_bash_completion /home/vscode/.bashrc

# Python
# -----------------------------------------------------------------------------

pip3 install --no-cache-dir --upgrade pip

# Cleanup
# -----------------------------------------------------------------------------

cd /tmp
rm -rf "${tmpdir}"
