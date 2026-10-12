#
# Configures a composite USB gadget on the dwc3 controller (now dr_mode=peripheral,
# see system-user.dtsi): a FunctionFS "IIO" interface (libiio's native USB
# protocol, served by iiod -F) plus a CDC-ECM network interface (plain USB
# Ethernet, static IP 192.168.2.1), matching how real PlutoSDR hardware and this
# board's own vendor firmware both present themselves over USB.
#
SUMMARY = "USB composite gadget: native libiio (FunctionFS) + CDC-ECM network"
LICENSE = "CLOSED"

SRC_URI = "file://usb-gadget-iio.sh \
           file://usb-gadget-iio.service \
"

S = "${WORKDIR}"

inherit systemd

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${S}/usb-gadget-iio.sh ${D}${bindir}/usb-gadget-iio.sh

	install -d ${D}${systemd_system_unitdir}
	install -m 0644 ${S}/usb-gadget-iio.service ${D}${systemd_system_unitdir}/usb-gadget-iio.service
}

FILES:${PN} = " \
    ${bindir}/usb-gadget-iio.sh \
    ${systemd_system_unitdir}/usb-gadget-iio.service \
"

RDEPENDS:${PN} = "libiio-iiod"

SYSTEMD_SERVICE:${PN} = "usb-gadget-iio.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

# The stock network-backend iiod.service and this gadget's own "iiod -F ..." both
# bind the default network TCP port unconditionally -- whichever starts first wins
# the race, the other crash-loops with "Bind failed: Address already in use".
# Fixed properly in meta-user/recipes-support/libiio/libiio_%.bbappend
# (SYSTEMD_AUTO_ENABLE:${PN}-iiod = "disable", set at image-build time) instead of
# here -- a pkg_postinst_ontarget "systemctl mask" was tried first and proved
# unreliable (can run before the target unit file even exists in the rootfs).
