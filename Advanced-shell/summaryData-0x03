#!/bin/bash

output_file="pokemon_report.csv"

echo "Name,Height (m),Weight (kg)" > "$output_file"

for file in pokemon_data/*.json; do
    name=$(jq -r '.name' "$file" | sed 's/.*/\u&/')
    height=$(jq -r '.height' "$file")
    weight=$(jq -r '.weight' "$file")

    height_m=$(awk "BEGIN {printf \"%.2f\", $height / 10}")
    weight_kg=$(awk "BEGIN {printf \"%.2f\", $weight / 10}")

    echo "$name,$height_m,$weight_kg" >> "$output_file"
done

echo "CSV Report generated at: $output_file"
echo ""

cat "$output_file"
echo ""

awk -F',' 'NR>1 {
    total_height += $2;
    total_weight += $3;
    count += 1;
}
END {
    printf "\nAverage Height: %.2f m\n", total_height / count;
    printf "Average Weight: %.2f kg\n", total_weight / count;
}' "$output_file"

