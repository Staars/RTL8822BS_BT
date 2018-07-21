# RTL8822BS_BT

A modified version of rtk_hciattach and a script to turn on bluetooth on a Z28pro with rtl8822bs. Probably this is not useful for other boxes.
On the Z28pro (2/16) BT is connected via ttyS2 and uses 3-wire-protocol.

Copy firmware and config to /lib/firmware/rtlbt/ and remove the .bin-endings.

You must disconnect your USB-UART-adapter, if you use it as an external serial console. For me it is enough to unplug it from the USB-port and leave the cables connected to the PCB.
