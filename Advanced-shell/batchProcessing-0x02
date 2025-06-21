#!/bin/bash

pokemon_list=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")

mkdir -p pokemon_data

for pokemon in "${pokemon_list[@]}"
do
    echo "Fetching data for $pokemon..."

    success=false
    attempts=0

    while [ $attempts -lt 3 ]; do
        # Make API request and store HTTP response code
        http_response=$(curl -s -w "%{http_code}" -o "pokemon_data/$pokemon.json.tmp" "https://pokeapi.co/api/v2/pokemon/$pokemon")
        
        if [[ "$http_response" == "200" ]]; then
            mv "pokemon_data/$pokemon.json.tmp" "pokemon_data/$pokemon.json"
            echo "Saved data to pokemon_data/$pokemon.json"
            success=true
            break
        else
            echo "Attempt $((attempts+1)) failed for $pokemon (HTTP $http_response)"
            sleep 1
            attempts=$((attempts+1))
        fi
    done

    # Log failure
    if [ "$success" = false ]; then
        echo "Failed to fetch data for $pokemon after 3 attempts. Skipping."
        rm -f "pokemon_data/$pokemon.json.tmp"
    fi
done
