#!/bin/sh
# Configure a composite USB gadget on the dwc3 controller (now forced to
# dr_mode=peripheral, see system-user.dtsi) with two functions, matching how
# real PlutoSDR hardware presents itself over USB:
#   1. A FunctionFS "IIO" interface -- libiio's native, non-IP USB protocol
#      (iiod -F ...). Host-side discovery (iio_info -s, "usb:" context URIs)
#      matches by the gadget's "IIO" interface string, not by VID/PID.
#   2. A CDC-ECM interface -- presents as a plain USB-Ethernet adapter, giving
#      ordinary IP connectivity (ssh, ping, the normal network iiod) over the
#      same cable. This is the same interface class the board's own vendor
#      firmware uses for its "usb0" interface.
# Both live in the same USB configuration, so both are present simultaneously.

GADGET=/sys/kernel/config/usb_gadget/g_iio
FFS_MNT=/dev/ffs-iio
ECM_DEV_ADDR="02:1a:2b:3c:4d:01"   # device side of the virtual Ethernet link
ECM_HOST_ADDR="02:1a:2b:3c:4d:02"  # host side, as seen by the PC
ECM_DEV_IP="192.168.2.1/24"        # matches the well-known Pluto convention

log() {
	echo "usb-gadget-iio: $*" | systemd-cat -t usb-gadget-iio 2>/dev/null || echo "usb-gadget-iio: $*"
}

if [ -d "$GADGET" ]; then
	log "already configured, exiting"
	exit 0
fi

mountpoint -q /sys/kernel/config || mount -t configfs none /sys/kernel/config

mkdir -p "$GADGET" || { log "failed to create $GADGET"; exit 1; }
cd "$GADGET" || exit 1

echo 0x1209 > idVendor      # pid.codes shared test/hobbyist VID
echo 0x0001 > idProduct     # arbitrary PID within that pool
echo 0x0320 > bcdUSB        # advertise USB 3.2 Gen1 (SuperSpeed) capability
echo 0x0100 > bcdDevice

mkdir -p strings/0x409
echo "P501-0001"             > strings/0x409/serialnumber
echo "Puzhi"                  > strings/0x409/manufacturer
echo "P501 SDR (IIO gadget)"  > strings/0x409/product

mkdir -p configs/c.1/strings/0x409
echo "IIO+ECM"  > configs/c.1/strings/0x409/configuration
echo 250         > configs/c.1/MaxPower

mkdir -p functions/ffs.iio
ln -s functions/ffs.iio configs/c.1/

mkdir -p functions/ecm.usb0
echo "$ECM_DEV_ADDR"  > functions/ecm.usb0/dev_addr
echo "$ECM_HOST_ADDR" > functions/ecm.usb0/host_addr
ln -s functions/ecm.usb0 configs/c.1/

mkdir -p "$FFS_MNT"
mountpoint -q "$FFS_MNT" || mount -t functionfs iio "$FFS_MNT"

# iiod opens ep0 and writes the FFS descriptors synchronously at startup --
# only after that can the gadget be bound to a UDC and enumerate on the bus.
/usr/sbin/iiod -F "$FFS_MNT" -n 3 &
sleep 0.5

UDC=$(ls /sys/class/udc 2>/dev/null | head -n1)
if [ -z "$UDC" ]; then
	log "no UDC found -- is dr_mode really peripheral on usb@fe200000?"
	exit 1
fi

echo "$UDC" > UDC || { log "failed to bind gadget to UDC $UDC"; exit 1; }

# usb0 only appears once the gadget is bound to a UDC; wait briefly for it.
for i in $(seq 1 20); do
	[ -e /sys/class/net/usb0 ] && break
	sleep 0.1
done
if [ -e /sys/class/net/usb0 ]; then
	ip addr add "$ECM_DEV_IP" dev usb0 2>/dev/null
	ip link set usb0 up
	log "usb0 up at $ECM_DEV_IP"
else
	log "usb0 never appeared after UDC bind"
fi

log "bound to UDC $UDC, iiod serving $FFS_MNT"
