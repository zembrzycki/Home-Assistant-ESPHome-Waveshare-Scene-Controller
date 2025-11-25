#!/bin/bash
curl -s "http://10.10.10.10:8123$1" -o /tmp/album_art_temp.jpg
DEST="./www/esp_album_art.bmp"

if [ -s /tmp/album_art_temp.jpg ]; then
    # Convert to 24-bit BMP - ESPHome will convert to RGB565
    convert /tmp/album_art_temp.jpg \
        -resize 160x160! \
        -type TrueColor \
        -define bmp:format=bmp3 \
        -depth 8 \
        BMP3:$DEST
    
    if [ $? -eq 0 ]; then
        echo "Success: Album art converted to 24-bit BMP for ESPHome"
        rm /tmp/album_art_temp.jpg
        exit 0
    else
        echo "Error: ImageMagick conversion failed"
        rm /tmp/album_art_temp.jpg
        exit 1
    fi
else
    echo "Error: Failed to download"
    exit 1
fi
