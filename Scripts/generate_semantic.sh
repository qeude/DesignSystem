#!/bin/bash
set -e

COLOR_FILE=$1
SEMANTIC_PATH=$2
PALETTE_FILE=$3
INDEX_PATH=$4

function uppercase() {
    local value=$1
    echo "$(tr '[:lower:]' '[:upper:]' <<<${value:0:1})${value:1}"
}

function createSemanticColorFamily() {
    local color_family=$1
    local color_family_path="$SEMANTIC_PATH/$color_family"
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

function createSemanticColor() {
    local color_family=$1
    local color=$2
    local light=$3
    local dark=$4
    local color_path="$SEMANTIC_PATH/$(uppercase $color_family)/$color.colorset"


    local red_light=$(echo ${light:1:2})
    local green_light=$(echo ${light:3:2})
    local blue_light=$(echo ${light:5:2})
    local red_dark=$(echo ${dark:1:2})
    local green_dark=$(echo ${dark:3:2})
    local blue_dark=$(echo ${dark:5:2})
    mkdir -p $color_path
    echo '{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x'"$blue_light"'",
          "green" : "0x'"$green_light"'",
          "red" : "0x'"$red_light"'"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "light"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x'"$blue_light"'",
          "green" : "0x'"$green_light"'",
          "red" : "0x'"$red_light"'"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x'"$blue_dark"'",
          "green" : "0x'"$green_dark"'",
          "red" : "0x'"$red_dark"'"
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

function generateSemanticColors() {
    local color_families=$(jq -r 'keys_unsorted[]' $COLOR_FILE)

    # Loop through each color
    for family in $color_families; do
        # Create a folder for the color
        echo "    🏗️ Generating $(uppercase $family) colors…"
        value=$(jq -r ".$family" "$COLOR_FILE")
        createSemanticColorFamily $(uppercase $family)
        children=$(jq -r 'keys_unsorted | .[]' <<< "$value")
        for child in $children; do
            local light_value=$(jq -r ".$child.light" <<< "$value")
            local dark_value=$(jq -r ".$child.dark" <<< "$value")
            light_hex=$(mapColorToHex $light_value)
            dark_hex=$(mapColorToHex $dark_value)
            createSemanticColor $family $child $light_hex $dark_hex
        done
        createIndexFilesForFamily $family
        echo "    ✅ $(uppercase $family) colors successfully generated"
    done
}

createIndexFilesForFamily() {
    local color_family=$1
    local uppercase_color_family=$(uppercase $color_family)
    local file_path="$INDEX_PATH/Colors+${uppercase_color_family}.swift"
    value=$(jq -r ".$color_family" "$COLOR_FILE")

    echo "// Colors+${uppercase_color_family}.swift
// This is a automatically generated workaround since Xcode 15 generated symbols are declared as internal.

import SwiftUI

extension Color {
  public enum ${uppercase_color_family} {
$(
    children=$(jq -r 'keys_unsorted | .[]' <<< "$value")
    for child in $children; do
        echo "    public static let $child = Color(.$uppercase_color_family.$child)"
    done
)
  }
}" > "$file_path"
}

mapColorToHex() {
    local color_name=$1
    local hex_value=$(cat "$PALETTE_FILE" | jq --arg color_name "$color_name" -r 'getpath([($color_name | split("."))[]])')
    if [ "$hex_value" == "null" ]; then
        echo "❌ Color not found: $color_name, you might want to fix this." > /dev/tty
    fi
    echo "$hex_value"
}

echo "🎨 Generating semantic colors…"
generateSemanticColors
echo "🎉 Semantic colors successfully generated"
