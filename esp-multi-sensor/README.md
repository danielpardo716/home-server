# ESP Multi-Sensor
This repository contains the code and documentation for a multi-sensor to be used with Home Assistant. The sensor records data (temperature, humidity, illuminance, and motion) every minute, and reports these values to the self-hosted Home Assistant instance using MQTT.

## Hardware
- ESP32 (38-Pin)
- DHT11 Temperature & Humidity Sensor
- HC-SR501 PIR Motion Sensor
- DIYables LDR Light Sensor

## Software
This project is written in Rust using WSL2 (Ubuntu 24.04 LTS) for development.
- no_std
- [espup](https://github.com/esp-rs/espup) - tool for ESP toolchain installation/maintenance
- cargo-espflash - tool for flashing ESP

## Future Improvements
- Use collected data to perform automated tasks (turn lights on/off, open/close shades, turn fan on/off, etc.).
- Create streamlined hardware including:
    - Custom PCB
    - 3D-printed case
    - Coin battery power circuit

## References
- [rust-dd](https://rust-dd.com/post/introduction-to-embedded-systems-with-rust-a-beginner-s-guide-using-esp32)