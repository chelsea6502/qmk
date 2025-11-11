# Thock Conundrum Keyboard Firmware

Preserved QMK fork for the Thock Conundrum keyboard (ARM ATSAM SAMD51G18A).

## Building

```bash
./build-conundrum.sh
```

Outputs `thock_conundrum_default.bin` (~46KB)

### Custom Keymap

```bash
keymap=your_name:uf2 ./build-conundrum.sh
```

## Flashing

1. Enter bootloader: **`LOWER + RAISE + Backspace`**
2. Drag `thock_conundrum_default.bin` onto the USB drive that appears
3. Done

**Note:** If keys don't register after flashing, unplug and replug 2-3 times (known EC Touch sensor race condition).

## Requirements

- Docker
- This repository

## License

GPL v2 or later
