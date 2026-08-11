# ESPHome Waveshare 4.3" Display with LVGL

A complete ESPHome configuration for Waveshare 4.3" 800x480 touchscreen display featuring home automation control, media player integration with album art, and climate control.

## ✨ Features

-  **Media Player** - Album art display with playback controls and preset buttons
-  **Smart Lighting** - Control 6 lights with visual status feedback
-  **Shade & Fan Control** - Manage 3 motorized shades and 3 ceiling fans
-  **Thermostat** - Interactive arc control with real-time temperature display
-  **Weather Display** - Current conditions with animated weather icons
-  **Automations** - Quick access to scenes, scripts, and routines
-  **LVGL UI** - Smooth, modern interface with gesture navigation
-  **Sleep Mode** - Auto-dimming with configurable timeout

## 📋 Hardware Requirements

- **Display**: Waveshare 4.3" 800x480 RGB LCD with GT911 touch controller
- **Board**: ESP32-S3-DevKitC-1 with PSRAM (octal, 80MHz)
- **Expander**: CH422G I/O expander for display control pins
- **Power**: 5V power supply (2A+ recommended)

## 🔌 Pin Configuration

### Display Pins (via CH422G)
- Reset: CH422G Pin 3
- Backlight Enable: CH422G Pin 2
- Touch Reset: CH422G Pin 1

### I2C Bus
- SDA: GPIO08
- SCL: GPIO09

### Touch Controller
- Interrupt: GPIO4

### RGB Interface
- DE: GPIO5
- HSYNC: GPIO46
- VSYNC: GPIO3
- PCLK: GPIO7 (16MHz)
- Red: [1, 2, 42, 41, 40]
- Green: [39, 0, 45, 48, 47, 21]
- Blue: [14, 38, 18, 17, 10]

## 📁 Required Files

Place these files in your ESPHome config directory:
```
esphome/
├── waveshare1.yaml           # Main configuration file
├── custom/
│   ├── logo.bmp              # Boot logo (200x200 RGB565)
│   ├── blank_album.bmp       # Default album art (200x200 RGB565)
│   └── MaterialDesignIconsDesktop.ttf  # Icon font
└── secrets.yaml              # WiFi and API credentials
```

### Creating Required Images

**Boot Logo & Blank Album Art:**
```bash
# Create blank black image (200x200 for album art)
convert -size 200x200 xc:black -type TrueColor -depth 8 BMP3:blank_album.bmp

# Or create with custom color
convert -size 200x200 xc:'#CC9900' -type TrueColor -depth 8 BMP3:logo.bmp
```

