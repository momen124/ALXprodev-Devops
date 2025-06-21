#!/bin/bash

# Define the URL and output files
URL="https://pokeapi.co/api/v2/pokemon/pikachu"
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Check if the output file already exists
if [ -f "$OUTPUT_FILE" ]; then
  echo "Output file $OUTPUT_FILE already exists. Please remove it or choose a different name." >> "$ERROR_FILE"
  exit 1
fi

# Make the API request and capture the HTTP response code
HTTP_RESPONSE=$(curl -s -o "$OUTPUT_FILE" -w "%{http_code}" "$URL")

# Check if the request failed
if [ "$HTTP_RESPONSE" -ne 200 ]; then
  echo "[$(date)] Failed to fetch data from $URL. HTTP response code: $HTTP_RESPONSE" >> "$ERROR_FILE"
  exit 1
fi

echo "Data fetched successfully and saved to $OUTPUT_FILE."
