# yocto-pitrezor
OS linux platform for the pitrezor project (usign yocto)

This code is used to build the linux platform image for the raspberry pi zero to be able to run the pitrezor software at bootup.

Note: This process will download and build a large amount of software, so be sure to allow at least 50GB of space on the host system and expect the process to take several hours.

## How to build pitrezor image?

# Build Release from Source natively
This process requires that you configure your environment to be able to use Bitbake. This allows you to make modifications to the recipe locally, as well as allowing you to modify/rebuild images without the full redownload/compile.

The steps are:
1. Install requirements on your system. (On Ubuntu 22.04 you will need to install these with something like: `sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales zip && sudo locale-gen en_US.UTF-8`)
2. Clone the repository: `git clone https://github.com/Walofz/yocto-pitrezor`
3. Nativate to the repository source folder: `cd yocto-pitrezor`
4. `./build-pitrezor-nodocker.sh`

## Configuration File Note
The piTrezor configuration file can be found in the `/boot` partition of the SD card after flashing it. (This will be the only partition visible if you are using something like a Windows PC)

An example of the configuration file can be seen below.

    # Scale factor of display when using hdmi or an FBCP-ILI9341 LCD HAT (1 to 16 inclusively)
    export TREZOR_OLED_SCALE=4
    
    # Type of oled to use
    #  NO OLED                  = 0
    #  OLED_ADAFRUIT_I2C_128x64 = 1
    #  OLED_SEEED_I2C_128x64    = 2
    #  OLED_SH1106_I2C_128x64   = 3
    #  OLED_ADAFRUIT_SPI_128x64 = 4
    #  OLED_SH1106_SPI_128x64   = 5
    export TREZOR_OLED_TYPE=0
    
    # Flip the display vertically. Set to 0 or 1 
    export TREZOR_OLED_FLIP=0
    
    # Set gpio number to use for the yes/no buttons
    export TREZOR_GPIO_YES=21
    export TREZOR_GPIO_NO=16
    
    # Enable fbcp-ili9431 based display if required (Don't set this to 1 if you have also enabled an SPI based display above)
    export ENABLE_FBCPILI9341_DISPLAY=1
	
	# Select Bitcoin Only Firmware if desired
    export BITCOIN_ONLY=0


