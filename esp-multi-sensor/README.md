# ESP Multi-Sensor
This repository contains the code and documentation for a multi-sensor to be used with Home Assistant. The sensor records data (temperature, humidity, illuminance, and motion) every minute, and reports these values to the self-hosted Home Assistant instance using MQTT.

This project is written in Rust using the Embassy framework.

## Hardware
- NodeMCU ESP-12E (ESP8266)
- DHT11 Temperature & Humidity Sensor
- HC-SR501 PIR Motion Sensor
- DIYables LDR Light Sensor

## Future Improvements
- Use collected data to perform automated tasks (turn lights on/off, open/close shades, turn fan on/off, etc.).
- Create streamlined hardware including:
    - Custom PCB
    - 3D-printed case
    - Coin battery power circuit