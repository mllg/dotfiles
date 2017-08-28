function set_secrets
    set -xU OPENMLAPIKEY (pass show openml.api.key)
    set -l gh (pass show github.token)
    set -xU GITHUB_TOKEN $gh
    set -xU GITHUB_PAT $gh
    set -xU HOMEBREW_GITHUB_API_TOKEN $gh
    echo "machine api.github.com login mllg password $gh" > ~/.netrc
    chmod 600 ~/.netrc
end
