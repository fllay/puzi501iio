#!/bin/sh
# DIAGNOSTIC (no typing required): "cannot type at Linux prompt" persists even as
# rdinit=/bin/sh (bypassing systemd entirely) -- but U-Boot (different driver, same
# hardware/pins) receives input fine. This polls /proc/interrupts automatically so we
# can see, just by watching the console, whether the RX interrupt for ttyPS1 ever
# fires while someone mashes keys -- no shell input needed to gather this.
mount -t proc proc /proc 2>/dev/null
mount -t sysfs sysfs /sys 2>/dev/null
mount -t devtmpfs devtmpfs /dev 2>/dev/null

echo ""
echo "=== DIAG: RX interrupt watch starting ==="
echo "=== Please mash keys on the keyboard continuously for the next ~20 seconds ==="
echo ""

# UART1 raw registers (base 0xFF010000): SR=0x2C (bit0=RXTRIG, bit1=RXEMPTY,
# bit3=TXEMPTY, bit4=TXFULL), ISR=0x14 (pending interrupt causes).
# If bytes are physically arriving but the driver has a bug draining the FIFO,
# SR's RXEMPTY bit will show 0 (non-empty) even though rx:0 in software stats.
echo "--- /proc/interrupts (uart line) at t=0 ---"
grep -i -E "CPU|uart" /proc/interrupts
echo "--- raw SR/ISR at t=0 ---"
echo "SR=$(busybox devmem 0xFF01002C w) ISR=$(busybox devmem 0xFF010014 w)"

i=1
while [ "$i" -le 10 ]; do
	sleep 2
	echo "--- t=${i}x2s ---"
	grep -i uart /proc/interrupts
	echo "SR=$(busybox devmem 0xFF01002C w) ISR=$(busybox devmem 0xFF010014 w)"
	i=$((i + 1))
done

echo ""
echo "=== DIAG done. Final /proc/tty state: ==="
cat /proc/tty/driver/xuartps 2>/dev/null
echo ""
echo "=== Dropping to interactive shell (still likely unresponsive to typing) ==="
exec /bin/sh