**Material Design Icons Font:**
Download from [Material Design Icons](https://github.com/Templarian/MaterialDesign-Font)

## ⚙️ Configuration

### Substitutions

Update the `substitutions` section at the top of the YAML file:
```yaml
substitutions:
  # Home Assistant URL
  ha_base_url: "http://YOUR_HA_IP:8123"
  
  # Media Player
  media_player_entity: "media_player.kitchen"
  
  # Lights
  light_entity_01: "light.your_light_1"
  light_name_01: "Kitchen"
  # ... repeat for all 6 lights
  
  # Covers / Shades
  cover_entity_01: "cover.your_shade_1"
  cover_name_01: "Bedroom"
  # ... repeat for all 3 covers
  
  # Ceiling Fans
  fan_entity_01: "fan.your_fan_1"
  fan_name_01: "Bedroom"
  # ... repeat for all 3 fans
  
  # Climate
  climate_entity_01: "climate.your_thermostat"
  
  # Scripts & Automations
  sonos_script_01: "script.your_preset_1"
  automation_script_01: "script.your_automation"
```

### Secrets File

Create `secrets.yaml`:
```yaml
wifi_ssid: "YourWiFiSSID"
wifi_password: "YourWiFiPassword"
ota_pass: "YourOTAPassword"
```

## 🎨 Album Art Integration

This configuration works with the [Media Album Art Converter](https://github.com/zembrzycki/HACS-integration-convert-media-album-art) Home Assistant integration.

### How It Works

1. Home Assistant integration converts album art to 24-bit BMP
2. Saves to `/config/www/esp_album_art.bmp`
3. ESPHome monitors `entity_picture` attribute changes
4. Automatically downloads and displays updated album art


## 📱 Pages & Navigation

![home](https://github.com/user-attachments/assets/e88471c2-1991-468f-a6f0-f020cf237ace)

![media](https://github.com/user-attachments/assets/a5dc8717-6de2-4564-bcfb-3d6b888377e1)

![thermostat](https://github.com/user-attachments/assets/5707d1c1-b12e-4635-8a9f-31a2e8a99e79)

![lights](https://github.com/user-attachments/assets/2f2d7c39-de1f-4a71-969a-1e63becba24e)

![blinds](https://github.com/user-attachments/assets/54d62d2d-c5d1-4cb1-be4b-cbe78c3d8372)

![rear2](https://github.com/user-attachments/assets/fdd568e8-902d-4cbe-807a-04c5c2fce5b7)



### Page 1: Main Dashboard
- Current time display
- Weather conditions (temperature, humidity, wind, pressure)
- Swipe left/right to navigate
- Auto-hide "HA disconnected" indicator

### Page 2: Lights
- 6 light controls with on/off toggle
- Visual feedback (yellow = on, white = off)
- Icon changes based on state

### Page 3: Shades & Fans
- 3 motorized shade controls (short press = open/close, long press = stop)
- 3 ceiling fan controls with on/off toggle

### Page 4: Thermostat
- Interactive arc control for temperature setpoint
- Current temperature display
- HVAC action status (heating, cooling, idle)
- Mode indicator (heat, cool, off)
- HVAC fan manual control button
- Utility displays (amps, chiller temp, dehumidifier status)

### Page 5: Media Player
- 200x200 album artwork display
- Song title, artist, and album information
- Volume up/down controls
- Play/pause button
- 3 configurable preset buttons (Sonos favorites/playlists)

### Page 6: Automations
- 4 quick action buttons for scripts, scenes, and automations
- Visual feedback for switch states
- One-tap execution

### Footer Navigation
- Previous page button
- Home button (returns to main page)
- Next page button
- Always visible at bottom

**Features:**
- Configurable timeout (10-600 seconds)
- Sleep Mode - Touch anywhere to wake
- Backlight control
- LVGL pause/resume for performance

## Backlight Dimming
For backlight dimming, a jumper need to be soldered to test pad "BL" to a data pin of the ESP, i.e. GPIO44, (the fifth pin down on the right side of the ESP32).


- [ESP32-S3-Touch-LCD Electrical Schematic](https://github.com/user-attachments/files/24413545/ESP32-S3-Touch-LCD-4.3B-Sch.pdf)
  
<img width="538" height="336" alt="Screenshot 2026-01-04 at 6 30 22 pm" src="https://github.com/user-attachments/assets/600a41a9-ef27-4dfb-ba97-9fb5aa3c0a94" />


![IMG_2020](https://github.com/user-attachments/assets/ab79999b-c92d-4ab9-99e3-9d4ea39b4a72)

## Encoder
Rotary encoder A/B	SD pins 3/5 → GPIO11/12	native
Button	SD pin 2 → EXIO4 (CH422G I2C expander)

## Speaker
Passive piezo (LEDC tone)	SD pin 7 → GPIO13	native, PWM-capable


## 📝 License

This project is provided as-is for personal use. Feel free to modify and adapt to your needs.


## 🔗 Related Projects

- [Media Album Art Converter](https://github.com/zembrzycki/convert-media-album-art) - Home Assistant integration for album art conversion
- [LCD Desk Stand](https://github.com/zembrzycki/waveshare-scene-controller) - 3D printable desk stand/enclosure
