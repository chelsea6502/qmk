# Conundrum UF2 Bootloader Files

This directory contains a backup of the files that appear when the Conundrum keyboard is in bootloader mode.

## Files

- **`CURRENT.UF2`** (524KB) - Current firmware backup from the keyboard
- **`INFO_UF2.TXT`** - Bootloader information
- **`INDEX.HTM`** - Redirects to thock.co website

## Bootloader Information

```
UF2 Bootloader v3.9.0-7-g2b5c0f5 SFHO
Model: Conundrum
Board-ID: thock.co-conundrum-v1
```

## Purpose

These files are preserved for:
1. **Firmware backup** - `CURRENT.UF2` is a snapshot of working firmware
2. **Bootloader identification** - Confirms UF2 version and board ID
3. **Historical reference** - Documents the original bootloader state

## Usage

### Restoring from Backup

If you need to restore the original firmware:

1. Enter bootloader mode (`LOWER + RAISE + Backspace`)
2. Copy `CURRENT.UF2` to the mounted USB drive
3. The keyboard will flash and reboot

### Flashing New Firmware

To flash newly compiled firmware:

1. Build firmware: `./util/docker_build.sh thock/conundrum:default`
2. Enter bootloader mode
3. Copy `thock_conundrum_default.bin` to the mounted USB drive
4. The keyboard will flash and reboot

## Notes

- The `CURRENT.UF2` file is from December 25, 2018
- This represents the factory firmware or an early version
- Keep this file safe as a known-working baseline
- The UF2 format is a Microsoft format for flashing microcontrollers via USB mass storage