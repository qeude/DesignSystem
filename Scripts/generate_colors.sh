#!/bin/bash
set -e

SCRIPT_PATH=$(dirname -- "$(readlink -f -- "$0")")
PALETTE_FILE=${1:-"$SCRIPT_PATH/palette.json"}
COLORS_FILE=${2:-"$SCRIPT_PATH/colors.json"}
INDEX_PATH="$SCRIPT_PATH/../Sources/DesignSystem/Colors/"
DESTINATION_PATH="$SCRIPT_PATH/../Sources/DesignSystem/Resources/Colors.xcassets"
PALETTE_PATH="$DESTINATION_PATH/Palette"
SEMANTIC_PATH="$DESTINATION_PATH/"

rm -rf $DESTINATION_PATH/*
rm -rf $INDEX_PATH/Colors+*.swift
./generate_palette.sh $PALETTE_FILE $PALETTE_PATH
./generate_semantic.sh $COLORS_FILE $SEMANTIC_PATH $PALETTE_FILE $INDEX_PATH
echo "✨ Colors successfully generated ✨"
