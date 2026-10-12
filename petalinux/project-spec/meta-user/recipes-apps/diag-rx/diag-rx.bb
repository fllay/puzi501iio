#
# Diagnostic script installed at the rootfs root, used as rdinit= to automatically
# poll /proc/interrupts for the UART RX line without requiring any keyboard input
# (keyboard input is exactly what we're debugging -- it doesn't work yet).
#
SUMMARY = "RX interrupt diagnostic script"
LICENSE = "CLOSED"

SRC_URI = "file://diag.sh"

S = "${WORKDIR}"

do_install() {
	install -d ${D}/
	install -m 0755 ${S}/diag.sh ${D}/diag.sh
}

FILES:${PN} = "/diag.sh"
