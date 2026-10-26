# ESP32-S3 Camera, PIR Motion Detection & Telegram Alerts

[![Development Status](https://img.shields.io/badge/status-in%20development-orange?style=for-the-badge)](#project-status)
[![PlatformIO](https://img.shields.io/badge/PlatformIO-ESP--IDF-orange?style=for-the-badge&logo=platformio&logoColor=white)](https://platformio.org/)
[![ESP32-S3](https://img.shields.io/badge/Hardware-ESP32--S3-E7352C?style=for-the-badge&logo=espressif&logoColor=white)](https://www.espressif.com/en/products/socs/esp32-s3)
[![LinkedIn Demo](https://img.shields.io/badge/LinkedIn-View%20Demo-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://lnkd.in/p/gA9THYsg)

An embedded camera project built around the **ESP32-S3**, using ESP-IDF through PlatformIO to provide a local Wi-Fi camera interface, live MJPEG streaming, and JPEG snapshot capture.

The project is intended to evolve into an IoT motion-monitoring system with PIR-triggered image capture and Telegram notifications.

> **Current implementation:** Local Wi-Fi access point, HTTP server, live camera streaming, and snapshot capture. PIR integration and Telegram messaging are planned extensions.

## Table of Contents

- [Overview](#overview)
- [Project Status](#project-status)
- [Features](#features)
- [System Architecture](#system-architecture)
- [Hardware Requirements](#hardware-requirements)
- [Camera Pin Configuration](#camera-pin-configuration)
- [Wi-Fi Configuration](#wi-fi-configuration)
- [Technology Stack](#technology-stack)
- [Getting Started](#getting-started)
- [HTTP API](#http-api)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Roadmap](#roadmap)
- [Security Considerations](#security-considerations)
- [Demo](#demo)
- [License](#license)

## Overview

This project explores embedded firmware development for camera-enabled IoT applications using the ESP32-S3 and the ESP-IDF framework.

The firmware creates a standalone Wi-Fi access point, allowing a phone or computer to connect directly to the board and access a browser-based camera interface without requiring an external router.

The current implementation provides:

- Camera initialization using an OV2640-compatible pin configuration.
- Wi-Fi access point operation.
- An HTTP server listening on port `80`.
- Live MJPEG video streaming.
- Single JPEG image capture.
- A built-in web interface for camera access.

The planned direction is to integrate a PIR motion sensor and a Telegram bot to build a more complete embedded surveillance and motion-alert system.

## Project Status

| Component | Status |
|---|---|
| ESP32-S3 camera initialization | Implemented |
| Wi-Fi AP mode | Implemented |
| HTTP server | Implemented |
| Live MJPEG stream | Implemented |
| JPEG snapshot endpoint | Implemented |
| Browser-based camera interface | Implemented |
| PIR motion detection | Planned |
| Motion-triggered image capture | Planned |
| Telegram bot notifications | Planned |
| Secure credential configuration | Planned |

**Development stage:** Initial camera-streaming implementation.

The repository name describes the intended complete system, while the current firmware focuses on the camera and local web interface.

## Features

### Implemented

- **Embedded camera firmware:** Camera initialization and frame capture.
- **Standalone Wi-Fi:** Connect directly to the ESP32-S3 access point.
- **HTTP camera interface:** Access the camera through a browser.
- **MJPEG streaming:** View a sequence of JPEG frames through `/stream`.
- **Snapshot capture:** Retrieve a single JPEG image through `/capture`.
- **Browser interface:** Open the homepage to access the camera.

### Planned

- PIR sensor input for motion detection.
- Motion-triggered image capture.
- Telegram Bot API integration.
- Event notifications with captured images.
- Improved credential management and access control.

## System Architecture

### Current implementation

```text
        Phone / Laptop
               |
          Wi-Fi Access
               |
       ESP32-S3 Access Point
               |
        Embedded HTTP Server
               |
       ESP32-S3 Camera Module
               |
        JPEG Frame Capture
               |
        +------+------+
        |             |
    MJPEG Stream   JPEG Snapshot
      /stream       /capture
```

### Planned motion-alert architecture

```text
      PIR Motion Sensor
               |
          ESP32-S3 GPIO
               |
       Motion Event Logic
               |
       Capture Camera Image
               |
       Wi-Fi Connectivity
               |
       Telegram Bot API
               |
       Telegram Notification
```

The second diagram represents the planned extension, not the current firmware behavior.

## Hardware Requirements

| Component | Purpose |
|---|---|
| ESP32-S3 development board | Main embedded controller |
| OV2640-compatible camera | Image acquisition |
| USB cable and suitable power source | Programming and power |
| PIR motion sensor (optional) | Planned motion detection |

Hardware compatibility depends on the specific ESP32-S3 board, camera connector, pin assignments, and power requirements.

## Camera Pin Configuration

The following GPIO assignments are currently defined in `main/main.c`.

| Camera Signal | ESP32-S3 GPIO |
|---|---:|
| XCLK | 15 |
| SIOD | 4 |
| SIOC | 5 |
| D7 | 16 |
| D6 | 17 |
| D5 | 18 |
| D4 | 12 |
| D3 | 10 |
| D2 | 8 |
| D1 | 9 |
| D0 | 11 |
| VSYNC | 6 |
| HREF | 7 |
| PCLK | 13 |

**Important:** Verify these assignments against your board schematic before flashing the firmware. Camera pin mappings are board-specific.

## Wi-Fi Configuration

The current firmware uses the following access point configuration:

| Parameter | Default |
|---|---|
| SSID | `bunleab` |
| Password | `12345678` |
| IP address | `192.168.4.1` |
| HTTP port | `80` |

These values describe the current configuration, not recommended production credentials.

Change the default password and avoid committing real credentials to a public repository.

## Technology Stack

[![C](https://img.shields.io/badge/Language-C-A8B9CC?style=flat&logo=c&logoColor=black)](https://en.cppreference.com/w/c)
[![ESP-IDF](https://img.shields.io/badge/Framework-ESP--IDF-E7352C?style=flat&logo=espressif&logoColor=white)](https://docs.espressif.com/projects/esp-idf/en/stable/esp32s3/)
[![PlatformIO](https://img.shields.io/badge/Build-PlatformIO-orange?style=flat&logo=platformio&logoColor=white)](https://platformio.org/)
[![Wi-Fi](https://img.shields.io/badge/Connectivity-Wi--Fi-blue?style=flat)](https://www.espressif.com/en/solutions/low-power-connectivity/wi-fi)
[![HTTP](https://img.shields.io/badge/Protocol-HTTP-lightgrey?style=flat)](https://developer.mozilla.org/en-US/docs/Web/HTTP)

- **Programming language:** C
- **Microcontroller:** ESP32-S3
- **Firmware framework:** ESP-IDF
- **Development environment:** VS Code and PlatformIO
- **Camera:** OV2640-compatible module
- **Networking:** Wi-Fi access point
- **Application protocol:** HTTP
- **Video delivery:** MJPEG over HTTP
- **Image format:** JPEG

The project configuration includes the `espressif/esp32-camera` component.

## Getting Started

### Prerequisites

Install:

1. [Visual Studio Code](https://code.visualstudio.com/)
2. [PlatformIO IDE extension](https://platformio.org/install/ide?install=vscode)
3. A compatible ESP32-S3 board with a camera.
4. A USB cable capable of data transfer.

### Project Configuration

The `platformio.ini` configuration specifies:

- Platform: `espressif32`
- Board: `esp32-s3-devkitc-1`
- Framework: `espidf`

Check that the selected board matches your hardware before building.

### Build Firmware

Open the project directory in VS Code, then run:

```bash
pio run
```

### Flash the Board

Connect the ESP32-S3 through USB and run:

```bash
pio run -t upload
```

If automatic flashing fails, select the correct serial port or follow your board's bootloader instructions.

### Open the Serial Monitor

```bash
pio device monitor -b 115200
```

Use the serial output to inspect startup messages, Wi-Fi initialization, and camera errors.

## HTTP API

The embedded HTTP server currently exposes the following endpoints.

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/` | Browser-based camera interface |
| `GET` | `/stream` | Multipart MJPEG video stream |
| `GET` | `/capture` | Single JPEG snapshot |

### Access the Camera

After flashing the firmware:

1. Power on or reset the board.
2. Connect your phone or laptop to the `bunleab` Wi-Fi network.
3. Open the following address in a browser:

```text
http://192.168.4.1
```

4. Use the homepage to view the camera stream.
5. Test the snapshot endpoint directly:

```text
http://192.168.4.1/capture
```

To access the live stream directly:

```text
http://192.168.4.1/stream
```

These addresses are intended for devices connected to the ESP32-S3 access point.

## Testing

Use this checklist to verify the current firmware.

- [ ] Firmware builds successfully.
- [ ] ESP32-S3 boots without camera initialization errors.
- [ ] The Wi-Fi access point becomes visible.
- [ ] A phone or laptop can connect to the access point.
- [ ] The homepage loads successfully.
- [ ] The MJPEG stream displays camera frames.
- [ ] The snapshot endpoint returns a JPEG image.

PIR and Telegram tests should be added after those modules have been implemented.

## Troubleshooting

### Black image or missing stream

- Verify the camera pin mapping.
- Check the camera ribbon cable orientation.
- Confirm the camera is supported by the selected component configuration.
- Check the serial logs for initialization errors.
- Verify that the power source can handle the board and camera.

### Wi-Fi access point is not visible

- Check the serial monitor for Wi-Fi startup errors.
- Confirm that the board has booted successfully.
- Reset the board and scan for networks again.
- Verify the configured SSID and Wi-Fi mode.

### Firmware upload fails

- Check the USB cable and serial port.
- Close applications that may be using the serial device.
- Hold the BOOT button if required by the board.
- Confirm the PlatformIO board configuration.

### Camera streaming is unstable

- Inspect the available heap and PSRAM configuration.
- Review camera frame size and frame-buffer settings.
- Check power stability and serial logs.
- Test the stream and snapshot endpoints separately.

## Security Considerations

This project is currently intended for development and local testing.

Before using it in a real environment:

- Replace the default Wi-Fi password.
- Do not commit Wi-Fi passwords or Telegram bot tokens.
- Remember that a local HTTP server without authentication may expose the camera to anyone connected to the access point.
- Protect Telegram credentials and avoid printing secrets in logs.
- Use authenticated and encrypted communication for any future remote-access design.

## Demo

View the project demo on LinkedIn:

[![Watch Demo on LinkedIn](https://img.shields.io/badge/Watch%20Project%20Demo-LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://lnkd.in/p/gA9THYsg)

**Demo link:** https://lnkd.in/p/gA9THYsg

## License

No license has been specified yet. If you intend to publish or distribute this project, choose an appropriate open-source license and add the corresponding `LICENSE` file.

---

**Project focus:** Embedded Systems · Firmware Engineering · ESP-IDF · IoT Camera Systems · Motion Monitoring · Telegram Automation

Built as an ongoing embedded systems development project.
