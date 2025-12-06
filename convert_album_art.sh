#!/bin/bash

# Configuration
HA_URL="http://10.10.10.9:8123"
OUTPUT_DIR="./www"
OUTPUT_FILE="$OUTPUT_DIR/media_album.bmp"
DEFAULT_IMAGE="$OUTPUT_DIR/blank_album.bmp"
TEMP_FILE="/tmp/album_art_temp.jpg"

# Get the media proxy path from argument
MEDIA_PATH="$1"

if [ -z "$MEDIA_PATH" ]; then
    echo "Error: No media path provided"
    exit 1
fi

# Download the album art
curl -s "${HA_URL}${MEDIA_PATH}" -o "$TEMP_FILE"

# Check if download was successful and file has content
if [ -s "$TEMP_FILE" ]; then
    # Convert to 24-bit BMP - ESPHome will convert to RGB565
    convert "$TEMP_FILE" \
        -resize 200x200! \
        -type TrueColor \
        -define bmp:format=bmp3 \
        -depth 8 \
        BMP3:"$OUTPUT_FILE"
    
    if [ $? -eq 0 ]; then
        echo "Success: Album art converted to 24-bit BMP for ESPHome"
        rm "$TEMP_FILE"
        exit 0
    else
        echo "Error: ImageMagick conversion failed"
        rm "$TEMP_FILE"
    fi
fi

# If we get here, either download or conversion failed
# Copy the default blank image
echo "Error: Failed to download or convert. Using default blank album art."
if [ -f "$DEFAULT_IMAGE" ]; then
    cp "$DEFAULT_IMAGE" "$OUTPUT_FILE"
    echo "Default image copied successfully"
    exit 0
else                        
    echo "Error: Default image not found at $DEFAULT_IMAGE"
    exit 1
fi