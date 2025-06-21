#!/bin/bash

# Ensure data.json exists
if [ ! -f "data.json" ]; then
  echo "Error: data.json not found."
  exit 1
fi

name=$(jq -r '.name' data.json | sed 's/.*/\u&/')
formatted_height=$(awk "BEGIN {printf \"%.1f\", $(jq '.height' data.json) / 10}")
formatted_weight=$(awk "BEGIN {printf \"%.0f\", $(jq '.weight' data.json) / 10}")
type=$(jq -r '.types[0].type.name' data.json | sed 's/.*/\u&/')

echo "$name is of type $type, weighs ${formatted_weight}kg, and is ${formatted_height}m tall."
