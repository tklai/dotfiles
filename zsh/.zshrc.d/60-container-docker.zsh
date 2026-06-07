#!/usr/bin/env zsh

if hash docker 2>/dev/null; then
    alias dcom="docker compose"

    # Attach container
    function dac() {
        local compose_file=$(find . -maxdepth 1 -name "docker-compose.yml" -o -name "docker-compose.yaml" -o -name "compose.yml" -o -name "compose.yaml" | head -n 1)
        if [ -n "$compose_file" ]; then
            docker compose exec "$1" "${@:2}"
        else
            docker exec -it "$1" "${@:2}"
        fi
    }
fi
