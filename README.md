# Waveshare ESPHome Project

A custom [ESPHome](https://esphome.io/) configuration for driving a Waveshare display with a rich LVGL-based interface.  
This project integrates directly with [Home Assistant](https://www.home-assistant.io/) to provide control and status for lights, thermostat, weather, and more.

## ✨ Features

- 📺 **Waveshare Display Support**  
  Fully configured LVGL UI with multiple pages and widgets.

- 💡 **Lights Control**  
  Dedicated page for toggling lights and showing current states.

- 🌡️ **Thermostat Page**  
  Interactive temperature controls with step adjustments.

- ⛅ **Weather Widget**  
  Current conditions and forecast pulled from Home Assistant sensors.

- ⚡ **Home Assistant Integration**  
  Bi-directional sync with entities, sensors, and automations.

- 🎨 **Custom Styling**  
  Headers, labels, and layouts styled for readability and consistency.

## 🛠️ Requirements

- ESP32 board (tested with **ESP32-WROOM**)
- Waveshare display (tested with **Waveshare 4.3" RGB**)
- Home Assistant instance with ESPHome integration
- LVGL support enabled in ESPHome (built-in)

