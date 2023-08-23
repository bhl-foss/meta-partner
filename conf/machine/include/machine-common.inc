
# Common supported machine features
MACHINE_FEATURES:append = " \
    bluetooth \
    efi \
    keyboard \
    rtc \
    screen \
    serial \
    touchscreen \
    usbgadget \
    usbhost \
    wifi \
"

# Common unsupported machine features
MACHINE_FEATURES:remove = " \
    3g \
    pcbios \
    phone \
    pcmcia \
"
