# The stock network-backend iiod.service and the usb-gadget-iio recipe's own
# "iiod -F ..." both bind the default network TCP port unconditionally -- nothing
# in the -F invocation disables networking. Whichever starts first wins the race;
# the other crash-loops with "Bind failed: Address already in use". Since the
# gadget's iiod already serves network access incidentally, disable auto-start of
# the redundant stock service at image-build time (the correct, race-free way to
# do this -- a pkg_postinst_ontarget "systemctl mask" was tried first and proved
# unreliable, since postinst-at-target scripts can run before this unit file even
# exists in the rootfs).
SYSTEMD_AUTO_ENABLE:${PN}-iiod = "disable"
