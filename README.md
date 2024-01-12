# PandoraNext-auto-token

The purpose of this project is to automatically update the Session token for PandoraNext using GitHub Actions. It also automatically encrypts it into a GPG file and releases it.

## Steps

1. Fork the repo
2. Add `API_ENDPOINT`, `POOL_TOKEN`, `SESSION_TOKEN`, `GH_CUSTOM_TOKEN`, `GPG_PASSWORD` to GitHub repo secret
    - `API_ENDPOINT`: e.g., https://abcdefg.com:<port>/<proxy_api_prefix>
    - `POOL_TOKEN`: e.g., pk-abcdefghijklm1234567890abcdefghij1234567890
    - `SESSION_TOKEN`: One token per line.
        ```
        eyJhbGciOiJkaXIxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1
        eyJhbGciOiJkaXIxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2
        eyJhbGciOiJkaXIxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx3
        ```
    - `GH_CUSTOM_TOKEN`: This key is used for automatically updating the session token in the 'secret'. Please go to https://github.com/settings/tokens/new, select `repo` and `workflow` scopes.
    - `GPG_PASSWORD`: GPG password for encryption and decryption. Choose any value you want, but make sure it matches the value of GPG_PASSWORD in the local .env file.
3. Manually trigger the workflow in GitHub.

## Perhaps could be useful.

1. Clone the repo
2. Create `.env` from `.env.example`, Please ensure that the value of `GPG_PASSWORD` is consistent with the one set earlier.
3. Run `gpg-decrypt.sh`, wait for a moment, and you will have the decrypted `tokens.txt` and `session_tokens.txt` locally.