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


## 🚀 Getting Started

1.  Clone this repository:
2.  Copy the config to your ESPHome directory:
    cp esphome/waveshare.yaml /config/esphome/
3.  Adjust substitutions for your environment (entity IDs, Wi-Fi, etc.).
4.  Compile and upload with ESPHome:
    esphome run waveshare.yaml
5.  Add the device in Home Assistant → Integrations.

![IMG_6874](https://github.com/user-attachments/assets/a904ddd5-30b8-4418-8ce4-49411fbe619f)

![IMG_6867](https://github.com/user-attachments/assets/1de4182e-911a-4392-92a2-ce2cf36a468a)

![IMG_6871](https://github.com/user-attachments/assets/7157b51e-23a6-4824-b150-a03ecfa286e5)

![IMG_6868](https://github.com/user-attachments/assets/81a52751-f4fd-4495-81eb-258b6e9988ae)

![IMG_6866](https://github.com/user-attachments/assets/3723311f-7263-4fb6-87a4-42b78f2951a3)


    
## 📝 Roadmap
 -  Add media artwork support
 -  Expand weather display with icons
 -  Add more advanced pages (security, cameras, etc.)

## 🤝 Contributing
Contributions are welcome! Please fork the repository and open a pull request with improvements.

## 📜 License
MIT License – feel free to use, modify, and share.

