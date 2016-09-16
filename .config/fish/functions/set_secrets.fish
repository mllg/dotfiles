function set_secrets
    set -xU OPENMLAPIKEY (pass show openml.api.key)
    set -xU GITHUB_TOKEN (pass show github.token)
    set -xU HOMEBREW_GITHUB_API_TOKEN (pass show github.token)
end
