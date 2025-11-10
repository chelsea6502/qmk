# Thock Conundrum Keyboard Firmware

This is a preserved fork of QMK firmware (circa 2022) that maintains support for the ARM ATSAM SAMD51G18A microcontroller used in the Thock Conundrum keyboard. This support was removed from mainline QMK and is no longer actively maintained.

## ⚠️ Important Notes

- **This firmware is frozen in time** - Based on QMK v221015 (October 2022)
- **ARM ATSAM support was deprecated** - Official QMK removed this platform
- **Docker is required** - The build environment is containerized for reproducibility
- **Do not merge with modern QMK** - It will break compatibility with the Conundrum hardware

## Building the Firmware

### Prerequisites

- Docker (any version that supports the `qmkfm/qmk_firmware` image)
- This repository cloned locally
- Basic command line knowledge

### Build Command

```bash
./util/docker_build.sh thock/conundrum:default
```

**What this does:**
1. Pulls the QMK Docker image (contains all build tools)
2. Compiles the firmware inside the container
3. Outputs `thock_conundrum_default.bin` (~46KB)

### Custom Keymaps

If you've created a custom keymap in `keyboards/thock/conundrum/keymaps/your_name/`:

```bash
./util/docker_build.sh thock/conundrum:your_name
```

## Flashing the Firmware

### Step 1: Enter Bootloader Mode

Press this key combination on your keyboard:

**`LOWER + RAISE + Backspace`**

- Hold **LOWER** (bottom row, 5th key from left)
- Hold **RAISE** (bottom row, 8th key from right)
- While holding both, press **Backspace** (top right corner)

### Step 2: Flash the Firmware

The keyboard uses a **UF2 bootloader** and will appear as a USB drive when in bootloader mode.

**Simple method (drag and drop):**
1. The keyboard mounts as a USB drive in Finder/Explorer
2. Drag `thock_conundrum_default.bin` onto the drive
3. The keyboard automatically flashes and reboots
4. Done!

**Alternative method:**
- Use [QMK Toolbox](https://github.com/qmk/qmk_toolbox/releases) (if still available)
- Or any UF2-compatible flashing tool

## Troubleshooting

### Build Issues

**"Docker image not found"**
- The `qmkfm/qmk_firmware` image may no longer be available
- You may need to build from the Dockerfile in this repository
- Or use a locally cached version if you have one

**"Submodule errors"**
- Run: `make git-submodule`
- This updates the ChibiOS and other dependencies

### Flashing Issues

**"Keyboard not entering bootloader mode"**
- Try the key combo multiple times
- Some units may have a physical reset button on the PCB
- Check for a small button or hole on the bottom of the keyboard

**"USB drive not appearing"**
- Try different USB ports
- Try a different USB cable
- The bootloader may take a few seconds to mount

**"Keys not registering after flash"**
- This is a known race condition with the EC Touch sensors
- Unplug and replug the keyboard 2-3 times until it works
- The sensors need time to stabilize on first connect

## Technical Details

### Hardware
- **MCU:** ARM ATSAM SAMD51G18A (Cortex-M4)
- **Matrix:** 4x12 capacitive touch (EC Touch)
- **Bootloader:** UF2 (USB Mass Storage)
- **USB VID:PID:** 0x04D8:0xEED2

### Why This Fork Exists

The Conundrum keyboard uses capacitive touch sensing and an ARM ATSAM microcontroller. QMK removed ARM ATSAM support in favor of more modern platforms (STM32, RP2040). This fork preserves the last working version for this hardware.

### Future-Proofing

If you're reading this years from now:

1. **Keep this repository** - It may be the only working firmware source
2. **Archive the Docker image** - `docker save qmkfm/qmk_firmware > qmk-image.tar`
3. **Save your compiled `.bin` files** - They may be the last working firmware
4. **Document your keymap** - The source code is your only reference

### Known Issues

- **First connect race condition:** Keys may not register on first USB connection. Unplug and replug 2-3 times.
- **Touch sensitivity:** Thresholds are hardcoded in `matrix.c` (lines 69-72). Adjust if needed.
- **No VIA/VIAL support:** Dynamic keymap editing is not available.

## License

GPL v2 or later (inherited from QMK)

## Acknowledgments

- Original QMK firmware by Jack Humbert and contributors
- Thock.co for the Conundrum keyboard design
- ARM ATSAM support maintained by the QMK community (2018-2022)
