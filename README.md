# ESP32-S3 CAM PIR Sensor Telegram

ESP32-S3 camera firmware project using ESP-IDF/PlatformIO.

Current firmware behavior:
- Starts a Wi-Fi Access Point (AP)
- Runs an HTTP server on port 80
- Shows a live MJPEG stream
- Supports single JPEG snapshot capture

## Project Status

This repository name mentions PIR sensor and Telegram integration, but the current `main/main.c` implementation focuses on camera streaming over local Wi-Fi AP.

Planned modules like PIR trigger handling and Telegram messaging can be added next.

## Features

- ESP32-S3 camera initialization (OV2640-style pin map)
- AP mode Wi-Fi hosting (`192.168.4.1`)
- Live stream endpoint: `/stream`
- Snapshot endpoint: `/capture`
- Simple built-in web UI at `/`

## Hardware

- ESP32-S3 board with camera support
- OV2640-compatible camera module
- 5V USB power source

Optional for future expansion:
- PIR motion sensor

## Default Camera Pin Map

Defined in `main/main.c`:

- `CAM_PIN_XCLK = 15`
- `CAM_PIN_SIOD = 4`
- `CAM_PIN_SIOC = 5`
- `CAM_PIN_D7 = 16`
- `CAM_PIN_D6 = 17`
- `CAM_PIN_D5 = 18`
- `CAM_PIN_D4 = 12`
- `CAM_PIN_D3 = 10`
- `CAM_PIN_D2 = 8`
- `CAM_PIN_D1 = 9`
- `CAM_PIN_D0 = 11`
- `CAM_PIN_VSYNC = 6`
- `CAM_PIN_HREF = 7`
- `CAM_PIN_PCLK = 13`

If your board uses a different schematic, update these values before flashing.

## Wi-Fi AP Defaults

Also in `main/main.c`:

- SSID: `bunleab`
- Password: `12345678`
- AP IP: `192.168.4.1`

Change these credentials before production use.

## Build Environment

`platformio.ini` is configured for:

- Platform: `espressif32`
- Board: `esp32-s3-devkitc-1`
- Framework: `espidf`

Dependencies:

- `espressif/esp32-camera`

## Build and Flash (PlatformIO)

1. Install VS Code + PlatformIO extension.
2. Open this folder in VS Code.
3. Connect your ESP32-S3 board over USB.
4. Build:

```bash
pio run
```

5. Flash:

```bash
pio run -t upload
```

6. Open serial monitor:

```bash
pio device monitor -b 115200
```

## Run and Test

1. Power/reset the board after flashing.
2. Connect phone/laptop to Wi-Fi AP `bunleab`.
3. Open:

```text
http://192.168.4.1
```

4. Verify:
- Live image appears on homepage
- Snapshot button opens `/capture`

## HTTP Endpoints

- `GET /` - Web interface
- `GET /stream` - Multipart MJPEG stream
- `GET /capture` - Single JPEG image

## Troubleshooting

- Black image / no stream:
	- Verify camera pin mapping matches your board
	- Check camera ribbon cable orientation
	- Confirm adequate power supply
- AP not visible:
	- Check serial logs for Wi-Fi startup messages
	- Reboot board and re-scan networks
- Upload fails:
	- Verify serial port and cable
	- Hold BOOT button while flashing if required by board

## Next Steps

- Add PIR sensor GPIO interrupt logic
- Capture and upload alert image on motion
- Integrate Telegram Bot API notifications
- Move credentials to safer config strategy

## License

Choose and add a license file if you plan to share this project publicly.
