#!/bin/bash
set -e

PALETTE_FILE=$1
PALETTE_PATH=$2

function uppercase() {
   local value=$1
    echo "$(tr '[:lower:]' '[:upper:]' <<<${value:0:1})${value:1}"
}

function createPaletteNamespace() {
    mkdir -p $PALETTE_PATH
    echo '{
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "provides-namespace" : true
  }
}' >"$PALETTE_PATH/Contents.json"
}

function createPaletteColorFamily() {
    local color_family=$1
    local color_family_path="$PALETTE_PATH/$color_family"
    mkdir -p $color_family_path
    echo '{
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "provides-namespace" : true
  }
}' >"$color_family_path/Contents.json"
}

function createPaletteColor() {
   local color=$1
   local color_code=$2
   local color_family=$3
   local color_path="$PALETTE_PATH/$color_family/$color.colorset"
   local color_path="$PALETTE_PATH/$color_family/$color.colorset"

    if [ "$color_family" == "null" ]; then
        color_path="$PALETTE_PATH/$color.colorset"
    fi
    local red=$(echo ${color_code:1:2})
    local green=$(echo ${color_code:3:2})
    local blue=$(echo ${color_code:5:2})
    mkdir -p $color_path
    echo '{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x'"$blue"'",
          "green" : "0x'"$green"'",
          "red" : "0x'"$red"'"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}' >"$color_path/Contents.json"
}

function generatePalette() {
    local color_families=$(jq -r 'keys_unsorted[]' $PALETTE_FILE)

    # Loop through each color
    for family in $color_families; do
        # Create a folder for the color
        value=$(jq -r ".$family" "$PALETTE_FILE")

        # Check if the value is an object or a string
        if jq -e 'objects' <<<"$value" >/dev/null 2>&1; then
            # Handle nested values (object)
            capitalized_family=$(uppercase $family)
            createPaletteColorFamily $capitalized_family
            nuancies=$(jq -r 'to_entries[] | [.key, .value] | @tsv' <<<"$value")
            while IFS=$'\t' read -r name nuancy_value; do
                createPaletteColor "$name" "$nuancy_value" "$capitalized_family"
            done <<<"$nuancies"
        else
            # Handle string value
            createPaletteColor "$family" "$value"
        fi
    done
}

echo "🎨 Generating palette…"
createPaletteNamespace
generatePalette
echo "🎉 Palette successfully generated"
