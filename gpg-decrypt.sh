#!/bin/sh

# read GPG_PASSWORD from .env file
if [ -f .env ]; then
    . .env
else
    echo "Error: .env does not exist."
    exit 1
fi

# check GPG_PASSWORD variable
if [ -z "$GPG_PASSWORD" ]; then
    echo "Error: GPG_PASSWORD variable is not set."
    exit 1
fi

# download *.gpg files
curl -LO https://github.com/hu3rror/PandoraNext-auto-token/releases/download/latest/tokens.txt.gpg
curl -LO https://github.com/hu3rror/PandoraNext-auto-token/releases/download/latest/session_tokens.txt.gpg

# decrypt *.gpg files
gpg --batch --yes --passphrase "$GPG_PASSWORD" -d tokens.txt.gpg > tokens.txt
gpg --batch --yes --passphrase "$GPG_PASSWORD" -d session_tokens.txt.gpg > session_tokens.txt

# rm *.gpg files
rm tokens.txt.gpg session_tokens.txt.gpg

# print success
echo "Done!"
