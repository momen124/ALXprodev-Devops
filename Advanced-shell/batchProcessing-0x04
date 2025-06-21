#!/bin/bash

pokemon_list=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")

mkdir -p pokemon_data

fetch_pokemon() {
    local pokemon=$1
    echo "Fetching data for $pokemon..."
    response=$(curl -s -w "%{http_code}" -o "pokemon_data/$pokemon.json.tmp" "https://pokeapi.co/api/v2/pokemon/$pokemon")
    
    if [ "$response" = "200" ]; then
        mv "pokemon_data/$pokemon.json.tmp" "pokemon_data/$pokemon.json"
        echo "Saved data to pokemon_data/$pokemon.json"
    else
        echo "Failed to fetch $pokemon (HTTP $response)"
        rm -f "pokemon_data/$pokemon.json.tmp"
    fi
}

for pokemon in "${pokemon_list[@]}"; do
    fetch_pokemon "$pokemon" &
done

echo "Running jobs:"
jobs

for job in $(jobs -p); do
    if kill -0 "$job" 2>/dev/null; then
        wait "$job"
    fi
done

echo "All Pokémon data fetched."
